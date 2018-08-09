<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="static_rs" value="../assets" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">

    <!-- Libs CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/feather/feather.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/highlight/styles/vs2015.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/quill/dist/quill.core.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/flatpickr/dist/flatpickr.min.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.min.css">

    <title>Dashkit</title>
  </head>
  <body class="d-flex align-items-center bg-white border-top-2 border-primary">

    <!-- CONTENT
    ================================================== -->
    <div class="container">
      <div class="row align-items-center">
        <div class="col-12 col-md-6 offset-xl-2 offset-md-1 order-md-2 mb-5 mb-md-0">

          <!-- Image -->
          <div class="text-center">
            <img src="${pageContext.request.contextPath}/assets/img/illustrations/happiness.svg" alt="..." class="img-fluid">
          </div>

        </div>
        <div class="col-12 col-md-5 col-xl-4 order-md-1 my-5">
          
          <!-- Heading -->
          <h1 class="display-4 text-center mb-3">
            Sign up
          </h1>
          
          <!-- Subheading -->
          <p class="text-muted text-center mb-5">
            Free access to our dashboard.
          </p>

          <!-- Form -->
          <form action="signup_req" method="POST" modelAttribute="new_user" id="newForm" >

            <!-- Email address -->
            <div class="form-group">

              	<!-- Label -->
              	<label>
                	Email or Phone
              	</label>

              	<!-- Input -->
              	<input id="email" name="email" type="text" class="form-control" placeholder="Email or Ph Number" required="required"/>
			  	<div class="email_chk_msg valid-feedback">
                </div>
                <div class="email_chk_msg invalid-feedback">
                </div>
            </div>

            <!-- Password -->
            <div class="form-group">

              <!-- Label -->
              <label>
                Password
              </label>

              <!-- Input group -->
              <div class="psw_input input-group input-group-merge">

                <!-- Input -->
                <input id="psw_check" name="password" type="password" class="psw_child form-control form-control-appended" placeholder="Enter your password" required="required"/>
				
                <!-- Icon -->
                <div class="input-group-append">
                  <span class="input-group-text">
                    <i class="fe fe-eye"></i>
                  </span>
                </div>
                <div class="psw_check_msg valid-feedback">
                </div>
                <div class="psw_check_msg invalid-feedback">
                </div>
                
                

              </div>
            </div>
            
            <!-- Re Password -->
            <div class="form-group">

              <!-- Label -->
              <label>
                Retype Password
              </label>

              <!-- Input group -->
              <div class="psw_input input-group input-group-merge">

                <!-- Input -->
                <input id="re_pass" type="password" class="psw_child form-control form-control-appended" placeholder="Enter your password again " required="required"/>

                <!-- Icon -->
                <div class="input-group-append">
                  <span class="input-group-text">
                    <i class="fe fe-eye"></i>
                  </span>
                </div>
                
                <div class="re_pass_msg valid-feedback">
                </div>
                <div class="re_pass_msg invalid-feedback">
                </div>

              </div>
            </div>

            <!-- Submit -->
            <button id="sign_up" class="btn btn-lg btn-block btn-primary mb-3" disabled>
              Sign up
            </button>

             <!-- Link -->
            <div class="text-center">
              <small class="text-muted text-center">
                Already have an account? <a href="sign-in-illustration.html">Log in</a>.
              </small>
            </div>
		</form>

        </div>
      </div> <!-- / .row -->
    </div> <!-- / .container -->

    <!-- JAVASCRIPT
    ================================================== -->
    <!-- Libs JS -->
    <script src="${pageContext.request.contextPath}/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/chart.js/dist/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/chart.js/Chart.extension.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/highlight/highlight.pack.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/flatpickr/dist/flatpickr.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/jquery-mask-plugin/dist/jquery.mask.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/list.js/dist/list.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/quill/dist/quill.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/select2/dist/js/select2.min.js"></script>

    <!-- Theme JS -->
    <script src="${pageContext.request.contextPath}/assets/js/theme.min.js"></script>
	<script>
	$(document).ready(function(){
		var checker = 'false';
		$('#email').keyup(function() {
			var email = $(this).val();
			if(email.match(/([a-z])|([A-Z])|([a-z].*[A-Z])|([A-Z].*[a-z])|([A-Z].*[A-Z])|([a-z].*[a-z])/)) {
				
				if(email.match(/(@)/) && email.length >=8) {
					$(this).removeClass('is-invalid');
					$(this).removeClass('is-valid');
					checker = 'true';
				} else {
					$('.email_chk_msg').html('Check your input');
					$(this).addClass('is-invalid');
					$(this).removeClass('is-valid');
					checker = 'false';
				}
			} else if(email.length >= 8) {
				$(this).removeClass('is-invalid');
				$(this).removeClass('is-valid');
				checker = 'true';
			} else {
				$('.email_chk_msg').html('Check your input');
				$(this).addClass('is-invalid');
				$(this).removeClass('is-valid');
				checker = 'false';
			}
			signupBtn();
		});
		
	    $(".psw_input span").click(function(){
	    	var psw = $(this).parent().siblings('.psw_child');
	    	if('password' == psw.attr('type')){
	            psw.prop('type', 'text');
	       }else{
	            psw.prop('type', 'password');
	       }
	    });
	    
	    $('#psw_check').keyup(function(){
	    	var check_msg = checkStrength($(this).val());
	    	if(check_msg == "Too Short") {
	    		$(this).addClass('is-invalid');
	    		$(this).removeClass('is-valid');
	    	} else if (check_msg == "Weak"){
	    		$(this).addClass('is-invalid');
	    		$(this).removeClass('is-valid');
	    	} else if (check_msg == "Strong") {
	    		$(this).addClass('is-valid');
	    		$(this).removeClass('is-invalid');
	    	} else if (check_msg == "Good") {
	    		$(this).addClass('is-valid');
	    		$(this).removeClass('is-invalid');
	    	}
	    	
	    	$(this).parent().find('.psw_check_msg').html(check_msg);
	    	signupBtn();
   		}) ;
	    
	    $('#re_pass').keyup(function(){
	    	
	    	if($(this).val() == $('#psw_check').val()) {
	    		$(this).parent().find('.re_pass_msg').html('Passwords Match');
	    		$(this).addClass('is-valid');
	    		$(this).removeClass('is-invalid');
	    	} else {
	    		$(this).parent().find('.re_pass_msg').html('Passwords not Match');
	    		$(this).addClass('is-invalid');
	    		$(this).removeClass('is-valid');
	    	}
	    	signupBtn();
	    });
	    
	    function signupBtn() {
	    	if(checker == 'true' && $('#re_pass').hasClass('is-valid') && $('#psw_check').hasClass('is-valid')) {
	    		$('#sign_up').removeAttr('disabled');
	    	} else {
	    		$("#sign_up").attr('disabled','disabled');
	    	}
	    	
	    }
   		
   		function checkStrength(password)
   		{
   		var strength = 0;
   		if (password.length < 8) { 
   		/* $('#strength_message').removeClass()
   		$('#strength_message').addClass('short') */
   		return "Too Short";
   		}

   		if (password.length > 7) strength += 1
   		if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
   		if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1 
   		if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
   		if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
   		if (strength < 2 )
   		{
   		/* $('#strength_message').removeClass()
   		$('#strength_message').addClass('weak') */
   		return "Weak";   
   		}
   		else if (strength == 2 )
   		{
   		/* $('#strength_message').removeClass()
   		$('#strength_message').addClass('good') */
   		return "Good";
   		}
   		else
   		{
   		/* $('#strength_message').removeClass()
   		$('#strength_message').addClass('strong') */
   		return "Strong";
   		}
   		}
	});
	
	
	</script>
  </body>
</html>