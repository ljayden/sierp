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
	
	<div class="row">
		<div class="col-md-12 text-right text-muted small">
		등록 :<fmt:formatDate value="${posting.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ posting.registerManagerId }"/>)
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 mb-2 text-right text-muted small">
		수정 : 
		<c:if test="${ not empty posting.modifyYmdt }">
			<fmt:formatDate value="${posting.modifyYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ posting.modifyManagerId }"/>)
		</c:if>
		<c:if test="${ empty freelancer.modifyYmdt }">
			<fmt:formatDate value="${posting.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ posting.registerManagerId }"/>)
		</c:if>
		</div>
	</div>
	
	<div class="row ">
		<div class="col-md-8 mb-4">
		<b>${ posting.postingTitle } </b>
		</div>
	</div>
	
	<div class="row ">
		<div class="col-md-9 mb-4"></div>
		<c:if test="${ not empty posting.endYmdt }">
			<div class="col-md-3 mb-4 text-right"><b>마감일: <fmt:formatDate value="${posting.endYmdt}" type="date" pattern="yyyy.MM.dd"/> </b></div>
		</c:if>
		<c:if test="${ empty posting.endYmdt }">
			<div class="col-md-3 mb-4 text-right text-muted"><b>마감일: 없음</b></div>
		</c:if>
	</div>
	
	<div class="row small ">
		<div class="col-md-10 mb-2">
		<b>업체명 : </b> ${ posting.companyName } <c:if test="${ not empty posting.companyStaffName }">&nbsp;&nbsp;&nbsp;( 담당자 : ${ posting.companyStaffName })</c:if>
		</div>
	</div>
	<c:if test="${ not empty posting.projectSeq }">
		<div class="row small">
			<div class="col-md-6 mb-2">
			<b>프로젝트명 : </b> ${ posting.projectName }
			</div>
		</div>
	</c:if>
	<div class="row small">
        <div class="col-md-8 mb-0">
        	<div class="custom-control custom-checkbox custom-control-inline" style="padding-left: 0px">
        	<b>근무 형태 : </b>
        	</div>
          	<div class="custom-control custom-checkbox custom-control-inline pl-2">
				<input type="checkbox" id="officeWorkYn" class="custom-control-input" readonly="readonly" <c:if test="${ posting.officeWorkYn == 'Y'}">checked="checked"</c:if>>
				<label class="custom-control-label custom-control-label-sm" for="">상주</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
		 		<input type="checkbox" id="officeHomeWorkYn" class="custom-control-input" readonly="readonly" <c:if test="${ posting.officeHomeWorkYn == 'Y'}">checked="checked"</c:if>>
		 		<label class="custom-control-label custom-control-label-sm"  for="">반상주</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
		 		<input type="checkbox" id="homeWorkYn"   class="custom-control-input" readonly="readonly" <c:if test="${ posting.homeWorkYn == 'Y'}">checked="checked"</c:if>>
		 		<label class="custom-control-label custom-control-label-sm"  for="">재택 가능</label>
			</div>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-4 mb-2"> </div>
		<div class="col-md-9 mb-2">
		<b>근무지 정보 : </b> ${ posting.workSido.description }/${ posting.workSigungu.description } &nbsp;&nbsp; ${ posting.workDetailAddr }
		</div>
	</div>
	<br>
	<div class="row small">
		<div class="col-md-3 mb-1"> 
			<b>업무 소개 및 안내:</b>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-12 mb-2">
			<textarea class="form-control form-control-sm small" aria-label="With textarea" rows="5" disabled="disabled">${ posting.jobInfo }</textarea>
		</div>
	</div>
	<br>
	<div class="row small">
		<div class="col-md-5 mb-2">
			<b>SI/SM : </b> <c:if test="${ not empty posting.workType }">${ posting.workType.description }</c:if><c:if test="${ empty posting.workType }"> - </c:if>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-5 mb-2">
		<b>채용 정보</b> :  ${ posting.recruitType.description } &nbsp;&nbsp;&nbsp;&nbsp; ${ posting.recruitManCount } 명 채용
		</div>
		
		<c:if test="${ not empty posting.recruitContractUnitValue and posting.recruitContractUnitValue > 0 }">
			<div class="col-md-5 mb-2">
				<b>계약 정보(단위) :</b> 
				<c:if test="${ posting.contractYearUnit > 0 }"> ${ posting.contractYearUnit  } 년&nbsp;&nbsp;</c:if>
				<c:if test="${ posting.contractMonthUnit > 0 }"> ${ posting.contractMonthUnit } 개월</c:if>
			</div>
		</c:if>
	</div>
	
	<c:if test="${ not empty posting.rewardType }">
		<div class="row small">
			<div class="col-md-6 mb-2">
			<b>보상 정보 :</b>  ${ posting.rewardType.description } &nbsp;
			
			<c:if test="${ not empty posting.rewardMinPrice }">${ posting.rewardMinPrice } 만원 이상 </c:if>~ 
			<c:if test="${ not empty posting.rewardMaxPrice }">${ posting.rewardMaxPrice } 만원 이하 </c:if>
			</div>
		</div>
	</c:if>
	<br>
	<div class="row small">
		<div class="col-md-5 mb-2">
			<b> 학력 제한 : </b>
			<c:if test="${ empty posting.needAcademicLevel }">없음</c:if>
			<c:if test="${ not empty posting.needAcademicLevel }"> ${ posting.needAcademicLevel.description } 이상</c:if>
		</div>
		<div class="col-md-5 mb-2">
			<b> 등급 제한 : </b>
			<c:if test="${ empty posting.needFreeGrade }">없음</c:if>
			<c:if test="${ not empty posting.needFreeGrade }"> ${ posting.needFreeGrade.description } 이상</c:if>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-5 mb-2">
			<b> 연차 제한 : </b>
			<c:if test="${ empty posting.limitWorkYearMin and empty posting.limitWorkYearMax  }">없음</c:if>
			<c:if test="${ not empty posting.limitWorkYearMin or not empty posting.limitWorkYearMax  }">
				<c:if test="${ not empty posting.limitWorkYearMin }">${ posting.limitWorkYearMin } 년 이상</c:if>
				<c:if test="${ not empty posting.limitWorkYearMax }"> ~  ${ posting.limitWorkYearMax } 년 이하 </c:if>
			</c:if>
		</div>
		<div class="col-md-5 mb-2">
			<b> 나이 제한 : </b>
			<c:if test="${ empty posting.limitAgeMin and empty posting.limitAgeMax  }">없음</c:if>
			<c:if test="${ not empty posting.limitAgeMin or not empty posting.limitAgeMax  }">
				<c:if test="${ not empty posting.limitAgeMin }">${ posting.limitAgeMin } 년 이후 출생</c:if> 
				<c:if test="${ not empty posting.limitAgeMax }">~ ${ posting.limitAgeMax } 년 이전 출생 </c:if>
			</c:if>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-10 mb-2">
		<b> 필수 조건 : </b>
		<c:forEach var="condition" items="${conditions}">
			<c:if test="${ condition.conditionType eq 'REQUIRE' }">
			&nbsp;&nbsp; ${ condition.advantageName } 
			<c:if test="${ not empty condition.workmanship  }">
				(${ condition.workmanship.description })
			</c:if>
			&nbsp;&nbsp;
			</c:if>
		</c:forEach>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-10 mb-2">
		<b> 우대 조건 : </b>
		<c:forEach var="condition" items="${conditions}">
			<c:if test="${ condition.conditionType ne 'REQUIRE' }">
			&nbsp;&nbsp; ${ condition.advantageName }
			<c:if test="${ not empty condition.workmanship  }">
				(${ condition.workmanship.description })
			</c:if>
			</c:if>
		</c:forEach>
		</div>
	</div>
	<br>
	<div class="row small">
		<div class="col-md-3 mb-1"> 
			<b>채용 안내:</b>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-12 mb-2">
			<textarea class="form-control form-control-sm small" aria-label="With textarea" rows="5" disabled="disabled">${ posting.recruitInfo }</textarea>
		</div>
	</div>
	
	<br>
	<div class="row small">
		<div class="col-md-3 mb-1"> 
			<b>현재 담당: <mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ posting.mainManagerId }"/></b>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-12 mb-2">
			<textarea class="form-control form-control-sm small" aria-label="With textarea" rows="5" disabled="disabled">${ posting.managerMemo }</textarea>
		</div>
	</div>
	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal"  id="postingModifyModalBtn">채용공고 수정</button>
	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal"  id="postingModifyModalBtn">계약 진행</button>
	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal"  id="postingModifyModalBtn">인재 찾기</button>
	<br>
 
	<br>
	<br>
	<br>
	<form id="searchForm" action="/business/project/getCompanyProjectList.ldo" method="post" iframe-list-div="listDiv">
		<input type="hidden" id="pageInput" name="page" value="1"/>
		<input type="hidden" id="postingSeqInput" name="postingSeq" value="${ posting.postingSeq }">
	</form>
	<input type="hidden" id="subMeneTypeInput" name="subMenuType" value="project">
	<div class="card text-center">
		<div class="card-header small">
	    	<ul class="nav nav-tabs card-header-tabs">
	      		<li class="nav-item">
	        		<a class="nav-link active" id="nav-link-suggetion" href="javascript:changeSubMenu('suggetion')">제안 관리</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" id="nav-link-applyto" href="javascript:changeSubMenu('applyto')">지원 현황</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" id="nav-link-contract" href="javascript:changeSubMenu('contract')">계약 정보</a>
	      		</li>
	    	</ul>
	  	</div>
	  	<div class="card-body p-0">
	    	<h5 class="card-title"></h5>
		  	<div class="mt-2 p-2" id="listDiv">
		  	</div>
	  	</div>
	</div>
	<br>
	<div class="clearfix mb-4">
		<button type="button" class="btn btn-outline-secondary btn-sm float-right mr-2" onclick="javascript: location.href = '/recruit/posting/main.do'">목록으로..</button>
	</div>
</div>

</main>


<script>
$(document).ready(function() {
	

});

function changeSubMenu(type, aTagObj) {
	if (type == $('#subMeneTypeInput').val()) {
		return;
	}

	$('#subMeneTypeInput').val(type);
	
	$('.nav-link').removeClass('active');
	$('#nav-link-' + type).addClass('active');
	
 	if (type == 'suggetion'){
 		$('#searchForm').attr('action','/business/project/getCompanyProjectList.ldo');	
 		
 	} else if (type == 'applyto'){
 		$('#searchForm').attr('action','/recruit/posting/getCompanyPostingList.ldo');	
 		
 	} else {
 		$('#searchForm').attr('action','/' + type);		
 	}
	$('#searchForm').submit();
}

</script>

 