function actionTypeChanged() {
	var select = document.getElementById('base_selector');
	var currentVal = select.options[select.selectedIndex].value;
	clearActionForm();
	if (currentVal != '') {
		populateActionForm(currentVal);
	}
}

function populateActionForm(actionTypeId) {
	var r = new XMLHttpRequest();
	r.open("GET", "data.php?request=action_params&action_type_id=" + actionTypeId, false);
	r.send();
	var response = r.responseText;
	if (response != '0') {
		var params = new Array();
		var textParams = response.split("\n");
		for (var i = 0; i < textParams.length; i++) {
			if (textParams[i] != '') {
				var paramObj = new Object();
				var parts = textParams[i].split("',");
				for (var p = 0; p < parts.length; p++) {
					var pieces = parts[p].split("='");
					if (p == parts.length - 1) {
						pieces[1] = pieces[1].substr(0, pieces[1].length - 1);
					}
					paramObj[pieces[0]] = pieces[1];
				}
				params.push(paramObj);
			}
		}
		for (var p = 0; p < params.length; p++) {
			addActionParam(params[p], p);
		}
		var counter = document.getElementById("add_count");
		counter.value = params.length;
	}
}

function addActionParam(parameter, num) {
	var id = parameter['id'];
	var name = parameter['name'];
	var type = parameter['type'];
	var position = parameter['position'];
	var headers = document.getElementById("add_headers");
	var data = document.getElementById("add_data");
	var form = document.getElementById("add_form");
	headers.appendChild(createTH(name));
	data.appendChild(createTD(num));
	form.appendChild(createHidden(id, num));
}

function createHidden(id, num) {
	var inp = document.createElement("INPUT");
	inp.setAttribute('type', 'hidden');
	inp.name = 'param_id_' + num;
	inp.value = id;
	inp.className = 'dynamic_form_element';
	return inp;
}

function createTD(num) {
	var inp = document.createElement("INPUT");
	inp.setAttribute('type', 'text');
	inp.name = 'param_val_' + num;
	var td = document.createElement("TD");
	td.className = 'dynamic_form_element';
	td.appendChild(inp);
	return td;
}

function createTH(content) {
	var th = document.createElement("TH");
	var t = document.createTextNode(content);
	th.appendChild(t);
	th.className = 'dynamic_form_element';
	return th;
}

function clearActionForm() {
	var added = document.getElementsByClassName('dynamic_form_element');
	while (added.length > 0) {
		added[0].parentNode.removeChild(added[0]);
	}
}