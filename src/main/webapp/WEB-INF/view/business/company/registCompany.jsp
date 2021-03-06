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
	<h4 class="mb-3">업체 등록하기</h4>
	
    <form class="needs-validation" id="regForm" novalidate>
    	<div class="form-row">
        	<div class="form-group col-md-5 mb-3">
                <label for="name" class="col-form-label-sm">회사명</label>
                <input type="text" class="form-control form-control-sm w-75" id="name" required>
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
            <div class="form-group col-md-3 mb-3">
              	<label for="bizNo" class="col-form-label-sm">사업자번호<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm" id="bizNo">
        	</div>
		</div>
  
		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="sido" class="col-form-label-sm">주소</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sido"  onchange="javascript: getSiGunGuTypeReg('sido','sigungu');">
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/도를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-3 mb-3">
                <label for="sigungu" class="col-form-label-sm">&nbsp;</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sigungu" >
                	<option value="">시/도를 선택해 주세요.</option>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/군/구를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-7 mb-3">
                <label for="addrDetail" class="col-form-label-sm">상세주소<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="addrDetail" placeholder="상세 주소를 입력해 주세요(Optional)">
			</div>
		</div>
		<div class="mb-3"> 
        	<label for="cutomerMemo" class="col-form-label-sm">회사 소개 <span class="small text-info">(프리랜서에게 채용공고 제안시 노출됩니다.)</span></label>
			<textarea class="form-control form-control-sm" id="companyIntro" aria-label="With textarea" rows="4"></textarea>
		</div> 
		<div class="mb-3"> 
        	<label for="cutomerMemo" class="col-form-label-sm">담당자 메모</label>
			<textarea class="form-control form-control-sm" id="managerMemo" aria-label="With textarea" rows="3"></textarea>
		</div>    
 		<br><br>
		
        <h6><b>업체 담당자 </b></h6>
        <div id="companyStaffDiv" class="p-2">
        	<div class="form-group col-md-12 mb-1 small text-center border p-2 text-muted" id="emptyStaff">등록된 담당자가 없습니다.</div>
        </div>
        <div class="form-group col-md-12 m-1 mt-m2 small text-right text-info">
        	<a href="javascript: openStaffRegForm()">담당자 등록</a>&nbsp;
        </div>
        
        <br>
        <div class="card m-1 p-2 pt-3 bg-light" id="staffRegForm">
	        <div class="form-row">
	         	<div class="form-group col-md-4">
			        <input type="text" class="form-control form-control-sm" id="companyStaffName" placeholder="이름"  value="">
	         	</div>
	         	<div class="form-group col-md-1"></div>
	        	<div class="form-group col-md-3">
	        		<input type="text" class="form-control form-control-sm" id="companyStaffPart" placeholder="부서(Optional)"  value="">
	        	</div>
	        	<div class="form-group col-md-3">
	        		<input type="text" class="form-control form-control-sm" id="companyStaffPosition" placeholder="직급(Optional)"  value="">
	        	</div>
	        </div>
	        <div class="form-row">
	        	<div class="form-group col-md-4">
	        		<input type="text" class="form-control form-control-sm" id="companyStaffEmail" placeholder="E-mail(Optional)"  value="">
	        	</div>
	        	<div class="form-group col-md-1"></div>
	        	<div class="form-group col-md-3">
	        		<input type="text" class="form-control form-control-sm" id="companyStaffPhone" placeholder="개인연락처(Optional)"  value="">
	        	</div>
	        	<div class="form-group col-md-3">
	        		<input type="text" class="form-control form-control-sm" id="companyStaffComPhone" placeholder="회사연락처(Optional)"  value="">
	        	</div>
	        </div>
			<div class="form-row">
				<div class="form-group col-md-11">
					<input type="text" class="form-control form-control-sm" id="companyStaffMemo" placeholder="담당자 메모(Optional)"  value="">
				</div>
				<div class="form-group col-md-1">
					<button type="button" class="btn btn-outline-dark btn-sm w-100 bg-white" onclick="javascript:addStaff()"><strong>추가</strong></button>
				</div>
			</div>
		</div>                                                 
  		<br>
  		<div class="form-row">
			<div class="col-md-8 mb-3">&nbsp;</div>
			<div class="col-md-2 mb-3">
		  		<button  class="btn btn-primary btn-md btn-block" type="button" id="save">저장</button>
		  	</div>
		  	<div class="col-md-2 mb-3">
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button" onclick="javascript: location.href = '/business/company/main.do'">취소</button>
		  	</div>
		</div>
  	</form>
  	</div>

</main>


<script>
(function() {
	'use strict';

	window.addEventListener('load', function() {
	    
	$('#save').bind('click', function(event) {
		var form = document.getElementById('regForm');
	  	if (form.checkValidity() === false) {
	    	event.preventDefault();
	        event.stopPropagation();
	        form.classList.add('was-validated');
	    } else {
	    	if (confirm('업체 정보를 등록하시겠습니까?')) {
		    	regCompany();	
	    	}
	    }
	});
	
   	$('#staffRegForm').hide();
   	
	}, false);
})();

var staffRowIndex = 1;
function addStaff() {
	if ($('.staffRowData').length > 20) {
		alert('담당자는 20명 이상 추가할 수 없습니다.');
		return false;	
	}
	
	if ($('#companyStaffName').val() == '' || $('#companyStaffName').val().length < 2) {
		alert('담당자명을 확인해 주세요');
		return false;
	}
	if ($('#companyStaffName').val().indexOf(';') > 0 || $('#companyStaffPart').val().indexOf(';') > 0 || $('#companyStaffPosition').val().indexOf(';') > 0 ||
		$('#companyStaffPhone').val().indexOf(';') > 0 || $('#companyStaffComPhone').val().indexOf(';') > 0 || $('#companyStaffEmail').val().indexOf(';') > 0 ||
		$('#companyStaffMemo').val().indexOf(';') > 0 ) {
		alert('";" 문자는 사용할 수 없습니다.');
		return false;
	}
	
	var rowId = "staffRow" + staffRowIndex;
	staffRowIndex++;
	var staffRowData = $('#companyStaffName').val() + ';' + $('#companyStaffPart').val() + ';' + $('#companyStaffPosition').val() + ';' + 
	                   $('#companyStaffPhone').val() + ';' + $('#companyStaffComPhone').val() + ';' + $('#companyStaffEmail').val() + ';' + $('#companyStaffMemo').val();
	
	var phoneNo = $('#companyStaffPhone').val();
	if (phoneNo == '') {
		phoneNo = '(개인 연락처 없음)';
	}
	var companyPhoneNo = $('#companyStaffComPhone').val();
	if (companyPhoneNo == '') {
		companyPhoneNo = '(회사 연락처 없음)';
	}
	var email = $('#companyStaffEmail').val();
	if (email == '') {
		email = '(email 정보 없음)';
	}
	
    var rowHtml =    	
		'<div id="' + rowId + '" class="card small p-2 mb-2">' +
		    '<input type="hidden" class="staffRowData" value="' + staffRowData +'"/>' +
        	'<div class="form-row mb-m3">' +
        		'<div class="form-group col-md-2 p-1"><b>' + $('#companyStaffName').val() + '</b>&nbsp;' + $('#companyStaffPosition').val() + '</div>' +
        		'<div class="form-group col-md-3">' + phoneNo + '</div>' +
        		'<div class="form-group col-md-3">' + companyPhoneNo + '</div>' +
        		'<div class="form-group col-md-3">' + email + '</div>' +
        		'<div class="form-group col-md-1">' +
        		'<button type="button" class="btn btn-outline-dark btn-sm w-100" onclick="javascript: deleteStaff(\'' + rowId + '\')"><strong>&times;</strong></button>' +
        		'</div>' +
        	'</div>' +
        	
        	'<div class="form-row mb-m3">' +
        		'<div class="form-group col-md-2">' + $('#companyStaffPart').val() + '</div>' +
        		'<div class="form-group col-md-8">' + $('#companyStaffMemo').val() + '</div>' +
        	'</div>' +
    	'</div>';
    	
	$('#companyStaffDiv').append(rowHtml);
	
	$('#emptyStaff').hide();
	
	$('#companyStaffName').val('');
	$('#companyStaffPosition').val('');
	$('#companyStaffPhone').val('');
	$('#companyStaffComPhone').val('');
	$('#companyStaffEmail').val('');
	$('#companyStaffPart').val('');
	$('#companyStaffMemo').val('');
}

function deleteStaff(rowId) {
	$('#' + rowId).remove();
	if ($('.staffRowData').length == 0) {
		$('#emptyStaff').show();
	}
}
function openStaffRegForm(){
	$('#staffRegForm').slideToggle(400);
}
function regCompany(event) {
	
	var param = {};
	param.name = $('#name').val();
	param.bizNo = $('#bizNo').val();
	param.sido = $('#sido').val();
	if (param.sido == '') {
		param.sido = null;
	}
	param.sigungu = $('#sigungu').val();
	if (param.sigungu == '') {
		param.sigungu = null;
	}
	
	param.addrDetail = $('#addrDetail').val();
	param.managerMemo = $('#managerMemo').val();
	 
	var staffs = new Array();
	$('#regForm .staffRowData').each(function(obj) {

		var staffInfo = $(this).val().split(';');
		var staffData = {};
		staffData['name'] = staffInfo[0];
		staffData['part'] = staffInfo[1];
		staffData['position'] = staffInfo[2];
		staffData['phoneNo'] = staffInfo[3];
		staffData['companyPhoneNo'] = staffInfo[4];
		staffData['email'] = staffInfo[5];
		staffData['memo'] = staffInfo[6];
		staffs.push(staffData);
	});
	param.staffs = staffs;

	event.preventDefault();
    event.stopPropagation();
 	
  
	COMMON.ajax({
	    url : '/business/company/registCompanyProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	       alert('업체를 등록하였습니다.');
	       location.href = '/business/company/main.do';
	    }
	});
}

</script>