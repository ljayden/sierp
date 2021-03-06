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
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 
    <script src="/share/js/jquery/jquery-1.12.3.min.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.scrollbar.min.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.form.js?${scriptCachedate}"></script>
    <script src="/share/js/jquery/jquery.serializejson.js?${scriptCachedate}"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
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

<body class="bg-light" style="margin-right: -34px;"> <!-- margin 이유 모달창때 스크롤 잇으면 17이 붙더라.. -->

	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand mr-auto mr-lg-0" href="#"><b>${ sessionScope.customer.customerName}</b></a>
		<button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
			<span class="navbar-toggler-icon"></span>
		</button>
	  	&nbsp;&nbsp;&nbsp;&nbsp;
	  
	  	<div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
		   	<ul class="navbar-nav mr-auto">
				<li class="nav-item <c:if test = "${topMenuPath eq 'home'}">active</c:if>">
					<a class="nav-link" href="/home/dashboard/main.do"><b>Home</b><c:if test = "${topMenuPath eq 'home'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'recruit'}">active</c:if>">
					<a class="nav-link" href="/recruit/dashboard/main.do"><b>채용관리</b><c:if test = "${topMenuPath eq 'recruit'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'contract'}">active</c:if>">
					<a class="nav-link" href="/contract/dashboard/main.do"><b>계약관리</b><c:if test = "${topMenuPath eq 'contract'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'resource'}">active</c:if>">
					<a class="nav-link" href="/resource/dashboard/main.do"><b>인재관리</b><c:if test = "${topMenuPath eq 'resource'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'business'}">active</c:if>">
					<a class="nav-link" href="/business/company/main.do"><b>업체관리</b><c:if test = "${topMenuPath eq 'business'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item <c:if test = "${topMenuPath eq 'calander'}">active</c:if>">
					<a class="nav-link" href="/calander/my/main.do"><b>업무관리</b><c:if test = "${topMenuPath eq 'calander'}"><span class="sr-only">(current)</span></c:if></a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Settings</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="/settings/managerConf.do">Manager관리</a>
						<a class="dropdown-item" href="/settings/dashboardConf.do">대쉬보드 관리</a>
						<a class="dropdown-item" href="/settings/commonConf.do">설정</a>
						<a class="dropdown-item" href="#">계정관리</a>
						<a class="dropdown-item" href="#">메일 인사말</a>
						<a class="dropdown-item" href="#">우대조건관리</a>
					</div>
				</li>
			</ul>
		       
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control form-control-sm mr-sm-2" type="text" placeholder="프리랜서 or 직원 검색" aria-label="검색">
				<button type="button" class="btn btn-outline-success btn-sm my-2 my-sm-0" data-toggle="modal" data-target="#topSearchResultModel" id="topSearchResultModelBtn">Search</button>
				<c:if test="${ not empty sessionScope.customerManager }">
					&nbsp;&nbsp;<button class="btn btn-outline-secondary my-2 my-sm-0 btn-sm" type="button" id="logoutBtn">Logout</button>
				</c:if>
				<input type="text" style="display: none;"/>
			</form>
		</div>
	</nav>
    

   
    	<c:if test = "${topMenuPath eq 'home'}">
    	<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">Home</button>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'dashboard'}">style="font-weight: bold"</c:if> href="#">Dashboard</a>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'search'}">style="font-weight: bold"</c:if> href="#">주간<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link" href="#">계약 만료</a>
	        	<a class="nav-link" href="#">관리</a>
	      	</nav>
	    </div>
      	</c:if>
      	
    	<c:if test = "${topMenuPath eq 'recruit'}">
    	<div class="nav-scroller bg-white shadow-sm">	
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">채용 관리</button>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'dashboard'}">style="font-weight: bold"</c:if> href="/recruit/dashboard/main.do">Dashboard</a>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'posting'}">style="font-weight: bold"</c:if> href="/recruit/posting/main.do">채용공고 관리<!--span class="badge badge-pill bg-light align-text-bottom">27</span--></a>
	        	<a class="nav-link" <c:if test = "${subMenuPath eq 'suggestion'}">style="font-weight: bold"</c:if> href="/recruit/suggestion/main.do">제안서 관리</a>
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
      	
    	<c:if test = "${topMenuPath eq 'business'}">
    	<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline">
	        	<button type="button" class="btn btn-outline-secondary btn-sm active" style="height : 34px; margin-top: 6px; margin-left : 6px;">업체 관리</button>
	        	<a class="nav-link <c:if test ="${subMenuPath eq 'company'}">text-primary font-weight-bold</c:if>"  href="/business/company/main.do">업체관리</a>
	        	<a class="nav-link <c:if test ="${subMenuPath eq 'companyStaff'}">text-primary font-weight-bold</c:if>" href="/business/companyStaff/main.do">업체담당자<span class="badge badge-pill bg-light align-text-bottom">27</span></a>
	        	<a class="nav-link <c:if test ="${subMenuPath eq 'project'}">text-primary font-weight-bold</c:if>" href="/business/project/main.do">프로젝트 관리</a>
	        	<a class="nav-link <c:if test ="${subMenuPath eq 'partner'}">text-primary font-weight-bold</c:if>" href="/business/partner/main.do">파트너사 관리</a>
	        	<a class="nav-link" href="#">영업관리</a>
	    	</nav>
	    </div>
      	</c:if>
      	
    
    <decorator:body/>

<!-- Modal -->
<div class="modal fade" id="topSearchResultModel" tabindex="-1" role="dialog" aria-labelledby="topSearchResultModel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title modal-title-sm" id="topSearchResultModelLabel"><b>검색 결과</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
		       	<div class="mb-3" id="searchResultDiv">
		       	
					<div class="text-muted small">자사 인재풀에서 1건이 검색되었습니다.</div>
					<div class="p-3"><a href="">김철수(27/남/성남) 개발자</a></div>
					<div class="">더보기</div>
					<hr class="mb-2">
					
					<div class="text-muted small">인재풀에서 2건이 검색되었습니다.</div>
					<div class="p-3"><a href="">김철수(21/남) 개발자</a>&nbsp;&nbsp;&nbsp;<a href="">김철수(26/남) 디자이너</a></div>
					<hr class="mb-2">
					
					<div class="text-muted small">업체 담당자에서 1 건이 검색되었습니다.</div>
					<div class="p-3"><a href="">김철수-네이버(35/남)</a></div>

				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
    <script type="text/javascript">
    $(function () {
		'use strict'
		
		COMMON.dateFormat();
		COMMON.ajax({
		    url : '/common/getAllSiGunGu.json',
		    successHandler : function(data){
		    	$(data.result).each(function(i, sigungu) {
		    		staticSigunguList.push({'code': sigungu.code , 'sido': sigungu.sido , 'description': sigungu.description});
		    	});
		    }
		});
		
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