<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="../../../../favicon.ico">
	
	<title>Floating labels example for Bootstrap</title>
	
	<!-- Bootstrap core CSS -->
	<link href="/share/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="/share/css/floating-labels.css" rel="stylesheet">
</head>

<body>
	<form class="form-signin">
	
	<h1 class="h1 mb-3 font-weight-normal"><b>S</b>I <br><b>T</b>otal Management <b>S</b>olution</h1>
	<br><br>
		
		<div class="form-label-group">
		  <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
		  <label for="inputEmail">Email address</label>
		</div>
		
		<div class="form-label-group">
		  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
		  <label for="inputPassword">Password</label>
		</div>
		
		<div class="checkbox mb-3">
		  <label>
		    <input type="checkbox" value="remember-me"> Remember me
		  </label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button><br>
		<p class="mt-5 mb-3 text-muted text-right"><a href="https://caniuse.com/#feat=css-placeholder-shown">회원 가입</a></p>
		<p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2018 Nugal Corp. All Rights Reserved.</p>
	</form>
	
	<script type="text/javascript">
	$(document).ready(function() {
		setCalendar();
	
		setGrid();
	});
	
	function callAjaxSuccess(){
		$('#testForm').attr('action','/ajaxCallSuccess.json');
		
		
		COMMON.ajax({
			form : $('#testForm'),
			successHandler : function(data){
				alert(data + '저장되었습니다.');
				//location.href
			}
		})
	}
	
	function callAjaxFail(){
		$('#testForm').attr('action','/ajaxCallFail.json');
		COMMON.ajax({
			form : $('#testForm'),
			successHandler : function(data){
				alert(data + '저장되었습니다.');
				//location.href
			}, 
			failHandler : function(code, message, data) {
				
			}
		})
	}
	
	function callAjaxException(){
		$('#testForm').attr('action','/ajaxCallException.json');
		COMMON.ajax({
			form : $('#testForm')
		})
	}
	
	function needLogin(){
		COMMON.ajax({ url : '/needLogin.json'})
	}
	
	
	
	function setCalendar(){
	
		var startDate_cal = COMMON.calendar('#startCal', {
				element : $("#startDate")
		});
		
		var endDate_cal = COMMON.calendar('#endCal', {
				element : '#endDate'
		});
	}
	</script>
</body>
</html>