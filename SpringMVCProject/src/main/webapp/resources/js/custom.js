/**
 * Contains custom JavaScript code
 */
var urlHolder = new Object();

function loadTable() {
	$.get(urlHolder.records, function(response) {

		$('#tableUsers').find('tbody').remove();
 		for (var i=0; i<response.users.length; i++) {
			var row = '<tr>';
			row += '<td><input type="radio" name="index" id="index" value="'+i+'"></td>';
			row += '<td>' + response.users[i].firstName + '</td>';
			row += '<td>' + response.users[i].lastName + '</td>';
			row += '<td>' + response.users[i].phoneNumber + '</td>';
			row += '</tr>';
	 		$('#tableUsers').append(row);
 		}
 		
 		$('#tableUsers').data('model', response.users);
 	});
}

function submitNewRecord() {
	$.post(urlHolder.add, {
			firstname: $('#newFirstName').val(),
			lastname: $('#newLastName').val(),
			phoneNumber : $('#newPhoneNumber').val()
		}, 
		function(response) {
			$.mobile.loading( 'hide');
			if (response != null) {
				loadTable();
				alert('Success! Record has been added.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
	return false;
}

function submitDeleteRecord() {
	var selected = $('input:radio[name=index]:checked').val();

	$.post(urlHolder.del, {
			firstname: $('#tableUsers').data('model')[selected].firstName
		}, 
		function(response) {
			if (response == true) {
				loadTable(urlHolder.records);
				alert('Success! Record has been deleted.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
	return false;
}

function submitUpdateRecord() {
	$.post(urlHolder.edit, {
			firstname: $('#editFirstName').val(),
			lastname: $('#editLastName').val(),
			phoneNumber: $('#editPhoneNumber').val()
		}, 
		function(response) {
			if (response != null) {
				loadTable(urlHolder.records);
				alert('Success! Record has been edited.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
	return false;
}

function hasSelected() {
	var selected = $('input:radio[name=index]:checked').val();
	if (selected == undefined) { 
		alert('Select a record first!');
		return false;
	}

	return true;
}

function fillEditForm() {
	var selected = $('input:radio[name=index]:checked').val();
	$('#editFirstName').val( $('#tableUsers').data('model')[selected].firstName );
	$('#editLastName').val( $('#tableUsers').data('model')[selected].lastName );
	$('#editPhoneNumber').val( $('#tableUsers').data('model')[selected].phoneNumber );
}

function resetNewForm() {
	$('#newFirstName').val('');
	$('#newLastName').val('');
	$('#newLPhoneNumber').val('');
}

function resetEditForm() {
	$('#editFirstName').val('');
	$('#editLastName').val('');
	$('#editPhoneNumber').val('');
}

