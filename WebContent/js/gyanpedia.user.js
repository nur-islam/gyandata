$("document").ready(function() {
	
	$("body").on("click", "#login", function(event) {
		event.preventDefault();
		if($('#userName').val().length == 0){
			alert("Enter your user name");
			return false;
		} else if ($('#password').val() == 0) {
			alert("Enter your password");
			return false;
		} else {
			$('#loginForm').submit();
		}
	});
	
	$("body").on("click", "#register", function(event) {
		event.preventDefault();
		var postData = {
			name :$('#name').val(),
			role :$('#role').val(),
			organisation: $('#organization').val(),
			userid: '456',
			password :$('#password').val(),
			birthdate :$('#birthdate').val(),
			phone :$('#phone').val(),
			street :$('#street').val(),
			city :$('#city').val(),
			state :$('#state').val(),
			pincode :$('#pincode').val(),
			email :$('#email').val(),
			country :$('#country').val(),
			stream :$('#stream').val(),
			nationality :$('#nationality').val(),
			gender :$('#gender').val()
		};
		$.post('./gyanpediacontroller?action=register', postData, function(data, status){
			
		});
	});
});