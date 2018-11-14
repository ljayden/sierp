<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title><decorator:title default=""/></title>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="No-Cache">
    <meta http-equiv="Pragma" content="No-Cache">
    <meta http-equiv="Expires" content="0">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,height=device-height">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="apple-mobile-web-app-title" content="Si Total management Solution">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/share/css/offcanvas.css?${scriptCachedate}" />
    <link rel="stylesheet" type="text/css" href="/share/css/custom.css?${scriptCachedate}" />

    <script src="/share/js/jquery/jquery-1.12.3.min.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.scrollbar.min.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.form.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.serializejson.js?${scriptCachedate}"></script>
    
    <!-- script src="/share/js/lib/backbone.js?${scriptCachedate}"></script -->
    <script src="/share/js/lib/ie8Compatibility.js?${scriptCachedate}"></script>
    <script src="/share/js/lib/jscolor.js?${scriptCachedate}"></script>
    <script src="/share/js/lib/json2.js?${scriptCachedate}"></script>
    <script src="/share/js/lib/underscore.js?${scriptCachedate}"></script>
    
 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="/share/js/common.js?${scriptCachedate}"></script>
    <script src="/share/js/polyfill.js"></script>
    <script src="/share/js/sample.js"></script>
 	<script src="/share/js/utils.js?${scriptCachedate}"></script>
 	
</head>

<body class="bg-light" style="margin-right: -17px;"> <!-- margin 이유 모달창때 스크롤 잇으면 17이 붙더라.. -->

	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand mr-auto mr-lg-0" href="#"><b>${ sessionScope.customer.customerName}</b></a>
		<button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
			<span class="navbar-toggler-icon"></span>
		</button>
	  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  
	  	<div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
		   	<ul class="navbar-nav mr-auto">
				<li class="nav-item <c:if test = "${topMenuPath eq 'home'}">active</c:if>">
					<a class="nav-link" href="/home/dashboard/main.do"><b>Home</b><c:if test = "${topMenuPath eq 'home'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'recruit'}">active</c:if>">
					<a class="nav-link" href="/recruit/dashboard/main.do"><b>채용 관리</b><c:if test = "${topMenuPath eq 'recruit'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'contract'}">active</c:if>">
					<a class="nav-link" href="/contract/dashboard/main.do"><b>계약관리</b><c:if test = "${topMenuPath eq 'contract'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'resource'}">active</c:if>">
					<a class="nav-link" href="/resource/dashboard/main.do"><b>인재 관리</b><c:if test = "${topMenuPath eq 'resource'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'project'}">active</c:if>">
					<a class="nav-link" href="/project/dashboard/main.do"><b>프로젝트관리</b><c:if test = "${topMenuPath eq 'project'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'business'}">active</c:if>">
					<a class="nav-link" href="/business/company/main.do"><b>영업관리</b><c:if test = "${topMenuPath eq 'business'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'calander'}">active</c:if>">
					<a class="nav-link" href="/calander/my/main.do"><b>일정관리</b><c:if test = "${topMenuPath eq 'calander'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="/settings/managerConf.do">Manager관리</a>
						<a class="dropdown-item" href="/settings/dashboardConf.do">대쉬보드 관리</a>
						<a class="dropdown-item" href="/settings/commonConf.do">설정</a>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
			</ul>
		       
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="검색" aria-label="검색">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				<c:if test="${ not empty sessionScope.customerManager }">
					&nbsp;&nbsp;<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" id="logoutBtn">Logout</button>
				</c:if>
			</form>
		</div>
	</nav>
    

   
    	<c:if test = "${topMenuPath eq 'home'}">
    	<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">Home</button>
	        	<a class="nav-link" <c:if test = "${subMenePath eq 'dashboard'}">style="font-weight: bold"</c:if> href="#">Dashboard</a>
	        	<a class="nav-link" <c:if test = "${subMenePath eq 'search'}">style="font-weight: bold"</c:if> href="#">주간<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link" href="#">계약 만료</a>
	        	<a class="nav-link" href="#">관리</a>
	      	</nav>
	    </div>
      	</c:if>
      	
    	<c:if test = "${topMenuPath eq 'recruit'}">
    	<div class="nav-scroller bg-white shadow-sm">	
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">채용 관리</button>
	        	<a class="nav-link" <c:if test = "${subMenePath eq 'dashboard'}">style="font-weight: bold"</c:if> href="#">Dashboard</a>
	        	<a class="nav-link" href="#">조회<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link" href="#">등록</a>
	        	<a class="nav-link" href="#">관리</a>
	      	</nav>
      	</div>
      	</c:if>
      	
    	<c:if test = "${topMenuPath eq 'contract'}">
    	<div class="nav-scroller bg-white shadow-sm">	
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">계약 관리</button>
	        	<a class="nav-link" href="#">Dashboard</a>
	        	<a class="nav-link" href="#">조회<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link" href="#">등록</a>
	        	<a class="nav-link" href="#">관리</a>
	      	</nav>
      	</div>
      	</c:if>
      	
    	<c:if test = "${topMenuPath eq 'resource'}">
    	<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">인재 관리</button>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'dashboard'}">style="font-weight: bold"</c:if> href="/resource/dashboard/main.do">Dashboard</a>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'freelancer'}">style="font-weight: bold"</c:if> href="/resource/freelancer/main.do">프리랜서관리&nbsp;<span class="badge  badge badge-danger align-text-bottom">27</span></a>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'userPool'}">style="font-weight: bold"</c:if> href="/resource/userPool/main.do">인재풀 검색</a>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'employee'}">style="font-weight: bold"</c:if> href="/resource/employee/main.do">직원 관리</a>
	      	</nav>
      	</div>
      	</c:if>
      	
    	<c:if test = "${topMenuPath eq 'project'}">
    	<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">프로젝트 관리</button>
	        	<a class="nav-link" <c:if test = "${subMenePath eq 'dashboard'}">style="font-weight: bold"</c:if> href="/project/dashboard/main.do">Dashboard</a>
	        	<a class="nav-link" <c:if test = "${subMenePath eq 'search'}">style="font-weight: bold"</c:if> href="/project/search/main.do">조회<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link" href="#">등록</a>
	        	<a class="nav-link" href="#">관리</a>
	      	</nav>
      	</div>
      	</c:if>
      	
    	<c:if test = "${topMenuPath eq 'business'}">
    	<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">영업.업체 관리</button>
	        	<a class="nav-link" href="#">업체관리</a>
	        	<a class="nav-link" href="#">업체담당자<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link" href="#">영업관리</a>
	    	</nav>
	    </div>
      	</c:if>
      	
    
    <decorator:body/>

    <script type="text/javascript">
    $(function () {
		'use strict'

    	$('[data-toggle="offcanvas"]').on('click', function () {
    		$('.offcanvas-collapse').toggleClass('open')
    	})
    	  
 		$('#logoutBtn').click(function() {
 
			var formData = $('#loginForm').serialize()
			COMMON.ajax({
				method: 'post',
				data : formData,
				url: '/logoutProc.json',
				successHandler: function (data) {
					location.href = '/login.do';
				},
				failHandler : function (code, message, result) {
					alert(result.message); 
				}
			});
		});
    	
		$('form[iframe-list-div]').each(function(){
		 	var formObj = $(this);
		 	var divId = formObj.attr('iframe-list-div');
		 	formObj.on('submit', function() {
		 		if ($('#listLoadingIframe').length == 0) {
	 				formObj.attr('target', 'listLoadingIframe');
	 				
$('body').append('<iframe id="listLoadingIframe" name="listLoadingIframe" onload="javascipt: $(\'#' + divId + '\').html($(\'#listLoadingIframe\').contents().find(\'body\').html());" style="display: none;"></iframe>');
	 			}
			});
		 	
		 	formObj.submit();
		})
    })

    </script>
	<decorator:head/>
</body>
</html>