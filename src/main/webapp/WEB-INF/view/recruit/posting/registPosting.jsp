<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<head></head>

<main role="main" class="container">
	<div class="my-3 p-3 bg-white rounded shadow">
	<h4 class="mb-3">채용공고 등록하기</h4>
	<input type="hidden" id="selectedCompanyName" value="${ selectedCompany.companyName }">
    <form class="needs-validation" id="regForm" novalidate> <!--  -->

    	<div class="form-row">
        	<div class="form-group col-md-8 mb-3">
                <label for="projectName" class="col-form-label-sm">채용공고 제목 </label>
                <input type="text" class="form-control form-control-sm" id="projectName" required>
            	<div class="invalid-feedback">채용공고 제목을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-1 mb-3"></div>
        	<div class="form-group col-md-3 mb-3">
				<label for="projectName" class="col-form-label-sm">게시 여부 </label>
                <input type="text" class="form-control form-control-sm" id="projectName" required>
        	</div>
		</div>  

    	<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="company" class="col-form-label-sm">업체명</label>
                <input type="text" class="form-control form-control-sm" id="company" required onchange="javascript: companyChange('company')">
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<label for="companyManager" class="col-form-label-sm">담당자</label>
        		<select class="custom-select custom-select-sm d-block w-100" id="companyManager">
        		</select>
        	</div>
        	
            <div class="form-group col-md-1 mb-3"></div>
            <div class="form-group col-md-6 mb-3">
              	<label for="mainCompany" class="col-form-label-sm">프로젝트<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm w-70" id="mainCompany" onchange="javascript: companyChange('mainCompany')">
                <button type="button" class="btn btn-outline-primary btn-sm float-right mr-2" data-toggle="modal" data-target="#staffAddModal" id="staffAddModalBtn">찾아보기</button>
        	</div>
		</div>

		
    	<div class="form-row">
        	<div class="form-group col-md-4 mb-3">
                <label for="projectName" class="col-form-label-sm">채용구분 </label>
                <select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="expertType" required>
                	<mt:enumOptions enumClass="RecruitType"></mt:enumOptions>
                </select>
        	</div>
        	<div class="form-group col-md-4 mb-3">
                <label for="projectName" class="col-form-label-sm">업무구분<span class="text-muted">(Optional)</span></label>
				<select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="expertType" required>
                	<mt:enumOptions enumClass="WorkType" emptyValueName="선택"></mt:enumOptions>
                </select>
        	</div>
			<div class="form-group col-md-4 mb-3">
                <label for="projectName" class="col-form-label-sm">채용 수</label>
				<select class="custom-select custom-select-sm d-block w-100" id="startYear">
               		<option value="">0명</option><option value="">00명</option>
               		<option value="">1명</option><option value="">시작 년도</option><option value="">시작 년도</option>
               		<option value="">시작 년도</option><option value="">시작 년도</option><option value="">시작 년도</option><option value="">시작 년도</option><option value="">시작 년도</option>
               	</select>
        	</div>
		</div>  
		
		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="sido" class="col-form-label-sm">근무지</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sido" required onchange="javascript: getSiGunGuTypeReg('sido','sigungu');">
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/도를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-3 mb-3">
                <label for="sigungu" class="col-form-label-sm">&nbsp;</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sigungu" required>
                	<option value="">시/도를 선택해 주세요.</option>
<%-- 				    <mt:enumOptions enumClass="SiGunGuType" emptyValueName="시/도를 선택해 주세요."/> --%>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/군/구를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-7 mb-3">
                <label for="addrDetail" class="col-form-label-sm">상세 근무지<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="addrDetail" placeholder="ex: 강남구청역 푸르지오">
			</div>
		</div>
		<div class="mb-3"> 
        	<label for="projectDesc" class="col-form-label-sm">프로젝트 설명</label>
			<textarea class="form-control form-control-sm" id="projectDesc" aria-label="With textarea" rows="3"></textarea>
		</div>   
		<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="manager" class="col-form-label-sm">담당자</label>
                <select class="custom-select input-group custom-select-sm d-block" id="manager">
                	<c:forEach var="manager" items="${ managerList }" >
                		<c:if test="${ sessionScope.customerManager.id eq manager.id }"><option value="${ manager.id }" selected="selected">${ manager.name }</option></c:if>
                		<c:if test="${ sessionScope.customerManager.id ne manager.id }"><option value="${ manager.id }">${ manager.name }</option></c:if>
                	</c:forEach>
		        </select>
        	</div>
		</div>
		<div class="mb-3"> 
        	<label for="cutomerMemo" class="col-form-label-sm">메모</label>
			<textarea class="form-control form-control-sm" id="customerMemo" aria-label="With textarea" rows="3"></textarea>
		</div>                                                 
  		<br>
  		<br>
  		<div class="form-row">
			<div class="col-md-5 mb-3">&nbsp;</div>
			<div class="col-md-2 mb-3">
		  		<button  class="btn btn-primary btn-md btn-block" type="button" id="save">저장</button>
		  	</div>
		  	<div class="col-md-3 mb-3">
		  		<button class="btn btn-primary btn-md btn-block" type="button" id="saveNreg">저장 후 직무등록</button>
		  	</div>
		  	<div class="col-md-2 mb-3">
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button" onclick="javascript: location.href = '/business/project/main.do'">취소</button>
		  	</div>
		</div>
  	</form>
  	</div>
</main>


<script>
var companyInfos = new Array();
<c:forEach var="company" items="${ companyList }" varStatus="status">
companyInfos['${company.companyName}'] = ${company.companySeq}
</c:forEach>


var companyList = [//'네이년','네이놈',
<c:forEach var="company" items="${ companyList }" varStatus="status">
<c:if test="${ not status.last }">'${company.companyName}',</c:if>
<c:if test="${ status.last }">'${company.companyName}'</c:if>
</c:forEach>
];
				
				
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
		    	regProject(false);
		    }
		});
		
		$('#saveNreg').bind('click', function(event) {
			var form = document.getElementById('regForm');
		  	if (form.checkValidity() === false) {
		    	event.preventDefault();
		        event.stopPropagation();
		        form.classList.add('was-validated');
		    } else {
		    	regProject(true);
		    }
		});
		
		COMMON.autoCompleteInput('company', companyList, function() {
			var company = companyList.filter(function (value) {
		        return (value == $('#company').val());
		    });
			return company.length == 1;
		});
		COMMON.autoCompleteInput('mainCompany', companyList, function() {
			var company = companyList.filter(function (value) {
		        return (value == $('#mainCompany').val());
		    });
			return company.length == 1;
		});
		
		
		if ($('#selectedCompanyName').val() != '') {
			$('#company').val($('#selectedCompanyName').val());
			$('#company').css('background-color','#bfeffb');
			$('#company').attr('isMatchItem', true);
			companyChange('company');
		}
	}, false);
})();
 
function companyChange(id) {
	
	if ($('#' + id).val() && $('#' + id).val().length > 0) {
		var company = companyList.filter(function (value) {
	        return (value == $('#' + id).val());
	    });
		if (company.length == 1) {
			
			COMMON.ajax({
			    url : '/business/companyStaff/getCompanyManagerList.json?companySeq=' + companyInfos[company[0]],
			    successHandler : function(data){
			    	$('#' + id + 'Manager  option').remove();
			    	$('#' + id + 'Manager').append('<option value=""> - </option>')
			    	$(data.result).each(function(i, companyStaff) {
			    		$('#' + id + 'Manager').append('<option value="' + companyStaff.companyStaffSeq + '">' + companyStaff.name + '</option>')
			    	});
			    }
			});
			
		} else {
			$('#' + id + 'Manager option').remove();
	    	$('#' + id + 'Manager').append('<option value="">&nbsp;</option>')
		}
	} else {
		$('#' + id + 'Manager option').remove();
    	$('#' + id + 'Manager').append('<option value="">&nbsp;</option>')
	}
}

function regProject(flag) {
	var param = {};
	
	var company = companyList.filter(function (value) {
        return (value == $('#company').val());
    });
	if (company.length != 1) {
		alert('업체정보를 다시 확인 해주세요.');
		return false;
	}
	param.companySeq = companyInfos[company[0]];
	if ($('#companyManager').val() != '') {
		param.companyStaffSeq = $('#companyManager').val();
	} else {
		param.companyStaffSeq = null;
	}
	
	if ($('#mainCompany').val() != '') {
		var mainCompany = companyList.filter(function (value) {
	        return (value == $('#mainCompany').val());
	    });
		if (mainCompany.length != 1) {
			alert('수행사 정보를 다시 확인 해주세요.');
			return false;
		}
		param.mainCompanySeq = companyInfos[mainCompany[0]];

		if ($('#mainCompanyManager').val() != '') {
			param.mainCompanyStaffSeq = $('#mainCompanyManager').val();
		} else {
			param.mainCompanyStaffSeq = null;
		}
	} else {
		param.mainCompanySeq = null;
	}

	
	param.projectName = $('#projectName').val();
	
	if ( $('#startDay').val() != '') {
		if ( $('#startYear').val() == '' || $('#startMonth').val() == '') {
			alert('시작 년도. 월을 입력해 주세요.');
			return false;
		}
	}
	
	if ( $('#startMonth').val() != '' ) {
		if ( $('#startYear').val() == '') {
			alert('시작 년도. 월을 입력해 주세요.');
			return false;
		}
	}
	
	if ( $('#endDay').val() != '') {
		if ( $('#endYear').val() == '' || $('#endMonth').val() == '') {
			alert('종료 년도. 월을 입력해 주세요.');
			return false;
		}
	}
	
	if ( $('#endMonth').val() != '' ) {
		if ( $('#endYear').val() == '') {
			alert('종료 년도. 월을 입력해 주세요.');
			return false;
		}
	}
	
	param.startYear = $('#startYear').val();
	param.startMonth = $('#startMonth').val();
	param.startDay = $('#startthDay').val();
	
	param.endYear = $('#endYear').val();
	param.endMonth = $('#endMonth').val();
	param.endDay = $('#endDay').val();
	
	var start = param.startYear + '-' + param.startMonth + '-' + param.startDay;
	var end = param.endYear + '-' + param.endMonth + '-' + param.endDay;
	if (end > start) {
		alert('프로젝트 기간을 확인해 주세요.');
		return false;
	}
	
	param.sido = $('#sido').val() == '' ? null : $('#sido').val();
	param.sigungu = $('#sigungu').val() == '' ? null : $('#sigungu').val();
	param.addrDetail = $('#addrDetail').val();
	
	param.projectDesc = $('#projectDesc').val();
	param.mainManagerId = $('#manager').val();
	param.customerMemo = $('#customerMemo').val(); 

	event.preventDefault();
    event.stopPropagation();
 
	COMMON.ajax({
	    url : '/business/project/registProjectProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	    	
	    	if (flag) {
	    		alert('프로젝트를 등록하였습니다. 직무 등록 페이지로 이동합니다.');
			    location.href = '/business/project/main.do';
	    	} else {
	 	    	alert('프로젝트를 등록하였습니다.');
		       	location.href = '/business/project/main.do';
	    	}

	    }
	});
}

function getCompanyManagerList(selectId, companySeq) {

	
}
</script>