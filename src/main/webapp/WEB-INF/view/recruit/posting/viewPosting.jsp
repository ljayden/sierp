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
		등록 :<fmt:formatDate value="${posting.registerYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ posting.registerManagerId }"/>)
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-2">
		<b>업체명 : ${ posting.companyName } </b>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 mb-2">
		사업자 번호 :  
		</div>
		<div class="col-md-9 mb-2">
		주소 :  
		</div>
	</div>
	<div class="mb-3"> 
		<label for="cutomerMemo" class="col-form-label-sm">업체 메모 :</label>
		<textarea class="form-control form-control-sm" aria-label="With textarea" rows="5" disabled="disabled">${ company.customerMemo }</textarea>
	</div>
	<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal" data-target="#companyModifyModal" id="companyModifyModalBtn">업체정보 변경</button>
	<br>
	<div class="row">
		<div class="col-md-3 mb-3">
		담당자 정보
		</div>
	</div>
	<div class="pl-2 pr-2 small">
		<c:if test="${ empty companyStaffs }">
			<div class="text-muted">담당자 정보 없음</div>
			<hr class="mb-2" style="margin-top: 3px;">
		</c:if>
		<c:if test="${ not empty companyStaffs }">
			<c:forEach var="staff" items="${ companyStaffs }">
 				<div class="card mb-1 p-1">
					<div class="row p-1">
						<div class="col-md-2" style="font-size: 1.0rem; margin-top : -4px;"><strong>${ staff.name }</strong></div>
						<div class="col-md-3">부서/직급: ${ staff.part }/${ staff.position }</div>
						<div class="col-md-5">E-mail : ${ staff.email }</div>
					</div>
					<div class="row p-1">
						<div class="col-md-2">&nbsp;</div>
						<div class="col-md-3">핸드폰 : ${ staff.phoneNo }</div>
						<div class="col-md-5">회사연락처 : ${ staff.companyPhoneNo }</div>
						
					</div>
					<div class="row p-1">
						<div class="col-md-2">&nbsp;</div>
						<div class="col-md-8">메모 : ${ staff.customerMemo }</div>
						<div class="col-md-2">
						<button type="button" class="btn btn-outline-secondary btn-sm float-right" onclick="javascript: removeStaff(${staff.companyStaffSeq})">삭제</button>
						<button type="button" class="btn btn-outline-secondary btn-sm float-right mr-2" data-toggle="modal" data-target="#staffModifyModal" id="staffModifyModalBtn"
						onclick="javascript: setCompanyStaffInfo(${staff.companyStaffSeq})">수정</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<br>
	</div>
	
	<div class=" clearfix mb-4">
		<button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal" data-target="#staffAddModal" id="staffAddModalBtn">담당자 추가</button>
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
	        		<a class="nav-link" id="nav-link-posting" href="javascript:changeSubMenu('posting')">채용 공고</a>
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
		<button type="button" class="btn btn-outline-secondary btn-sm float-right mr-2" onclick="javascript: location.href = '/business/company/main.do'">목록으로..</button>
	</div>
</div>


<div class="modal fade" id="staffAddModal" tabindex="-1" role="dialog" aria-labelledby="staffAddModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="staffAddModalLabel"><b>담당자 추가</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">추가할 담당자 정보를 입력해 주세요.</span>
						</div>
						<div class="card-body"> 
					        <div class="form-row">
								<div class="form-group col-md-5 mb-3">
					                <label for="companyStaffName" class="col-form-label-sm">담당자명</label>
					                <input type="text" class="form-control form-control-sm w-75" id="companyStaffName">
					        	</div>
					            <div class="form-group col-md-3 mb-3">
					              	<label for="companyStaffPart" class="col-form-label-sm">부서<span class="text-muted">(Optional)</span></label>
					                <input type="text" class="form-control form-control-sm" id="companyStaffPart" value="">
					        	</div>
					            <div class="form-group col-md-3 mb-3">
					              	<label for="companyStaffPosition" class="col-form-label-sm">직급<span class="text-muted">(Optional)</span></label>
					                <input type="text" class="form-control form-control-sm" id="companyStaffPosition" value="">
					        	</div>
					       	</div> 	
					       	<div class="form-row">
								<div class="form-group col-md-5 mb-3">
					            	<label for="companyStaffPhone" class="col-form-label-sm">개인연락처</label>
					            	<input type="text" class="form-control form-control-sm w-75" id="companyStaffPhone" value="">
					        	</div>
					            <div class="form-group col-md-5 mb-3">
					            	<label for="companyStaffComPhone" class="col-form-label-sm">회사연락처<span class="text-muted">(Optional)</span></label>
					                <input type="text" class="form-control form-control-sm" id="companyStaffComPhone"  value="">
					        	</div>
					       	</div>
						   	<div class="form-row">
								<div class="form-group col-md-5 mb-3">
					            	<label for="companyStaffEmail" class="col-form-label-sm w-75">E-mail<span class="text-muted">(Optional)</span></label>
					            	<input type="text" class="form-control form-control-sm" id="companyStaffEmail"  value="">
					        	</div>
					       	</div>
							<div class="form-row">
								<div class="form-group col-md-10 mb-3">
									<label for="companyStaffMemo" class="col-form-label-sm">메모</label>
									<textarea class="form-control form-control-sm" id="companyStaffMemo" aria-label="With textarea" rows="3"></textarea>
								</div>
					        </div>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:staffAddProc();">등록</button>
      		</div>
    	</div>
  	</div>
</div>

<div class="modal fade" id="staffModifyModal" tabindex="-1" role="dialog" aria-labelledby="staffModifyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="staffModifyModalLabel"><b>담당자 변경</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">담당자 정보를 변경해 주세요.</span>
						</div>
						<div class="card-body">
							<input type="hidden" class="form-control form-control-sm w-75" id="companyStaffSeq">
					        <div class="form-row">
								<div class="form-group col-md-5 mb-3">
					                <label for="companyStaffName" class="col-form-label-sm">담당자명</label>
					                <input type="text" class="form-control form-control-sm w-75" id="companyStaffNameModify">
					        	</div>
					            <div class="form-group col-md-3 mb-3">
					              	<label for="companyStaffPart" class="col-form-label-sm">부서<span class="text-muted">(Optional)</span></label>
					                <input type="text" class="form-control form-control-sm" id="companyStaffPartModify" value="">
					        	</div>
					            <div class="form-group col-md-3 mb-3">
					              	<label for="companyStaffPosition" class="col-form-label-sm">직급<span class="text-muted">(Optional)</span></label>
					                <input type="text" class="form-control form-control-sm" id="companyStaffPositionModify" value="">
					        	</div>
					       	</div> 	
					       	<div class="form-row">
								<div class="form-group col-md-5 mb-3">
					            	<label for="companyStaffPhone" class="col-form-label-sm">개인연락처</label>
					            	<input type="text" class="form-control form-control-sm w-75" id="companyStaffPhoneModify" value="">
					        	</div>
					            <div class="form-group col-md-5 mb-3">
					            	<label for="companyStaffComPhone" class="col-form-label-sm">회사연락처<span class="text-muted">(Optional)</span></label>
					                <input type="text" class="form-control form-control-sm" id="companyStaffComPhoneModify"  value="">
					        	</div>
					       	</div>
						   	<div class="form-row">
								<div class="form-group col-md-5 mb-3">
					            	<label for="companyStaffEmail" class="col-form-label-sm w-75">E-mail<span class="text-muted">(Optional)</span></label>
					            	<input type="text" class="form-control form-control-sm" id="companyStaffEmailModify"  value="">
					        	</div>
					       	</div>
							<div class="form-row">
								<div class="form-group col-md-10 mb-3">
									<label for="companyStaffMemo" class="col-form-label-sm">메모</label>
									<textarea class="form-control form-control-sm" id="companyStaffMemoModify" aria-label="With textarea" rows="3"></textarea>
								</div>
					        </div>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:staffModifyProc();">변경</button>
      		</div>
    	</div>
  	</div>
</div>


<div class="modal fade" id="companyModifyModal" tabindex="-1" role="dialog" aria-labelledby="companyModifyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="companyModifyModalLabel"><b>업체 기본정보 변경</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">업체 기본 정보를 변경해 주세요.</span>
						</div>
						<div class="card-body">
							<input type="hidden" class="form-control form-control-sm w-75" id="companyStaffSeq">
					        <div class="form-row">
					        	<div class="form-group col-md-5 mb-3">
					                <label for="companyName" class="col-form-label-sm">업체명</label>
					                <input type="text" class="form-control form-control-sm w-75" id="companyName" value="${ company.companyName }">
					        	</div>
					            <div class="form-group col-md-3 mb-3">
					              	<label for="companyBizNo" class="col-form-label-sm">사업자번호</label>
					                <input type="text" class="form-control form-control-sm" id="companyBizNo" value="${ company.bizNo }">
					        	</div>
					       	</div> 	
					       	<div class="form-row">
								<div class="form-group col-md-2 mb-3">
					                <label for="companySido" class="col-form-label-sm">주소</label>
					                <select class="custom-select custom-select-sm d-block w-100" id="companySido"  onchange="javascript: getSiGunGuTypeReg('sigungu');">
									    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 " selectedValue="${ company.sido }"/>
								  	</select>
								</div>
								<div class="form-group col-md-3 mb-3">
					                <label for="companySigungu" class="col-form-label-sm">&nbsp;</label>
					                <select class="custom-select custom-select-sm d-block w-100" id="companySigungu" >
					                	<option value="">시/도를 선택해 주세요.</option>
								  	</select>
								</div>
								<div class="form-group col-md-7 mb-3">
					                <label for="companyAddrDetail" class="col-form-label-sm">상세주소</label>
					 				<input type="text" class="form-control form-control-sm" id="companyAddrDetail" placeholder="" value="${ company.detailAddr }">
								</div>
					       	</div> 
							<div class="form-row">
								<label for="companyCutomerMemo" class="col-form-label-sm">업체 메모</label>
								<textarea class="form-control form-control-sm" id="companyCutomerMemo" aria-label="With textarea" rows="3">${ company.customerMemo }</textarea>
					        </div>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:companyModifyProc();">변경</button>
      		</div>
    	</div>
  	</div>
</div>

</main>


<script>
$(document).ready(function() {
	

});

function registerProjectPosting(companySeq, projectSeq) {
	location.href = '/recruit/posting/registPosting.do?companySeq=' + companySeq + '&projectSeq=' + projectSeq;
}
</script>

 