/**
 * File : addTeacher.js
 * 
 * This file contain the validation of add user form
 * 
 * Using validation plugin : jquery.validate.js
 * 
 * @author Sinu Jose
 */

$(document).ready(function(){
	
	var addUserForm = $("#addTeacher");
	
	var validator = addUserForm.validate({
		
		rules:{
			Name :{ required : true },
			Email : { required : true, email : true, remote : { url : baseURL + "checkEmailExists", type :"post"} },
			Password : { required : true },
			cPassword : {required : true, equalTo: "#password"},
			Telephone : { required : true, digits : true },
			Subject : { required : true, selected : true}
		},
		messages:{
			Name :{ required : "This field is required" },
			Email : { required : "This field is required", email : "Please enter valid email address", remote : "Email already taken" },
			Password : { required : "This field is required" },
			cPassword : {required : "This field is required", equalTo: "Please enter same password" },
			Telephone : { required : "This field is required", digits : "Please enter numbers only" },
			Subject : { required : "This field is required", selected : "Please senter subject" }			
		}
	});
});
