function clearForm(form) {
	var count = form.elements.length
	for (i = 0; i < count; i++) {
		var type = form.elements[i].type
		if (type != 'hidden' && type != 'submit' && type != 'button') {
			Field.clear(form.elements[i]);
		}
	}
}

function populateContacts(clientList, contactListId) {
	clientId = Form.Element.getValue(clientList)
	url = '/backend/load_contacts/' + clientId + '?list_id=' + contactListId
	params = 'ts=' + new Date().getTime(); 

	var myAjax = new Ajax.Request(url, { method: 'get', parameters: params, 
		onLoading: function(transport) {
			Element.show('contactLoadingIndicator');
		}, 
		onComplete: function(transport) {
			populateContactList(contactListId, transport)
		}
	});
}

function populateContactsForJob(jobList, contactListId) {
	jobId = Form.Element.getValue(jobList)
	url = '/jobs/contacts/' + jobId
	params = 'ts=' + new Date().getTime(); 
	var myAjax = new Ajax.Request(url, { method: 'get', parameters: params, 
		onLoading: function(transport) {
			Element.show('contactLoadingIndicator');
		}, 
		onComplete: function(transport) {
			populateContactList(contactListId, transport)
		}
	});
}

function populateSubCategories(categoryList, subCategoryListId) {
	categoryId = Form.Element.getValue(categoryList)
	url = '/job_categories/sub_categories/' + categoryId
	params = 'ts=' + new Date().getTime(); 
	var myAjax = new Ajax.Request(url, { method: 'get', parameters: params, 
		onLoading: function(transport) {
			Element.show('categoryLoadingIndicator');
		}, 
		onComplete: function(transport) {
			categories = eval(transport.responseText)
			list = $(subCategoryListId)
			for (i = list.length; i > 0; i--) {
				list.options[i - 1] = null;	
			}
			for (i = 0; i < categories.length; i++) {
				cat = categories[i]
				list.options[list.length] = new Option(cat.name, cat.id, false, false);
			}
			Element.hide('categoryLoadingIndicator');
		}
	});
}

function populateOpenJobs(companyList, jobListId) {
	companyId = Form.Element.getValue(companyList)
	url = '/brief_takes/open_jobs_by_company/' + companyId
	params = 'ts=' + new Date().getTime(); 
	var myAjax = new Ajax.Request(url, { method: 'get', parameters: params, 
		onLoading: function(transport) {
			Element.show('jobLoadingIndicator');
		}, 
		onComplete: function(transport) {
			populateJobList(jobListId, transport)
		}
	});
}

function populateJobs(companyList, jobListId) {
	companyId = Form.Element.getValue(companyList)
	url = '/brief_takes/jobs_by_company/' + companyId
	params = 'ts=' + new Date().getTime(); 
	var myAjax = new Ajax.Request(url, { method: 'get', parameters: params, 
		onLoading: function(transport) {
			Element.show('jobLoadingIndicator');
		}, 
		onComplete: function(transport) {
			populateJobList(jobListId, transport)
		}
	});
}


function populateJobList(jobListId, transport) {
	jobs = eval(transport.responseText)
	list = $(jobListId)
	for (i = list.length; i > 0; i--) {
		list.options[i - 1] = null;	
	}
	list.options[0] = new Option('', '', false, false);
	for (i = 0; i < jobs.length; i++) {
		job = jobs[i]
		list.options[list.length] = new Option(job[1], job[0], false, false);
	}
	Element.hide('jobLoadingIndicator');
}

function populateContactList(contactListId, transport) {
	contacts = eval(transport.responseText)
	list = $(contactListId)
	for (i = list.length; i > 0; i--) {
		list.options[i - 1] = null;	
	}
	for (i = 0; i < contacts.length; i++) {
		contact = contacts[i].attributes
		list.options[list.length] = new Option(contact.name + '<' + contact.email + '>', contact.id, false, false);
	}
	Element.hide('contactLoadingIndicator');
}

function closePopup() {
	Element.hide('cover', 'modalWindow')
}

function toggleCheckboxes(control) {
	var checkboxes = control.form['ids[]'];
	if (checkboxes.length) {
		for (i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = control.checked
		}
	} else {
		checkboxes.checked = control.checked;
	}
}

function checkboxSelected(checkbox) {
  var anyChecked = false;
  if (checkbox.length) {
    for (i = 0; i < checkbox.length; i++) {
      if (checkbox[i].checked) {
        anyChecked = true;
		break;
      }
    }
  } else if (checkbox.checked) {
      anyChecked = true;
  }
  return anyChecked;
}

function serializeCheckbox(checkbox, param_name) {
	var params = ''
	if (checkbox) {
		if (checkbox.length) {
			for (i = 0; i < checkbox.length; i++) {
				if (checkbox[i].checked) {
					params += '&' + param_name + '=' + checkbox[i].value;
				}
			}
		} else if (checkbox.checked) {
			params += '&' + param_name + '=' + checkbox.value;
		}
	}
	return params;
}

function showCalendar(id, format, showsTime, showsOtherMonths) {
  var el = document.getElementById(id);
  if (_dynarch_popupCalendar != null) {
    // we already have some calendar created
    _dynarch_popupCalendar.hide();                 // so we hide it first.
  } else {
    // first-time call, create the calendar.
    var cal = new Calendar(1, null, selected, closeHandler);
    // uncomment the following line to hide the week numbers
    // cal.weekNumbers = false;
    if (typeof showsTime == "string") {
      cal.showsTime = true;
      cal.time24 = (showsTime == "24");
    }
    if (showsOtherMonths) {
      cal.showsOtherMonths = true;
    }
    _dynarch_popupCalendar = cal;                  // remember it in the global var
    cal.setRange(1900, 2070);        // min/max year allowed.
    cal.create();
  }
  _dynarch_popupCalendar.setDateFormat(format);    // set the specified date format
  _dynarch_popupCalendar.parseDate(el.value);      // try to parse the text in field
  _dynarch_popupCalendar.sel = el;                 // inform it what input field we use

  // the reference element that we pass to showAtElement is the button that
  // triggers the calendar.  In this example we align the calendar bottom-right
  // to the button.
  _dynarch_popupCalendar.showAtElement(el.nextSibling, "Br");        // show the calendar

  return false;
}
