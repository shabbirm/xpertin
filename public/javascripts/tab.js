
/***********************************************
* Tab Content script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

//Set tab to intially be selected when page loads:
//[which tab (1=first tab), ID of tab content to display]:
//var initialtab=[1, "tab1"]

////////Stop editting////////////////
var arraycontent = new Object()

function cascadedstyle(el, cssproperty, csspropertyNS){
	if (el.currentStyle)
	return el.currentStyle[cssproperty]
	else if (window.getComputedStyle) {
		var elstyle=window.getComputedStyle(el, "")
		return elstyle.getPropertyValue(csspropertyNS)
	}
}

var previoustab=""

function expandcontent(cid, aobject, dir){
	if (document.getElementById) {
		highlighttab(aobject)
		detectSourceindex(aobject)
		if (previoustab!="")
			document.getElementById(previoustab).style.display="none"
			document.getElementById(cid).style.display="block"
			loadtab(cid, dir)
			previoustab=cid
		if (aobject.blur)
			aobject.blur()
		return false
	} else 
		return true
}

function highlighttab(aobject){
	if (typeof tabobjlinks=="undefined")
		collecttablinks()
	for (i=0; i<tabobjlinks.length; i++)
		tabobjlinks[i].className = '';
		//tabobjlinks[i].style.backgroundColor=initTabcolor
	/*
	var themecolor=aobject.getAttribute("theme")? aobject.getAttribute("theme") : initTabpostcolor
		aobject.style.backgroundColor=document.getElementById("tabcontentcontainer").style.backgroundColor=themecolor
		*/
	aobject.className = 'current';
}

function collecttablinks(){
	var tabobj=document.getElementById("tablist")
	tabobjlinks=tabobj.getElementsByTagName("span")
}

function detectSourceindex(aobject){
	for (i=0; i<tabobjlinks.length; i++) {
		if (aobject==tabobjlinks[i]) {
			tabsourceindex=i //source index of tab bar relative to other tabs
			break
		}
	}
}

function do_onload(){
	var cookiename=(persisttype=="sitewide")? "tabcontent" : window.location.pathname
	var cookiecheck=window.get_cookie && get_cookie(cookiename).indexOf("|")!=-1
	collecttablinks()
	initTabcolor=cascadedstyle(tabobjlinks[1], "backgroundColor", "background-color")
	initTabpostcolor=cascadedstyle(tabobjlinks[0], "backgroundColor", "background-color")
	if (typeof enablepersistence!="undefined" && enablepersistence && cookiecheck) {
		var cookieparse=get_cookie(cookiename).split("|")
		var whichtab=cookieparse[0]
		var tabcontentid=cookieparse[1]
		expandcontent(tabcontentid, tabobjlinks[whichtab])
	} else {
		expandcontent(initialtab[1], tabobjlinks[initialtab[0]-1])
	}
}

if (window.addEventListener)
	window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
	window.attachEvent("onload", do_onload)
else if (document.getElementById)
	window.onload=do_onload

var enablepersistence=false //true to enable persistence, false to turn off (or simply remove this entire script block).
var persisttype="local" //enter "sitewide" for Tab content order to persist across site, "local" for this page only

function get_cookie(Name) { 
	var search = Name + "="
	var returnvalue = "";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search)
		if (offset != -1) { 
			offset += search.length
			end = document.cookie.indexOf(";", offset);
			if (end == -1) end = document.cookie.length;
			returnvalue=unescape(document.cookie.substring(offset, end))
		}
	}
	return returnvalue;
}

function savetabstate(){
	var cookiename=(persisttype=="sitewide")? "tabcontent" : window.location.pathname
	var cookievalue=(persisttype=="sitewide")? tabsourceindex+"|"+previoustab+";path=/" : tabsourceindex+"|"+previoustab
	document.cookie=cookiename+"="+cookievalue
}

function loadtab(id, dir) {
	if (! arraycontent[id]) {
		$(id).innerHTML = '<fieldset><div style="text-align:center;margin-top:100px;height:300px;"><br /><img src="/images/loading.gif" /><h3>Loading...</h3></div></fieldset>'
		var params = 'ts=' + new Date().getTime() + '&action_name=' + $('cvForm').action
		var url = '/cvs/cv_tab/' + id.replace('tab_', '')
		var myAjax = new Ajax.Updater(id, url, {method: 'get', parameters: params, evalScripts: true,
			onComplete: function(transport) {
				arraycontent[id] = true
				setcurrenttab(dir)
			}
		});
	} else {
		setcurrenttab(dir)
	}
}

function setcurrenttab(dir) {
	if (dir && dir == 'n') {
		current_tab++
	} else if (dir && dir == 'p') {
		current_tab--
	}
	enableButtons();
}

window.onunload=savetabstate
