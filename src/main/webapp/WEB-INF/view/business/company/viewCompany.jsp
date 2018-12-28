<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<head>
</head>

<main role="main" class="container">

<div class="my-3 p-3 bg-white rounded shadow">
	
	<div class="row text-muted small">
		<div class="col-md-12 text-right">
		등록 :<fmt:formatDate value="${company.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ company.registerManagerId }"/>)
		</div>
	</div>
	<div class="row text-muted small">
		<div class="col-md-12 mb-2 text-right">
		수정 : 
		<c:if test="${ not empty company.registerYmdt }">
			<fmt:formatDate value="${company.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ company.registerManagerId }"/>)
		</c:if>
		<c:if test="${ empty freelancer.modifyYmdt }">
			<fmt:formatDate value="${company.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ company.registerManagerId }"/>)
		</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-2">
		<b>업체명 : ${ company.companyName } </b>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-2">
		사업자 번호 : ${ company.bizNo }
		</div>
		<div class="col-md-9 mb-2">
		주소 : ${ company.sido.description }/${ company.siGunGu.description }    ${ company.detailAddr }
		</div>
	</div>
	<div class="mb-3"> 
		<label for="cutomerMemo" class="col-form-label-sm">업체 메모 :</label>
		<textarea class="form-control form-control-sm" id="customerMemo" aria-label="With textarea" rows="5" disabled="disabled">${ company.customerMemo }</textarea>
	</div>
	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" id="">업체정보 변경</button>
	<br>
	<div class="row">
		<div class="col-md-3 mb-3">
		업체 담당자
		</div>
	</div>
	<div class="pl-2 pr-2 small">
		<c:if test="${ empty companyStaffs }">
			<div class="text-muted">담당자 정보 없음</div>
			<hr class="mb-2" style="margin-top: 3px;">
		</c:if>
		<c:if test="${ not empty companyStaffs }">
			<c:forEach var="staff" items="${ companyStaffs }">
 				<div class="card">
					<div class="row p-1">
						<div class="col-md-2"><strong>${ staff.name }</strong></div>
						<div class="col-md-3">부서/직급: ${ staff.part }/${ staff.position }</div>
						<div class="col-md-3">E-mail : ${ staff.email }</div>
					</div>
					<div class="row p-1">
						<div class="col-md-2">&nbsp;</div>
						<div class="col-md-3">핸드폰 : ${ staff.phoneNo }</div>
						<div class="col-md-3">기타연락처 : ${ staff.companyPhoneNo }</div>
					</div>
					<div class="row p-1">
						<div class="col-md-2">&nbsp;</div>
						<div class="col-md-10">메모 : ${ staff.customerMemo }</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<br>
	</div>
	
	<div class=" clearfix mb-4">
		<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" id="">담당자 추가</button>
	</div>
	
	<form id="searchForm" action="/business/project/getCompanyProjectList.ldo" method="post" iframe-list-div="listDiv">
		<input type="hidden" id="pageInput" name="page" value="1"/>
		<input type="hidden" id="companySeqInput" name="companySeq" value="${ company.companySeq }">
	</form>
	<input type="hidden" id="subMeneTypeInput" name="subMenuType" value="project">
	<div class="card text-center">
		<div class="card-header small">
	    	<ul class="nav nav-tabs card-header-tabs">
	      		<li class="nav-item">
	        		<a class="nav-link active" id="nav-link-project" href="javascript:changeSubMenu('project')">프로젝트 정보</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" id="nav-link-notice" href="javascript:changeSubMenu('notice')">채용 공고</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" id="nav-link-contract" href="javascript:changeSubMenu('contract')">계약 정보</a>
	      		</li>
	    	</ul>
	  	</div>
	  	<div class="card-body p-0">
	    	<h5 class="card-title"></h5>
	    	<div class="mb-3 float-right">
		    	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" onclick="javacript: registerCompanyProject(${company.companySeq})">프로젝트 등록</button>
	    	</div>
	    	
		  	<div class="mt-2 p-2" id="listDiv">
		  	</div>
	  	</div>
	</div>
	<br>
	<div class="clearfix mb-4">
		<button type="button" class="btn btn-outline-secondary btn-sm float-right mr-2" onclick="javascript: location.href = '/business/company/main.do'">목록으로..</button>
	</div>
</div>

</main>

<script>
$(document).ready(function() {
 
});

function registerCompanyProject(companySeq) {
	location.href = '/business/project/registProject.do?companySeq=' + companySeq;
}

function changeSubMenu(type, aTagObj) {
	if (type == $('#subMeneTypeInput').val()) {
		return;
	}

	$('#subMeneTypeInput').val(type);
	
	$('.nav-link').removeClass('active');
	$('#nav-link-' + type).addClass('active');
	
 	if (type == 'project'){
 		$('#searchForm').attr('action','/business/project/getCompanyProjectList.ldo');	
 		
 	} else if (type == 'notice'){
 		$('#searchForm').attr('action','/' + type);	
 		
 	} else {
 		$('#searchForm').attr('action','/' + type);		
 	}
	

	$('#searchForm').submit();
}
</script>

 