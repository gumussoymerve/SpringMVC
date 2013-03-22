<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>


<c:url value="/users/records" var="recordsUrl" />
<c:url value="/users/create" var="addUrl" />
<c:url value="/users/update" var="editUrl" />
<c:url value="/users/delete" var="deleteUrl" />
<html>
<head>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/css/SpringMVCTheme.min.css"/>' />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile.structure-1.3.0.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
<script type='text/javascript' src='<c:url value="/resources/js/custom.js"/>'></script>
<script src='<c:url value="/resources/js/mask.js"/>' type="text/javascript"></script>
<script src='<c:url value="/resources/js/jquery.validate.min.js"/>' type="text/javascript"></script>

<title>User Records</title>

<script type='text/javascript'>
	jQuery(function($) {
		$("#newPhoneNumber").mask("(999) 999-9999");
		$("#editPhoneNumber").mask("(999) 999-9999");
	});
	$(function() {
		// init
		urlHolder.records = '${recordsUrl}';
		urlHolder.add = '${addUrl}';
		urlHolder.edit = '${editUrl}';
		urlHolder.del = '${deleteUrl}';
		loadTable();
		$('#newForm').validate({
			submitHandler: function(form){
				submitNewRecord();
				$('#newFormWrapper').popup('close');
			},
			errorPlacement: function(error, element) {
				error.insertAfter($(element).parent());
		}
		});

		$('#editBtn').click(function() {
			if (hasSelected()) {
				fillEditForm();
			}
		});

		$('#reloadBtn').click(function() {
			loadTable();
		});

		$('#deleteBtn').click(function() {
			if (hasSelected()) {
				submitDeleteRecord();
			}
		});

		$('#sendEditRecord').click(function(event) {
			
			submitUpdateRecord();
			$('#editFormWrapper').popup('close');
		});		

	});
</script>
</head>
<body>
	<div data-role="page">
		<div>
			<h1 id='banner' data-role="header">Registered User List</h1>
		</div>
		<table id='tableUsers'>
			<thead>
				<tr>
					<th></th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Phone Number</th>
				</tr>
			</thead>
		</table>

		<div id='controlBar'>
			<a href='#newFormWrapper' data-rel='popup' data-role="button" id='newBtn'
				data-inline="true" data-transition="slide">New</a> <input type='button' value='Delete'
				id='deleteBtn' data-inline="true" /> <a href='#editFormWrapper'
				data-rel='popup' data-role="button" id='editBtn' data-inline="true">Edit</a>
			<input type='button' value='Reload' id='reloadBtn' data-inline="true" />
		</div>

		<div id='newFormWrapper' data-role="popup" class="ui-content">
		<form id="newForm" action="" class="validate">
			<a href="#" data-rel="back" data-role="button" data-theme="a"
				data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
				<h2>Create New Record</h2>
				<div data-role="fieldcontain">
					<label for='newFirstName'><em>* </em>First Name:</label> <input type='text'
						id='newFirstName' class="required"/>
				</div>
				<div data-role="fieldcontain">
					<label for='newLastName'><em>* </em>Last Name:</label> <input type='text'
						id='newLastName' class="required" />
				</div>
				<div data-role="fieldcontain">
					<label for='newPhoneNumber'>Phone No:</label> <input type='text'
						id='newPhoneNumber' />
				</div>
				<label>Control text</label><input type="text" name="j_captcha_response" />	
				<img src="captcha.html"/>		
				<input type='submit' value='Submit' id="sendNewRecord"/>
		</form>
		</div>

		<div id='editFormWrapper' data-role="popup" class="ui-content">
			<form action="">
			<a href="#" data-rel="back" data-role="button" data-theme="a"
				data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
				<h2>Edit Record</h2>
				<input type='hidden' id='editUsername' />
				<div data-role="controlgroup">
					<div data-role="fieldcontain">
						<label for='editFirstName'>First Name:</label> <input type='text'
							id='editFirstName' />
					</div>
					<div data-role="fieldcontain">
						<label for='editLastName'>Last Name:</label> <input type='text'
							id='editLastName' />
					</div>
					<div data-role="fieldcontain">
						<label for='editPhoneNumber'>Phone No:</label> <input type='text'
							id='editPhoneNumber' />
					</div>
				</div>
				<input type='submit' value='Submit' data-role="button" id="sendEditRecord"/>
			</form>
		</div>
	</div>
</body>
</html>