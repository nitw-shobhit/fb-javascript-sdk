<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FB-Demo</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script>
	function statusChangeCallback(response) {
	    if (response.status === 'connected') {
	    } else if (response.status === 'not_authorized') {
	    	console.log('Do what you wanna do');
	    } else {
			console.log('Do what you wanna do');
	    }
	}
	
	function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	}
	
	window.fbAsyncInit = function() {
	  	FB.init({
		    appId      : 'INSERT your application Key here',
		    cookie     : true,
		    xfbml      : true,
		    version    : 'v2.4'
	  	});
	
	  	FB.getLoginStatus(function(response) {
	    	statusChangeCallback(response);
		});
	
	};
	
	(function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	function loginWithFb() {
	    FB.api('/me?fields=email,name', function(response) {
		$.ajax({
                url : 'mainCtrl/getDetailsFromFacebook.do?emailId=' + response.email+'&name='+response.name,
                type : 'GET',
                datatype: 'text',
                success: function(data) {
    		    	console.log(data);
    		    	window.location = 'home.jsp?output='+data;
    		    }
            }).fail(function() {
                console.log('Failure');
            });
	    });
	}
</script>
</head>
<body>
	Login using 
	<fb:login-button scope="public_profile,email" data-size="large" onlogin="loginWithFb();">
	</fb:login-button>
</body>
</html>