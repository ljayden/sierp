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

    <link rel="stylesheet" type="text/css" href="http://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css?${scriptCachedate}" />
    <link rel="stylesheet" type="text/css" href="/share/css/offcanvas.css?${scriptCachedate}" />

</head>

<body class="bg-light">

	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand mr-auto mr-lg-0" href="#"><b>디와이즈</b></a>
		<button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
			<span class="navbar-toggler-icon"></span>
		</button>
	  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  
	  	<div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
		   	<ul class="navbar-nav mr-auto">
				<li class="nav-item <c:if test = "${topMenuPath eq 'home'}">active</c:if>">
					<a class="nav-link" href="/home/dashboard/main.do"><b>Home</b><c:if test = "${topMenuPath eq 'home'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'project'}">active</c:if>">
					<a class="nav-link" href="/project/dashboard/main.do"><b>프로젝트관리</b><c:if test = "${topMenuPath eq 'project'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'resource'}">active</c:if>">
					<a class="nav-link" href="/resource/dashboard/main.do"><b>인재 관리</b><c:if test = "${topMenuPath eq 'resource'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'contract'}">active</c:if>">
					<a class="nav-link" href="/contract/dashboard/main.do"><b>계약관리</b><c:if test = "${topMenuPath eq 'contract'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'business'}">active</c:if>">
					<a class="nav-link" href="/business/dashboard/main.do"><b>영업관리</b><c:if test = "${topMenuPath eq 'business'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="#">Manager관리</a>
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</li>
			</ul>
		       
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="검색" aria-label="검색">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
    

    <div class="nav-scroller bg-white shadow-sm">
    	<c:if test = "${topMenuPath eq 'home'}">
		<nav class="nav nav-underline">
        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">Home</button>
        	<a class="nav-link <c:if test = "${subMenePath eq 'dashboard'}">active</c:if>" href="#">Dashboard</a>
        	<a class="nav-link <c:if test = "${subMenePath eq 'search'}">active</c:if>" href="#">주간<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
        	<a class="nav-link " href="#">계약 만료</a>
        	<a class="nav-link " href="#">관리</a>
      	</nav>
      	</c:if>
    	<c:if test = "${topMenuPath eq 'project'}">
		<nav class="nav nav-underline">
        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">프로젝트 관리</button>
        	<a class="nav-link <c:if test = "${subMenePath eq 'dashboard'}">active</c:if>" href="/project/dashboard/main.do">Dashboard</a>
        	<a class="nav-link <c:if test = "${subMenePath eq 'search'}">active</c:if>" href="/project/search/main.do">조회<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
        	<a class="nav-link" href="#">등록</a>
        	<a class="nav-link" href="#">관리</a>
      	</nav>
      	</c:if>
    	<c:if test = "${topMenuPath eq 'resource'}">
		<nav class="nav nav-underline">
        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">인재 관리</button>
        	<a class="nav-link <c:if test = "${subMenePath eq 'dashboard'}">active</c:if>" href="/resource/dashboard/main.do">Dashboard</a>
        	<a class="nav-link <c:if test = "${subMenePath eq 'search'}">active</c:if>" href="/resource/search/main.do">프리랜서관리&nbsp;<span class="badge  badge badge-danger align-text-bottom">27</span></a>
        	<a class="nav-link" href="#">인재풀 검색</a>
      	</nav>
      	</c:if>
    	<c:if test = "${topMenuPath eq 'contract'}">
		<nav class="nav nav-underline">
        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">프로젝트 관리</button>
        	<a class="nav-link" href="#">Dashboard</a>
        	<a class="nav-link" href="#">조회<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
        	<a class="nav-link" href="#">등록</a>
        	<a class="nav-link" href="#">관리</a>
      	</nav>
      	</c:if>
    	<c:if test = "${topMenuPath eq 'business'}">
		<nav class="nav nav-underline">
        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">프로젝트 관리</button>
        	<a class="nav-link" href="#">Dashboard</a>
        	<a class="nav-link" href="#">조회<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
        	<a class="nav-link" href="#">등록</a>
        	<a class="nav-link" href="#">관리</a>
      	</nav>
      	</c:if>
    </div>
    
    
    <decorator:body/>

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
    <script type="text/javascript">
    $(function () {
    	  'use strict'

    	  $('[data-toggle="offcanvas"]').on('click', function () {
    	    $('.offcanvas-collapse').toggleClass('open')
    	  })
    	  
    	  
    })
    </script>
	<decorator:head/>
</body>
</html>