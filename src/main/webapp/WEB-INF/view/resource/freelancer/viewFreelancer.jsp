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
		등록 :<fmt:formatDate value="${freelancer.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ freelancer.registerManagerId }"/>)
		</div>
	</div>
	<div class="row text-muted small">
		<div class="col-md-12 mb-2 text-right">
		수정 : 
		<c:if test="${ not empty freelancer.modifyYmdt }">
			<fmt:formatDate value="${freelancer.modifyYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ freelancer.modifyManagerId }"/>)
		</c:if>
		<c:if test="${ empty freelancer.modifyYmdt }">
			<fmt:formatDate value="${freelancer.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ freelancer.registerManagerId }"/>)
		</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-2">
		<b>이름 : ${ freelancer.name } (${ freelancer.sex.description })</b>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-2">
		E-mail : ${ freelancer.email }
		</div>
		
		<div class="col-md-3 mb-2">
		전화번호 : ${ freelancer.phoneNo }
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-3">
		생일 : ${ freelancer.birthYear }년 - ${ freelancer.birthMonth }월 - ${ freelancer.birthDay }일
		</div>
		
		<div class="col-md-9 mb-3">
		주소 : ${ freelancer.sido.description }/${ freelancer.siGunGu.description }    ${ freelancer.detailAddr }
		</div>
	</div>
	<br>
	
	<div class="row">
		<div class="col-md-3 mb-2">
		<b>${ freelancer.workerExpertType.description }</b>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-3">
		학력 : ${ freelancer.academicLevel.description }
		</div>
		<div class="col-md-6 mb-3">
		경력 시작일 : ${ freelancer.startWorkYear } 년 ${ freelancer.startWorkMonth } 월
		</div>
	</div>
	<div class="pl-2 pr-2 small">
		<c:if test="${ empty freelancerCareers }">
			<div class="text-muted">경력 정보 없음</div>
			<hr class="mb-2" style="margin-top: 3px;">
		</c:if>
		<c:if test="${ not empty freelancerCareers }">
			<c:forEach var="career" items="${ freelancerCareers }">
				<div class="row">
					<div class="col-md-3">${ career.workStartYear }년 ${ career.workStartMonth }월 ~ ${ career.workEndYear }년 ${ career.workEndMonth }월</div>
					<div class="col-md-2">${ career.recruitType.description }/${ career.companyName }</div>
					<div class="col-md-7">${ career.jobDesc }</div>
				</div>
				<hr class="mb-2" style="margin-top: 3px;">
			</c:forEach>
		</c:if>
		<br>
	</div>
	
	<c:if test="${ freelancer.seekingWorkStatus != 'ING'  }">
	<div class="row">
		<div class="col-md-3 mb-3">
		${ freelancer.seekingWorkStatus.description }
		</div>
		
		<div class="col-md-3 mb-3">
		사유 : ${ freelancer.seekingWorkRejectCause }
		</div>
		
		<div class="col-md-6 mb-3">
		기간 : ${ freelancer.seekingWorkStatusReConfirmYmd }
		</div>
	</div>
	</c:if>

	<div class="mb-3"> 
		<label for="cutomerMemo" class="col-form-label-sm">현재 담당 : <mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ freelancer.mainManagerId }"/></label>
		<textarea class="form-control form-control-sm" id="customerMemo" aria-label="With textarea" rows="3" disabled="disabled">${ freelancer.customerMemo }</textarea>
	</div>
	<br>
	
	<div class=" clearfix mb-4">
		<button type="button" class="btn btn-outline-secondary btn-sm float-right mr-2" onclick="javascript: location.href = '/resource/freelancer/main.do'">목록으로..</button>
		<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" id="">구직 상태 변경</button>
		<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" id="">수정 페이지로 이동</button>
	</div>
<!-- 	hopeRecruitTypeVal; -->
<!-- 	hopeWorkPosiTypeVal; -->
	<div class="card text-center">
		<div class="card-header small">
	    	<ul class="nav nav-tabs card-header-tabs">
	      		<li class="nav-item">
	        		<a class="nav-link active" href="#">자격.기술 및 우대조건 정보</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" href="#">계약 정보</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link disabled" href="#">제안 정보</a>
	      		</li>
	    	</ul>
	  	</div>
	  	<div class="card-body ">
	    	<h5 class="card-title"></h5>
	    	<div class="mb-3">
		    	<p class="card-text text-left">
		 			<small><b>자격증</b></small><br>
		 			<c:forEach var="advantage" items="${ freelancerAdvantages }">
		 				<c:if test="${ advantage.advantageType eq 'LICENSE' }">
		 					<button type="button" class="btn btn-outline-secondary btn-sm m-1">${ advantage.advantageName }</button>
		 					<c:set var="existLicense" value="on"></c:set>
		 				</c:if>
		 			</c:forEach>
		 			<c:if test="${ existLicense ne 'on' }"><br></c:if>
		    	</p>
	    	</div>
	    	<div class="mb-3">
		    	<p class="card-text text-left">
		 			<small><b>우대조건</b></small><br>
		 			<c:forEach var="advantage" items="${ freelancerAdvantages }">
		 				<c:if test="${ advantage.advantageType eq 'PREFERENCE' }">
		 					<button type="button" class="btn btn-outline-secondary btn-sm m-1">${ advantage.advantageName }</button>
		 					<c:set var="existPreference" value="on"></c:set>
		 				</c:if>
		 			</c:forEach>
		 			<c:if test="${ existPreference ne 'on' }"><br></c:if>
		    	</p>
	    	</div>
	    	
	    	<div class="mb-3">
		    	<p class="card-text text-left">
		 			<small><b>보유기술</b></small><br>
		 			<c:forEach var="advantage" items="${ freelancerAdvantages }">
		 				<c:if test="${ advantage.advantageType eq 'SKILL' }">
		 					<button type="button" class="btn btn-outline-secondary btn-sm m-1">${ advantage.advantageName } - ${ advantage.workmanship.description }</button>
		 					<c:set var="existSkill" value="on"></c:set>
		 				</c:if>
		 			</c:forEach>
		 			<c:if test="${ existSkill ne 'on' }"><br></c:if>
		    	</p>
	    	</div>
	  	</div>
	</div>
</div>

</main>
