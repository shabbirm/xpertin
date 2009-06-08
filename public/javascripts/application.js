// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function promptToRemote(text, param, url) {
    value = prompt(text + ':');
	if (value) {
		new Ajax.Request(url + '?' + param + '=' + encodeURIComponent(value),{method :'get'} );
        return false;
    }
}

/* shows and hides ajax indicator */
Ajax.Responders.register({
    onCreate: function(){
        if ($('ajax-indicator') && Ajax.activeRequestCount > 0) {
            Element.show('ajax-indicator');
        }
    },
    onComplete: function(){
        if ($('ajax-indicator') && Ajax.activeRequestCount == 0) {
            Element.hide('ajax-indicator');
        }
    }
});
