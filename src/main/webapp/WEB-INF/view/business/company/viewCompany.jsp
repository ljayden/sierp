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
		<div class="col-md-12 text-right">
		수정 :<fmt:formatDate value="${company.modifyYmdt}" type="both" timeStyle="short"/> (<mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ company.modifyManagerId }"/>)
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-3 mb-4">
		<b>회사명 : ${ company.companyName } </b>
		</div>
	</div>
	<div class="row small">
		<div class="col-md-3 mb-2">
		<b>사업자 번호 : </b> ${ company.bizNo }
		</div>
		<div class="col-md-9 mb-2">
		<b>주소 :</b> ${ company.sido.description }/${ company.sigungu.description }    ${ company.detailAddr }
		</div>
	</div>
	<div class="mb-3 small"> 
		<label for="cutomerMemo" class="col-form-label-sm"><b>회사 소개 :</b></label>
		<textarea class="form-control form-control-sm small" aria-label="With textarea" rows="5" disabled="disabled">${ company.companyIntro }</textarea>
	</div>
	<br>
	<div class="mb-3 small"> 
		<label for="cutomerMemo" class="col-form-label-sm"><b>담당자 메모 :</b></label>
		<textarea class="form-control form-control-sm small" aria-label="With textarea" rows="5" disabled="disabled">${ company.managerMemo }</textarea>
	</div>
    <div class="form-group col-md-12 m-1 mt-m2 small text-right text-info">
    	<a href="javascript: return fasle;"  data-toggle="modal" data-target="#companyModifyModal" id="companyModifyModalBtn">업체 정보 변경</a>&nbsp;
    </div>
	<br>
	<div class="row small">
		<div class="col-md-3 mb-3">
		<b>업체 담당자 정보</b>
		</div>
	</div>
	<div class="pl-2 pr-2 small">
		<c:if test="${ empty companyStaffs }">
			<div class="text-muted">업체 담당자 정보 없음</div>
			<hr class="mb-2" style="margin-top: 3px;">
		</c:if>
		<c:if test="${ not empty companyStaffs }">
			<c:forEach var="staff" items="${ companyStaffs }">
 				<div class="card mb-1 p-1">
					<div class="row p-1">
						<div class="col-md-2" style=" margin-top : -4px;"><span style="font-size: 1.0rem;"><strong>${ staff.name }</strong></span>&nbsp;${ staff.position }</div>
						<div class="col-md-4">부서: ${ staff.part }</div>
						<div class="col-md-4">E-mail : ${ staff.email }</div>
					</div>
					<div class="row p-1">
						<div class="col-md-2">&nbsp;</div>
						<div class="col-md-4">개인연락처 : ${ staff.phoneNo }</div>
						<div class="col-md-4">회사연락처 : ${ staff.companyPhoneNo }</div>
					</div>
					<div class="row p-1">
						<div class="col-md-2">&nbsp;</div>
						<div class="col-md-8">메모 : ${ staff.managerMemo }</div>
						<div class="col-md-2 text-right text-info">
						<a href="javascript: return false;" onclick="setCompanyStaffInfo(${staff.companyStaffSeq});"  data-toggle="modal" data-target="#staffModifyModal" id="staffModifyModalBtn">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript: removeStaff(${staff.companyStaffSeq})">삭제</a>
<%-- 						<button type="button" class="btn btn-outline-secondary btn-sm float-right" onclick="javascript: removeStaff(${staff.companyStaffSeq})">삭제</button> --%>
<!-- 						<button type="button" class="btn btn-outline-secondary btn-sm float-right mr-2" data-toggle="modal" data-target="#staffModifyModal" id="staffModifyModalBtn" -->
<%-- 						onclick="javascript: setCompanyStaffInfo(${staff.companyStaffSeq})">수정</button> --%>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<br>
	</div>
    <div class="form-group col-md-12 m-1 mt-m3 small text-right text-info">
    	<a href="javascript: return fasle;"  data-toggle="modal" data-target="#staffAddModal" id="staffAddModalBtn">담당자 추가</a>&nbsp;
    </div>

	<br><br>
	<form id="searchForm" action="/recruit/posting/getCompanyPostingList.ldo" method="post" iframe-list-div="listDiv">
		<input type="hidden" id="pageInput" name="page" value="1"/>
		<input type="hidden" id="companySeqInput" name="companySeq" value="${ company.companySeq }">
	</form>
	<input type="hidden" id="subMeneTypeInput" name="subMenuType" value="project">
	<div class="card text-center">
		<div class="card-header small">
	    	<ul class="nav nav-tabs card-header-tabs">
	      		<li class="nav-item">
	        		<a class="nav-link active" id="nav-link-posting" href="javascript:changeSubMenu('posting')">채용 공고</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" id="nav-link-contract" href="javascript:changeSubMenu('contract')">계약 정보</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" id="nav-link-project" href="javascript:changeSubMenu('project')">프로젝트 정보</a>
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
        	<h5 class="modal-title" id="staffAddModalLabel"><b>업체 담당자 추가</b></h5>
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
        	<h5 class="modal-title" id="staffModifyModalLabel"><b>업체 담당자 정보 변경</b></h5>
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
								<label for="companyIntro" class="col-form-label-sm">회사 소개</label>
								<textarea class="form-control form-control-sm" id="companyIntro" aria-label="With textarea" rows="3">${ company.companyIntro }</textarea>
					        </div>
							<div class="form-row">
								<label for="companyManagerMemo" class="col-form-label-sm">담당자 메모</label>
								<textarea class="form-control form-control-sm" id="companyManagerMemo" aria-label="With textarea" rows="3">${ company.managerMemo }</textarea>
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
//https://www.scout.co.kr/company/resumedb/part/
//http://www.jobkorea.co.kr/Top100/?Main_Career_Type=1&Search_Type=1&BizJobtype_Bctgr_Code=0&BizJobtype_Bctgr_Name=%EC%A0%84%EC%B2%B4&Major_Big_Code=0&Major_Big_Name=%EC%A0%84%EC%B2%B4&Edu_Level_Code=9&Edu_Level_Name=%EC%A0%84%EC%B2%B4
//http://chief.incruit.com/hh_info/jobpost.asp?job=1901250001198
$(document).ready(function() {
	
	$('#staffAddModal').on('shown.bs.modal', function () {
   		$('#staffAddModalBtn').trigger('focus');
   	})
   	
   	$('#staffModifyModal').on('shown.bs.modal', function () {
 
   	})
   	
   	$('#companyModifyModal').on('shown.bs.modal', function () {
   		$('#companyModifyModalBtn').trigger('focus');
   		getSiGunGuTypeReg('companySido','companySigungu', '${ company.sigungu }');
   	})
   
});

function setCompanyStaffInfo(companyStaffSeq) {
	
	COMMON.ajax({
	    url : '/business/companyStaff/getCompanyManager.json?companyStaffSeq=' + companyStaffSeq,
	    successHandler : function(data) {
	    	var staff = data.result;
	    	$('#companyStaffSeq').val(staff.companyStaffSeq)
	    	$('#companyStaffNameModify').val(staff.name);
	    	$('#companyStaffPartModify').val(staff.part);
	    	$('#companyStaffPositionModify').val(staff.position);
	    	$('#companyStaffPhoneModify').val(staff.phoneNo);
	    	$('#companyStaffComPhoneModify').val(staff.companyPhoneNo);
	    	$('#companyStaffEmailModify').val(staff.email);
	    	$('#companyStaffMemoModify').val(staff.managerMemo);
	    }
	});
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
 		
 	} else if (type == 'posting'){
 		$('#searchForm').attr('action','/recruit/posting/getCompanyPostingList.ldo');	
 		
 	} else {
 		$('#searchForm').attr('action','/' + type);		
 	}
	$('#searchForm').submit();
}

function companyModifyProc() {
	if ($('#companyName').val() == '') {
		alert('업체명을 입력해 주세요');
		return false;
	}
	var companySeq = $('#companySeqInput').val();
	
	var param = {};
	param.seq = companySeq;
	param.name = $('#companyName').val();
	param.bizNo = $('#companyBizNo').val();
	if ($('#companySido').val() != '') {
		param.sido = $('#companySido').val();
	}
	if ($('#companySigungu').val() != '') {
		param.sigungu = $('#companySigungu').val();
	}
	param.addrDetail = $('#companyAddrDetail').val();
	param.managerMemo = $('#companyManagerMemo').val();

	COMMON.ajax({
	    url : '/business/company/modifyCompanyProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data) {
			alert('업체 정보를 변경하였습니다.');
			location.href = '/business/company/viewCompany.do?companySeq=' + companySeq
	    }
	});
}

function staffAddProc() {
	if ($('#companyStaffName').val() == '') {
		alert('담당자명을 입력해 주세요');
		return false;
	}
	
	if ($('#companyStaffName').val().indexOf(';') > 0 || $('#companyStaffPart').val().indexOf(';') > 0 || $('#companyStaffPosition').val().indexOf(';') > 0 ||
		$('#companyStaffPhone').val().indexOf(';') > 0 || $('#companyStaffComPhone').val().indexOf(';') > 0 || $('#companyStaffEmail').val().indexOf(';') > 0 ||
		$('#companyStaffMemo').val().indexOf(';') > 0 ) {
		alert('";" 문자는 사용할 수 없습니다.');
		return false;
	}
	
	var param = {};
	param.name = $('#companyStaffName').val();
	param.part = $('#companyStaffPart').val();
	param.position = $('#companyStaffPosition').val();
	param.phoneNo = $('#companyStaffPhone').val();
	param.companyPhoneNo = $('#companyStaffComPhone').val();
	param.email = $('#companyStaffEmail').val();
	param.memo = $('#companyStaffMemo').val();
	
	var companySeq = $('#companySeqInput').val();
	COMMON.ajax({
	    url : '/business/companyStaff/registCompanyStaffProc.json?companySeq=' + companySeq,
	    data : JSON.stringify(param),
	    successHandler : function(data) {
			alert('담당자 정보를 추가하였습니다.');
			location.href = '/business/company/viewCompany.do?companySeq=' + companySeq
	    }
	});
}

function staffModifyProc() {
	if ($('#companyStaffNameModify').val() == '') {
		alert('담당자명을 입력해 주세요');
		return false;
	}
	
	if ($('#companyStaffNameModify').val().indexOf(';') > 0 || $('#companyStaffPartModify').val().indexOf(';') > 0 || $('#companyStaffPositionModify').val().indexOf(';') > 0 ||
		$('#companyStaffPhoneModify').val().indexOf(';') > 0 || $('#companyStaffComPhoneModify').val().indexOf(';') > 0 || $('#companyStaffEmailModify').val().indexOf(';') > 0 ||
		$('#companyStaffMemoModify').val().indexOf(';') > 0 ) {
		alert('";" 문자는 사용할 수 없습니다.');
		return false;
	}
	
	var param = {};
	param.seq = $('#companyStaffSeq').val();
	param.name = $('#companyStaffNameModify').val();
	param.part = $('#companyStaffPartModify').val();
	param.position = $('#companyStaffPositionModify').val();
	param.phoneNo = $('#companyStaffPhoneModify').val();
	param.companyPhoneNo = $('#companyStaffComPhoneModify').val();
	param.email = $('#companyStaffEmailModify').val();
	param.memo = $('#companyStaffMemoModify').val();
	
	var companySeq = $('#companySeqInput').val();
	COMMON.ajax({
	    url : '/business/companyStaff/modifyCompanyStaffProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data) {
			alert('담당자 정보를 변경하였습니다.');
			location.href = '/business/company/viewCompany.do?companySeq=' + companySeq
	    }
	});
}

function removeStaff(companyStaffSeq) {
	if (confirm('정말 삭제하시겠습니까?')) {
		COMMON.ajax({
		    url : '/business/companyStaff/deleteCompanyStaffProc.json?companyStaffSeq=' + companyStaffSeq,
		    successHandler : function(data) {
				alert('담당자 정보를 삭제하였습니다.');
				location.href = '/business/company/viewCompany.do?companySeq=' + $('#companySeqInput').val()
		    }
		});
	}
}
</script>

 