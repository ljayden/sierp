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
                <label for="posingTitle" class="col-form-label-sm">채용공고 제목 </label>
                <input type="text" class="form-control form-control-sm" id="posingTitle" required>
            	<div class="invalid-feedback">채용공고 제목을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-2 mb-3"></div>
        	<div class="form-group col-md-2 mb-3">
				<label for="projectName" class="col-form-label-sm">게시 여부 </label>
				<div>
		           	<div class="custom-control custom-checkbox custom-control-inline">
						<input type="checkbox" id="chkSitePostgYn" value="Y" class="custom-control-input">
						<label class="custom-control-label custom-control-label-sm" for="chkSitePostgYn">사이트 게시</label>
					</div>
				</div>
        	</div>
		</div>  

    	<div class="form-row">
        	<div class="form-group col-md-4 mb-3">
                <label for="company" class="col-form-label-sm">업체명</label>
                <input type="text" class="form-control form-control-sm" id="company" required onchange="javascript: companyChange('company')">
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<label for="companyManager" class="col-form-label-sm">담당자<span class="text-muted">(Optional)</span></label>
        		<select class="custom-select custom-select-sm d-block w-100" id="companyManager">
        		</select>
        	</div>
		</div>

    	<div class="form-row">
        	<div class="form-group col-md-2 mb-3">
                <label for="workType" class="col-form-label-sm">업무 구분<span class="text-muted">(Optional)</span></label>
				<select class="custom-select custom-select-sm d-block w-100"  id="workType" required>
                	<mt:enumOptions enumClass="WorkType" emptyValueName="없음"></mt:enumOptions>
                </select>
        	</div>
        	<div class="form-group col-md-2 mb-3"></div>
            <div class="form-group col-md-7 mb-3 ">
              	<label for="project" class="col-form-label-sm">프로젝트<span class="text-muted">(Optional)</span></label>
              	<div>
	                <input type="text" class="form-control form-control-sm w-75 float-left " id="project" readonly="readonly">
	                <input type="hidden" id="projectSeq" value="">
	                <button type="button" class="btn btn-outline-secondary btn-sm float-left ml-2"   id="deleteProjectBtn"><b>&times;</b></button>
	                <button type="button" class="btn btn-outline-primary btn-sm float-left ml-2" data-toggle="modal" data-target="#projectFindModal" id="projectFindModalBtn">찾아보기</button>
              	</div>
        	</div>
		</div>
		
    	<div class="form-row">
        	<div class="form-group col-md-2 mb-3">
                <label for="recruitType" class="col-form-label-sm">채용 구분 </label>
                <select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="recruitType">
                	<mt:enumOptions enumClass="RecruitType"></mt:enumOptions>
                </select>
        	</div>
			<div class="form-group col-md-2 mb-3">
                <label for="recruitManCount" class="col-form-label-sm">채용 수</label>
				<select class="custom-select custom-select-sm d-block w-100" id="recruitManCount">
               		<option value="">0 명</option>
               		<option value="">00 명</option>
	                <c:forEach var="manCount" begin="1" end="10" step="1">
						<option value="${manCount}">${manCount} 명</option>
					</c:forEach>
               	</select>
        	</div>
        	<div class="form-group col-md-2 mb-3">
                <label for="recruitContractUnitValue" class="col-form-label-sm">계약 단위<span class="text-muted">(Optional)</span> </label>
				<select class="custom-select custom-select-sm d-block w-100" id="recruitContractUnitValue">
					<option>없음</option>
	                <c:forEach var="monthVal" begin="1" end="60" step="1">
						<option value="${monthVal}">${monthVal} 개월</option>
					</c:forEach>
               	</select>
        	</div>
        	<div class="form-group col-md-6 mb-3">
                <label for="rewardType" class="col-form-label-sm">보상 정보<span class="text-muted">(Optional)</span> </label>
                <div>
					<select class="custom-select custom-select-sm d-block w-25 float-left"  id="rewardType" required>
	                	<mt:enumOptions enumClass="RewardType" emptyValueName="없음" selectedValue="MONTH"></mt:enumOptions>
	                </select>
	                <input type="text" class="form-control form-control-sm w-25 float-left ml-2" id="rewardMinPrice" placeholder="만원 이상">
	                <div class="float-left ">&nbsp; ~ &nbsp;</div>
	                <input type="text" class="form-control form-control-sm w-25 float-left" id="rewardMaxPrice" placeholder="만원 이하">
                </div>
        	</div>
		</div>  

		<br>
		<br>
		<h6><b>채용 조건</b></h6>
    	<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="needAcademicLevel" class="col-form-label-sm">학력 제한 </label>
                <select class="custom-select custom-select-sm d-block w-100" style="font-weight: bold" id="needAcademicLevel" required>
                	<mt:enumOptions enumClass="AcademicLevel" emptyValueName="없음" optionNameSuffix=" 이상"></mt:enumOptions>
                </select>
        	</div>
			<div class="form-group col-md-3 mb-3">
                <label for="needFreeGradeValue" class="col-form-label-sm">등급 제한</label>
				<select class="custom-select custom-select-sm d-block w-100" id="needFreeGradeValue">
               		<mt:enumOptions enumClass="FreelancerGrade" emptyValueName="없음" optionNameSuffix=" 이상"></mt:enumOptions>
               	</select>
        	</div>
        	<div class="form-group col-md-1 mb-3"></div>
			<div class="form-group col-md-5 mb-3">
                <label for="limitWorkYearMin" class="col-form-label-sm">연차 제한</label>
                <div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitWorkYearMin">
						<option value="0" selected="selected">없음</option>
		                <c:forEach var="year" begin="1" end="20" step="1">
							<option value="${year}" >${year} 년</option>
						</c:forEach>
	               	</select>
	               	<div class="float-left">&nbsp; ~ &nbsp;</div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitWorkYearMax">
						<option value="0" selected="selected">없음</option>
		                <c:forEach var="year" begin="1" end="20" step="1">
							<option value="${year}" >${year} 년</option>
						</c:forEach>
	               	</select>
                </div>
        	</div>
		</div>  
		
    	<div class="form-row">
        	<div class="form-group col-md-7 mb-3"></div>
			<div class="form-group col-md-5 mb-3">
                <label for="limitAgeMin" class="col-form-label-sm">나이 제한</label>
                <div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitAgeMin">
						<option value="0" selected="selected">없음</option>
		                <c:forEach var="year" begin="1980" end="2014" step="1">
							<option value="${year}" >${year} 년생 </option>
						</c:forEach>
	               	</select>
	               	<div class="float-left">&nbsp; ~ &nbsp;</div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitAgeMax">
						<option value="0" selected="selected">없음</option>
		                <c:forEach var="year" begin="1980" end="2014" step="1">
							<option value="${year}" >${year} 년생</option>
						</c:forEach>
	               	</select>
                </div>
        	</div>
		</div>  
		
		<div class="form-row">
        	<div class="form-group col-md-12 mb-3">
        		<label for="projectName" class="col-form-label-sm">필수 조건</label>
		       	<div class="mb-2 input-group rounded" id="needs" style="background-color: #F5F5F5; min-height: 40px"></div>
				<div class="mb-3" style="text-align: right">
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#skillSetConfModal" id="skillSetConfModalBtn">설정하기</button>
				</div>
        	</div>	
        </div>
		<div class="form-row">
        	<div class="form-group col-md-12 mb-3">
        		<label for="projectName" class="col-form-label-sm">우대 조건</label>
		       	<div class="mb-2 input-group rounded" id="prefers" style="background-color: #F5F5F5; min-height: 40px"></div>
				<div class="mb-3" style="text-align: right">
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#skillSetConfModal" id="skillSetConfModalBtn">설정하기</button>
				</div>
        	</div>	
        </div>
		
		<div class="mb-3"> 
        	<label for="recruitInfo" class="col-form-label-sm">채용 정보<span class="text-muted">(Optional)</span></label>
			<textarea class="form-control form-control-sm" id="recruitInfo" aria-label="With textarea" rows="4"></textarea>
		</div>
		
		
		<br>
		<br>
		<h6><b>근무 정보</b></h6>
		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="workSido" class="col-form-label-sm">근무지<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="workSido" required onchange="javascript: getSiGunGuTypeReg('workSido','workSiGunGu');">
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/도를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-3 mb-3">
                <label for="workSiGunGu" class="col-form-label-sm">&nbsp;</label>
                <select class="custom-select custom-select-sm d-block w-100" id="workSiGunGu" required>
                	<option value="">시/도를 선택해 주세요.</option>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/군/구를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-7 mb-3">
                <label for="workDetailAddr" class="col-form-label-sm">상세 근무지<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="workDetailAddr" placeholder="ex: 강남구청역 푸르지오">
			</div>
		</div>
		
		<div class="form-row">
        	<div class="form-group col-md-8 mb-3">
                <label for="projectName" class="col-form-label-sm">근무 형태</label>
                <div>
		           	<div class="custom-control custom-checkbox custom-control-inline">
						<input type="checkbox" id="officeWorkYn"  value="Y" class="custom-control-input" checked="checked">
						<label class="custom-control-label custom-control-label-sm" for="officeWorkYn">상주</label>
					</div>
					<div class="custom-control custom-checkbox custom-control-inline">
				 		<input type="checkbox" id="officeHomeWorkYn"  value="Y" class="custom-control-input">
				 		<label class="custom-control-label custom-control-label-sm"  for="officeHomeWorkYn">반상주</label>
					</div>
					<div class="custom-control custom-checkbox custom-control-inline">
				 		<input type="checkbox" id="homeWorkYn"   value="Y" class="custom-control-input">
				 		<label class="custom-control-label custom-control-label-sm"  for="homeWorkYn">재택 가능</label>
					</div>
				</div>
        	</div>
		</div>  
		
		<div class="mb-3"> 
        	<label for="jobInfo" class="col-form-label-sm">직무 안내</label>
			<textarea class="form-control form-control-sm" id="jobInfo" aria-label="With textarea" rows="4"></textarea>
		</div>

		<br>
		<br>
		<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="manager" class="col-form-label-sm">담당자</label>
                <select class="custom-select input-group custom-select-sm d-block" id="manager">
                	<option value="">미정</option>
                	<c:forEach var="manager" items="${ managerList }" >
                		<c:if test="${ sessionScope.customerManager.id eq manager.id }"><option value="${ manager.id }" selected="selected">${ manager.name }</option></c:if>
                		<c:if test="${ sessionScope.customerManager.id ne manager.id }"><option value="${ manager.id }">${ manager.name }</option></c:if>
                	</c:forEach>
		        </select>
        	</div>
		</div>
		<div class="mb-3"> 
        	<label for="managerMemo" class="col-form-label-sm">담당자 메모</label>
			<textarea class="form-control form-control-sm" id="managerMemo" aria-label="With textarea" rows="3"></textarea>
		</div>                                                 
  		<br>
  		<br>
  		<div class="form-row">
			<div class="col-md-5 mb-3">&nbsp;</div>
		  	<div class="col-md-3 mb-3">
		  		<button class="btn btn-primary btn-md btn-block" type="button" id="preview">미리보기</button>
		  	</div>
			<div class="col-md-2 mb-3">
		  		<button  class="btn btn-primary btn-md btn-block" type="button" id="save">저장</button>
		  	</div>
		  	<div class="col-md-2 mb-3">
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button" onclick="javascript: location.href = '/recruit/posting/main.do'">취소</button>
		  	</div>
		</div>
  	</form>
  	</div>
  	
<div class="modal fade" id="projectFindModal" tabindex="-1" role="dialog" aria-labelledby="projectFindModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        		<h5 class="modal-title" id="projectFindModalLabel"><b>프로젝트 찾기</b></h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">프로젝트를 선택해 주세요.</span>
						</div>
						<div class="card-body">
							<table class="table h3 small text-center">
								<thead class="thead-light" style="borde : 1px">
								    	<tr>
								      		<th scope="col">진행상태</th>
								      		<th scope="col" class="">기간</th>
								      		<th scope="col">프로젝트명</th>
								      		<th scope="col">수행사</th>
								      		<th scope="col">위치</th>
								      		<th scope="col">구인</th>
								    	</tr>
							  	</thead>
							  	<tbody  id="projectList">
								</tbody>
							</table>	
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
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
		
		$('#preview').bind('click', function(event) {

		});
		
		$('#save').bind('click', function(event) {
			var form = document.getElementById('regForm');
		  	if (form.checkValidity() === false) {
		    	event.preventDefault();
		        event.stopPropagation();
		        form.classList.add('was-validated');
		    } else {
		    	regPosting();
		    }
		});
		
		$('#deleteProjectBtn').bind('click', function(event) {
			$('#project').val('');
			$('#projectSeq').val('');
		});
		
	    $('#projectFindModal').on('shown.bs.modal', function () {
	    	$('#projectFindModalBtn').trigger('focus');
	    	$('#projectList').html('');
	    	
 			var company = companyList.filter(function (value) {
		        return (value == $('#company').val());
		    });
			if (company.length != 1) {
		    	$('#projectFindModal').modal('hide');
				alert('업체정보를 다시 확인 해주세요.');
				return false;
			}
			
			var param = {}
			param.companySeq = companyInfos[company[0]];
			param.status = ['READY','ING'];
			
 			COMMON.ajax({
			    url : '/business/project/getCompanyProjectListAjax.json',
			    data : JSON.stringify(param),
			    successHandler : function(data){
			    	
			    	var pageInf = data.result.pager;
			    	var list = data.result.list;
			    	$(list).each(function(project) {
			    		
			    		var html = '<tr>' +  '<th>' + project.statusName  + '</th>' + '<td>' + project.statusName  + '</td>' + 
			    	});
			    	//TODO -다음에는 페이지 처리
			    	
			 	 
			    	
			    		
			      		<>${ project.startYmd } ~ ${ project.endYmd }</>
			      		<td><a href="/business/project/viewProject.do?projectSeq=${ project.projectSeq }">${ project.projectName }</a></td>
			      		<td><a href="/business/company/viewCompany.do?companySeq=${ project.mainCompanySeq}">${ project.mainCompanyName }</a></td>
			      		<td>${ project.sido.description }/${ project.sigungu.description }</td>
			      		<td><b>4건</b></td>
			    	</tr>
 
	<small class="d-block text-right mt-3">총 ${ request.totalCount } 건이 조회되었습니다</small>
			    	
			    }
			});
	    	 
	    })
	    
		
		
		COMMON.autoCompleteInput('company', companyList, function() {
			var company = companyList.filter(function (value) {
		        return (value == $('#company').val());
		    });
			return company.length == 1;
		});
		
		
		if ($('#selectedCompanyName').val() != '') {
			$('#company').val($('#selectedCompanyName').val());
			$('#company').css('background-color','#bfeffb');
			$('#company').attr('isMatchItem', true);
			
			$('#project').val('');
			$('#projectSeq').val('');
			
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

function regPosting() {
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
	
	param.projectName = $('#projectName').val();
	
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
	    url : '/recruit/posting/registPostingProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	    	
	    	alert('채용공고를 등록하였습니다.');
			location.href = '/recruit/posting/main.do';
	    }
	});
}

//TODO 등록 후에 프리랜서 검색으로 이동해서 검색되고.... 검색 조건 체크하는 항목
</script>