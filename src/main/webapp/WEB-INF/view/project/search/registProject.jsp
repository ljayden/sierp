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
                <label for="name" class="col-form-label-sm">업체명</label>
                <input type="text" class="form-control form-control-sm  text-info" id="name" required autocomplete="off">
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
            <div class="form-group col-md-1 mb-3"></div>
            <div class="form-group col-md-6 mb-3">
              	<label for="phoneNo" class="col-form-label-sm">수행사<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm" id="phoneNo">
                <div class="invalid-feedback" style="width: 100%;">연락처를 입력해 주세요.</div>
        	</div>
		</div>
		
    	<div class="form-row">
        	<div class="form-group col-md-5 mb-3">
                <label for="name" class="col-form-label-sm">프로젝트명</label>
                <input type="text" class="form-control form-control-sm" id="name" required>
            	<div class="invalid-feedback">프로젝트명을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-1 mb-3"></div>
        	<div class="form-group col-md-2 mb-3">
            	<label for="birthYear" class="col-form-label-sm">시작일<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="birthYear"  required>
                	<option value="">년도 선택</option>
 					<c:forEach var="year" begin="1960" end="2000" step="1">
				    	<c:if test="${ year eq 1985 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 1985 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
                </select>
                <div class="invalid-feedback">년도를 선택해 주세요.</div>
			</div>
            <div class="form-group col-md-1 mb-3">
              	<label for="birthMonth" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="birthMonth">
               		<option value="">월</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
              	</select>
            </div>
            <div class="form-group col-md-1 mb-3">
                <label for="birthDay" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="birthDay">
               		<option value="">날짜</option>
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<option value="${ day }">${ day }</option>
				    </c:forEach>
              	</select>
            </div>
		</div>
		
        <div class="form-row">
            <div class="form-group col-md-6 mb-3">&nbsp;</div>
        	<div class="form-group col-md-2 mb-3">
            	<label for="birthYear" class="col-form-label-sm">종료일<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="birthYear"  required>
                	<option value="">년도 선택</option>
 					<c:forEach var="year" begin="1960" end="2000" step="1">
				    	<c:if test="${ year eq 1985 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 1985 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
                </select>
                <div class="invalid-feedback">년도를 선택해 주세요.</div>
			</div>
            <div class="form-group col-md-1 mb-3">
              	<label for="birthMonth" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="birthMonth">
               		<option value="">월</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
              	</select>
            </div>
            <div class="form-group col-md-1 mb-3">
                <label for="birthDay" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="birthDay">
               		<option value="">날짜</option>
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<option value="${ day }">${ day }</option>
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
			<div class="col-md-8 mb-3">&nbsp;</div>
			<div class="col-md-2 mb-3">
		  		<button class="btn btn-primary btn-md btn-block" type="submit">저장</button>
		  	</div>
		  	<div class="col-md-2 mb-3">
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button" onclick="javascript: location.href = '/resource/freelancer/main.do'">취소</button>
		  	</div>
		</div>
  	</form>
  	</div>


</main>


<script>
(function() {
	'use strict';

	window.addEventListener('load', function() {
	var forms = document.getElementsByClassName('needs-validation');
	var validation = Array.prototype.filter.call(forms, function(form) {
	
		form.addEventListener('submit', function(event) {
		    if (form.checkValidity() === false) {
		    	event.preventDefault();
		        event.stopPropagation();
		        
		        form.classList.add('was-validated');
		    } else {
		    	regFreelancer(event);
		    }
		    
	    }, false);
	});
	    
	}, false);
})();


function regFreelancer(form) {
	var param = {};
	param.name = $('#name').val();
	param.email = $('#email').val();
	param.phoneNo = $('#phoneNo').val();
	
	param.gender = $(':radio[name="gender"]:checked').val();
	param.birthYear = $('#birthYear').val();
	param.birthMonth = $('#birthMonth').val();
	param.birthDay = $('#birthDay').val();
	
	param.sido = $('#sido').val();
	param.sigungu = $('#sigungu').val();
	param.addrDetail = $('#addrDetail').val();
	
	param.expertType = $('#expertType').val();
	param.careerStartYear = $('#careerStartYear').val();
	param.careerStartMonth = $('#careerStartMonth').val();
	param.academicLevel = $('#academicLevel').val();
	
	param.hopeWorkPosiTypeVal = 0; 
	$(':checkbox[name="hopeWorkPosiType"]:checked').each(function(obj) {
		param.hopeWorkPosiTypeVal +=  new Number(this.value);
	});
	
	param.hopeRecruitTypeVal = 0; 
	$(':checkbox[name="hopeRecruitType"]:checked').each(function(obj) {
		param.hopeRecruitTypeVal +=  new Number(this.value);
	});
	
	param.managerId = $('#manager').val();
	param.customerMemo = $('#customerMemo').val();
	
	//경력
	var careers = new Array();
	$('#regForm .careersRowData').each(function(obj) {
		 
		var careerInfo = $(this).val().split(';');
		var careerData = {};
		careerData['workStartYear'] = careerInfo[0];
		careerData['workStartMonth'] = careerInfo[1];
		careerData['workEndYear'] = careerInfo[2];
		careerData['workEndMonth'] = careerInfo[3];
		careerData['recruitType'] = careerInfo[4];
		careerData['jobDesc'] = careerInfo[5];
		careerData['companyName'] = careerInfo[6];
		careers.push(careerData);
	});
	param.careers = careers;

	
	var preferences = new Array();
	$('#regForm .preferenceRow').each(function(obj) {
		preferences.push($(this).attr('data'));
	});
	param.preferences = preferences;
 
	
	var licenses = new Array();
	$('#regForm .licenseRow').each(function(obj) {
		licenses.push($(this).attr('data'));
	});
	param.licenses = licenses;
	
	
	var skillSets = new Array();
	$('.skillSetRow').each(function(obj) {
		
		var skillSetInfo = {};
		skillSetInfo['advantageSeq'] = $(this).attr('data').split(',')[0];
		skillSetInfo['skillSetWorkmanship'] = $(this).attr('data').split(',')[1];
		skillSets.push(skillSetInfo);
	});
	param.skillSets = skillSets;

	event.preventDefault();
    event.stopPropagation();
 
	COMMON.ajax({
	    url : '/resource/freelancer/registFreelancerProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	       alert('프리랜서를 등록하였습니다.');
	       location.href = '/resource/freelancer/main.do';
	    }
	});
}

var careerRowIndex = 1;
function addCareer() {
	
	if ($('.careersRowData').length > 10) {
		alert('경력은 10개 이상 입력할 수 없습니다.');
		return false;	
	}
	
	if ($('#careersStartYear').val() == '') {
		alert('시작 년도를 입력해 주세요.');
		return false;
	}
	
	if ($('#careersStartMonth').val() == '') {
		alert('시작 월을 입력해 주세요.');
		return false;
	}
	
	if ($('#careersEndYear').val() != '') {
		//재직중이 아니라면 월을 입력받자
		if ($('#careersEndMonth').val() == '') {
			alert('종료 월을 입력해 주세요.');
			return false;
		}
		
		
		var start = $('#careersStartYear').val()  + $('#careersStartMonth').val();
		var end = $('#careersEndYear').val()  + $('#careersEndMonth').val();
		if (parseInt(start) > parseInt(end)) {
			alert('시작일-종료일을 확인해 주세요.');
			return false;
		}
	} else {
		//재직중이라면
		$('#careersEndMonth').val('')
	}

	
	if ($('#careersRecruitType').val() == '') {
		alert('채용 구분을 입력해 주세요.');
		return false;
	}
	
	if ($('#careersJob').val() == '') {
		alert('업무내용을 입력해 주세요.');
		return false;
	}
	
	if ($('#careersCompanyName').val() == '') {
		alert('직장명을 입력해 주세요.');
		return false;
	}
	
	if ($('#careersJob').val().indexOf(';') > 0 || $('#careersCompanyName').val().indexOf(';') > 0) {
		alert('";" 문자는 사용할 수 없습니다.');
		return false;
	}
	
	var rowId = "careersRow" + careerRowIndex;
	careerRowIndex++;
	var careersRowData = $('#careersStartYear').val() + ';' + $('#careersStartMonth').val() + ';' + $('#careersEndYear').val() + ';' + $('#careersEndMonth').val() + ';' + $('#careersRecruitType').val() + 
	           ';' + $('#careersJob').val() + ';' + $('#careersCompanyName').val();
	           
	var rowHtml = 
	'<div id="' + rowId + '" class="form-row" style="margin-bottom: -18px;">' +
	    '<input type="hidden" class="careersRowData" value="' + careersRowData +'"/>' +
		'<div class="form-group col-md-9 mb-3">' +
			'<div class="form-row">' +
				'<div class="form-group input-group col-md-3 mb-3">' +
    				'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersStartYear').val() + ' 년">' +
					'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersStartMonth').val() + ' 월">' +
    			'</div>	' +
			'<div class="form-group input-group col-md-3 mb-3">';
		
	if ($('#careersEndYear').val() == '') {
		rowHtml += 
		'<input type="text" class="form-control form-control-sm" disabled="disabled" value="재직중">' +
		'<input type="text" class="form-control form-control-sm" disabled="disabled" value="-">';
	} else {
		rowHtml += 
		'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersEndYear').val() + ' 년">' +
		'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersEndMonth').val() + ' 월">';
	}
			
		rowHtml +=
			'</div>	' +
    		'<div class="form-group col-md-2 mb-3">' +
    			'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersRecruitType option:checked').html() + '">' +
    		'</div>' +
    		'<div class="form-group col-md-4 mb-3">' +
    			'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersJob').val() + '">' +
    		'</div>' +
			'</div> ' +
	  	'</div>' +
  		'<div class="form-group col-md-3 mb-3">' +
  			'<div class="form-row">' +
     	 		'<div class="form-group col-md-10 mb-3">' +
          			'<input type="text" class="form-control form-control-sm "  disabled="disabled" value="' + $('#careersCompanyName').val() + '">' +
      			'</div>' +
    			'<div class="form-group col-md-2 mb-3">' +
    				'<button type="button" class="btn btn-outline-dark btn-sm btn-block" onclick="javascript: removeCareerRow(\'' + rowId + '\')"><strong>&times;</strong></button>' +
    			'</div>' +
			'</div>' +
		'</div>' +
	'</div>';
	
	$('#careers').append(rowHtml);

	$('#careersStartYear').val('');
	$('#careersStartMonth').val('');
	$('#careersEndYear').val('');
	$('#careersEndMonth').val('');
	$('#careersRecruitType').val('');
	$('#careersJob').val('');
	$('#careersCompanyName').val('');
}

function removeCareerRow(id) {
	$('#' + id).remove();
}


</script>