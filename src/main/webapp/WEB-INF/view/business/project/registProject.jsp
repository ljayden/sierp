<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<head></head>

<main role="main" class="container">
	<div class="my-3 p-3 bg-white rounded shadow">
	<h4 class="mb-3">프로젝트 등록하기</h4>
	
    <form class="needs-validation" id="regForm" novalidate> <!--  -->
    
    	<div class="form-row">
        	<div class="form-group col-md-5 mb-3">
                <label for="company" class="col-form-label-sm">업체명</label>
                <input type="text" class="form-control form-control-sm" id="company" required  onchange="javascript :checkCompany(this)">
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
            <div class="form-group col-md-1 mb-3"></div>
            <div class="form-group col-md-6 mb-3">
              	<label for="mainCompany" class="col-form-label-sm">수행사<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm" id="mainCompany" onchange="javascript :checkCompany(this)">
        	</div>
		</div>
		
    	<div class="form-row">
        	<div class="form-group col-md-5 mb-3">
                <label for="projectName" class="col-form-label-sm">프로젝트명 </label>
                <input type="text" class="form-control form-control-sm" id="projectName" required>
            	<div class="invalid-feedback">프로젝트명을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-1 mb-3"></div>
        	<div class="form-group col-md-2 mb-3">
            	<label for="startYear" class="col-form-label-sm">시작일<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="startYear" required>
                	<option value="">시작 년도</option>
 					<c:forEach var="year" begin="${ thisYear - 20 }" end="${ thisYear + 3 }" step="1">
				    	<c:if test="${ ((thisYear + 3) - year + (thisYear - 20)) eq thisYear }"><option value="${(thisYear + 3) - year + (thisYear - 20)}" selected="selected">${(thisYear + 3) - year + (thisYear - 20)}</option></c:if>
				    	<c:if test="${ ((thisYear + 3) - year + (thisYear - 20)) ne thisYear }"><option value="${(thisYear + 3) - year + (thisYear - 20)}">${(thisYear + 3) - year + (thisYear - 20)}</option></c:if>
				    </c:forEach>
                </select>
                <div class="invalid-feedback">년도를 선택해 주세요.</div>
			</div>
            <div class="form-group col-md-1 mb-3">
              	<label for="startMonth" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="startMonth">
               		<option value="">월</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<c:if test="${ month eq thisMonth }"><option value="${month}" selected="selected"><fmt:formatNumber pattern="00" value="${month}"/></option></c:if>
				    	<c:if test="${ month ne thisMonth }"><option value="${month}"><fmt:formatNumber pattern="00" value="${month}"/></option></c:if>
				    </c:forEach>
              	</select>
            </div>
            <div class="form-group col-md-1 mb-3">
                <label for="startDay" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="startDay">
               		<option value="">일</option>
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<c:if test="${ day eq thisDay }"><option value="${day}" selected="selected"><fmt:formatNumber pattern="00" value="${day}" /></option></c:if>
				    	<c:if test="${ day ne thisDay }"><option value="${day}"><fmt:formatNumber pattern="00" value="${day}" /></option></c:if>
				    </c:forEach>
              	</select>
            </div>
		</div>
		
        <div class="form-row">
            <div class="form-group col-md-6 mb-3">&nbsp;</div>
        	<div class="form-group col-md-2 mb-3">
            	<label for="endYear" class="col-form-label-sm">종료일<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="endYear"  required>
                	<option value="">종료 년도</option>
 					<c:forEach var="year" begin="${ thisYear - 10 }" end="${ thisYear + 13 }" step="1">
				    	<c:if test="${ ((thisYear + 13) - year + (thisYear - 10)) eq thisYear }"><option value="${(thisYear + 13) - year + (thisYear - 10)}" selected="selected">${(thisYear + 13) - year + (thisYear - 10)}</option></c:if>
				    	<c:if test="${ ((thisYear + 13) - year + (thisYear - 10)) ne thisYear }"><option value="${(thisYear + 13) - year + (thisYear - 10)}">${(thisYear + 13) - year + (thisYear - 10)}</option></c:if>
				    </c:forEach>
                </select>
                <div class="invalid-feedback">년도를 선택해 주세요.</div>
			</div>
            <div class="form-group col-md-1 mb-3">
              	<label for="endMonth" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="endMonth">
               		<option value="">월</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<c:if test="${ month eq thisMonth }"><option value="${month}" selected="selected"><fmt:formatNumber pattern="00" value="${month}"/></option></c:if>
				    	<c:if test="${ month ne thisMonth }"><option value="${month}"><fmt:formatNumber pattern="00" value="${month}" /></option></c:if>
				    </c:forEach>
              	</select>
            </div>
            <div class="form-group col-md-1 mb-3">
                <label for="endDay" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="endDay">
               		<option value="">일</option>
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<c:if test="${ day eq thisDay }"><option value="${day}" selected="selected"><fmt:formatNumber pattern="00" value="${day}" /></option></c:if>
				    	<c:if test="${ day ne thisDay }"><option value="${day}"><fmt:formatNumber pattern="00" value="${day}" /></option></c:if>
				    </c:forEach>
              	</select>
            </div>
        </div>      

		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="sido" class="col-form-label-sm">주소</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sido" required onchange="javascript: getSiGunGuTypeReg('sigungu');">
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
                <label for="addrDetail" class="col-form-label-sm">상세주소<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="addrDetail" placeholder="ex: 강남구청역 푸르지오">
			</div>
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
        	<label for="cutomerMemo" class="col-form-label-sm">담당자 메모</label>
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
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button" onclick="javascript: location.href = '/resource/freelancer/main.do'">취소</button>
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


var companyList = ['네이년','네이놈',
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
		    	regProject();
		    }
		});
		
		COMMON.autoCompleteInput('company', companyList);
		COMMON.autoCompleteInput('mainCompany', companyList);
		
	}, false);
})();


function regProject(form) {
	var param = {};
	
	var company = companyList.filter(function (value) {
        return (value == $('#company').val());
    });
	if (company.length != 1) {
		alert('업체정보를 다시 확인 해주세요.');
		return false;
	}
	param.companySeq = companyInfos[company[0]];
	
	if ($('#mainCompany').val() != '') {
		var mainCompany = companyList.filter(function (value) {
	        return (value == $('#mainCompany').val());
	    });
		if (mainCompany.length != 1) {
			alert('수행사 정보를 다시 확인 해주세요.');
			return false;
		}
		param.mainCompanySeq = companyInfos[mainCompany[0]];
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
	
	if ( $('#endtDay').val() != '') {
		if ( $('#endYear').val() == '' || $('#endMonth').val() == '') {
			alert('시작 년도. 월을 입력해 주세요.');
			return false;
		}
	}
	
	if ( $('#endMonth').val() != '' ) {
		if ( $('#endYear').val() == '') {
			alert('시작 년도. 월을 입력해 주세요.');
			return false;
		}
	}
	
	param.startYear = $('#startYear').val();
	param.startMonth = $('#startMonth').val();
	param.startDay = $('#startthDay').val();
	
	param.endYear = $('#endYear').val();
	param.endMonth = $('#endMonth').val();
	param.endDay = $('#endDay').val();
	
	param.sido = $('#sido').val() == '' ? null : $('#sido').val();
	param.sigungu = $('#sigungu').val() == '' ? null : $('#sigungu').val();
	param.addrDetail = $('#addrDetail').val();
	
	param.managerId = $('#manager').val();
	param.customerMemo = $('#customerMemo').val(); 

	event.preventDefault();
    event.stopPropagation();
 
	COMMON.ajax({
	    url : '/business/project/registProjectProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	       alert('프리랜서를 등록하였습니다.');
	       location.href = '/business/project/main.do';
	    }
	});
}


</script>