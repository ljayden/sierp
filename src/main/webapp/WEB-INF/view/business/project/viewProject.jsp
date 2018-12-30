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
		등록 :<fmt:formatDate value="${project.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ project.registerManagerId }"/>)
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 mb-2">
		<b>프로젝트 명 : ${ project.projectName } <c:if test="${ empty project.projectName }"> ${ project.companyName } 의 프로젝트</c:if></b>
		<c:if test="${ not empty project.mainManagerId }">(주 담당:<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ project.mainManagerId }"/>)</c:if>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-5 mb-2">
			<b>업체명 : ${ project.companyName }</b>
			<c:if test="${ not empty project.companyStaffName }">
				(담당자: ${ project.companyStaffName })
			</c:if>
		</div>
		
		<div class="col-md-5 mb-2">
			<c:if test="${ not empty project.mainCompanyName }">
				<b>수행사 : ${ project.mainCompanyName }</b>
				<c:if test="${ not empty project.mainCompanyStaffName }">
					(담당자: ${ project.mainCompanyStaffName })
				</c:if>
			</c:if>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-10 mb-2">
		프로젝트 기간 : 
		<c:if test="${ not empty project.startYear }">
			${ project.startYear }
			<c:if test="${ not empty project.startMonth }">
				/ <fmt:formatNumber pattern="00" value="${project.startMonth}"/>
				<c:if test="${ not empty project.startDay }">
				/ <fmt:formatNumber pattern="00" value="${project.startDay}"/>
				</c:if>
			</c:if>
		</c:if>
		&nbsp;&nbsp; ~ &nbsp;&nbsp; 
		<c:if test="${ not empty project.endYear }">
			${ project.endYear }
			<c:if test="${ not empty project.endMonth }">
				/ <fmt:formatNumber pattern="00" value="${project.endMonth}"/>
				<c:if test="${ not empty project.endDay }">
				/ <fmt:formatNumber pattern="00" value="${project.endDay}"/>
				</c:if>
			</c:if>
		</c:if>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-10 mb-2">
		근무지 : ${ project.sido.description }/${ project.siGunGu.description }  ${ project.detailAddr }
		</div>
	</div>
	<br>
	<div class="mb-3"> 
		프로젝트 설명
		<textarea class="form-control form-control-sm" aria-label="With textarea" rows="3" disabled="disabled">${ project.projectDesc }</textarea>
	</div>
	<br>
	<div class="mb-3">
		메모
		<textarea class="form-control form-control-sm" aria-label="With textarea" rows="3" disabled="disabled">${ project.customerMemo }</textarea>
	</div>
	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal" data-target="#projectModifyModal" id="projectModifyModalBtn">변경</button>
 
	 <br>
	 <br>
	 <br>
</main>


<script>
$(document).ready(function() {
	

});

</script>

 