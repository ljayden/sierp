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
	
	<title>로그인</title>
	
	<script src="/share/js/jquery/jquery-1.12.3.min.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.scrollbar.min.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.form.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.serializejson.js?${scriptCachedate}"></script>
    
    <!-- script src="/share/js/lib/backbone.js?${scriptCachedate}"></script -->
    <script src="/share/js/lib/ie8Compatibility.js?${scriptCachedate}"></script>
    <script src="/share/js/lib/jscolor.js?${scriptCachedate}"></script>
    <script src="/share/js/lib/json2.js?${scriptCachedate}"></script>
    <script src="/share/js/lib/underscore.js?${scriptCachedate}"></script>
    
    <script src="/share/js/bootstrap.min.js?${scriptCachedate}"></script>
    <script src="/share/js/common.js?${scriptCachedate}"></script>
    <script src="/share/js/polyfill.js"></script>
    <script src="/share/js/sample.js"></script>
 	<script src="/share/js/utils.js?${scriptCachedate}"></script>
 	
    <script src="http://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>
    <script src="http://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    
	<!-- Bootstrap core CSS -->
	<link href="/share/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="/share/css/floating-labels.css" rel="stylesheet">
</head>

<body>
	<form class="form-signin" id="loginForm">
	
	<h1 class="h1 mb-3 font-weight-normal"><b>S</b>I <br><b>T</b>otal Management <b>S</b>olution</h1>
	<br><br>
		
		<div class="form-label-group">
		  <input type="email" id="managerId" name="managerId" class="form-control" placeholder="User Id" required autofocus>
		  <label for="managerId">Manager Id</label>
		</div>
		
		<div class="form-label-group">
		  <input type="password" id="managerPassword" name="managerPassword" class="form-control" placeholder="Password" required>
		  <label for="managerPassword">Password</label>
		</div>
		
		<div class="checkbox mb-3">
		  <label>
		    <input type="checkbox" value="remember-me" id="rememberMe"> Remember me
		  </label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="button" id="loginBtn">Sign in</button><br>
		<p class="mt-5 mb-3 text-muted text-right"><a href="https://caniuse.com/#feat=css-placeholder-shown">회원 가입</a></p>
		<p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2018 Nugal Corp. All Rights Reserved.</p>
	</form>
	
	<script type="text/javascript">
	$(document).ready(function() {
		//setCalendar();
		//setGrid();
		
		$('#loginBtn').click(function() {
			
			var id = $('#managerId').val();
			if (!id) {
				alert('ID를 입력해 주세요');
				return false;
			}
			
			var pass = $('#managerPassword').val();
			if (!pass) {
				alert('패스워드를 입력해 주세요.');
				return false;
			}
			
			var formData = $('#loginForm').serialize()
			COMMON.ajax({
				method: 'post',
				data : formData,
				url: '/loginProc.json',
				successHandler: function (data) {
					location.href = '/home/dashboard/main.do';
				},
				failHandler : function (code, message, result) {
					alert(result.message); 
				}
			});
		});
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