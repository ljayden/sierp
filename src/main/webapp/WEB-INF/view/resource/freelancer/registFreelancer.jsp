<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<head>
</head>

<main role="main" class="container">
	<div class="my-3 p-3 bg-white rounded shadow-sm">
	<h4 class="mb-3">프리랜서 등록하기</h4>
	
    <form class="needs-validation" id="regForm" novalidate> <!--  -->
    	<div class="form-row">
        	<div class="form-group col-md-5 mb-3">
                <label for="name" class="col-form-label-sm">이름</label>
                <input type="text" class="form-control form-control-sm" id="name" required>
            	<div class="invalid-feedback">이름을 입력해 주세요.</div>
        	</div>
            <div class="form-group col-md-4 mb-3">
              	<label for="email" class="col-form-label-sm">Email</label>
            	<input type="email" class="form-control form-control-sm" id="email" placeholder="ex:freelancer@example.com" required>
            	<div class="invalid-feedback">이메일을 입력해 주세요.</div>
        	</div>
            <div class="form-group col-md-3 mb-3">
              	<label for="phoneNo" class="col-form-label-sm">연락처<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm" id="phoneNo">
                <div class="invalid-feedback" style="width: 100%;">연락처를 입력해 주세요.</div>
        	</div>
		</div>
        <div class="form-row">
			<div class="form-group col-md-5 mb-3">
				<label for="" class="col-form-label-sm">성별</label>&nbsp;&nbsp;
	       		<div></div>
	           	<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="genderM" name="gender" class="custom-control-input" value="M" checked="checked">
					<label class="custom-control-label custom-control-label-sm" for="genderM">남자</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
			 		<input type="radio" id="genderF" name="gender" value="M" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="genderF">여자</label>
				</div>
			</div>
        	<div class="form-group col-md-3 mb-3">
            	<label for="birthYear" class="col-form-label-sm">생년월일<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="birthYear"  required>
                	<option value="">년도 선택</option>
 					<c:forEach var="year" begin="1960" end="2000" step="1">
				    	<c:if test="${ year eq 1985 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 1985 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
                </select>
                <div class="invalid-feedback">년도를 선택해 주세요.</div>
			</div>
            <div class="form-group col-md-2 mb-3">
              	<label for="birthMonth" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="birthMonth">
               		<option value="">월 선택</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
              	</select>
            </div>
            <div class="col-md-2 mb-3">
                <label for="birthDay" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="birthDay">
               		<option value="">날짜 선택</option>
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<option value="${ day }">${ day }</option>
				    </c:forEach>
              	</select>
            </div>
        </div>      

		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="sido" class="col-form-label-sm">주소</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sido" required>
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/도를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-3 mb-3">
                <label for="sigungu" class="col-form-label-sm">&nbsp;</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sigungu" required>
				    <mt:enumOptions enumClass="SiGunGuType" emptyValueName="시/군/구 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/군/구를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-7 mb-3">
                <label for="addrDetail" class="col-form-label-sm">상세주소<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="addrDetail" placeholder="ex: 강남구청역 푸르지오">
			</div>
		</div>
		<hr class="mb-4">
		<div class="form-row">
			<div class="form-group col-md-3 mb-3">
				<select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="expertType" required>
	            	<mt:enumOptions enumClass="WorkerExpertType" emptyValueName="직업 선택"></mt:enumOptions>
	            </select>
	            <div class="invalid-feedback">직업을 선택해 주세요.</div>
	        </div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-5 mb-3">
				<div class="form-row">
						<div class="form-group col-md-5 mb-3">
						<label for="careerStartYear" class="col-form-label-sm">경력 시작일</label>
						<select class="custom-select custom-select-sm d-block " id="careerStartYear" required>
			                <c:forEach var="year" begin="1990" end="2017" step="1">
								<c:if test="${ year eq 2012 }"><option value="${year}" selected="selected">${year}</option></c:if>
							    <c:if test="${ year ne 2012 }"><option value="${year}">${year}</option></c:if>
							</c:forEach>
						</select>
						<div class="invalid-feedback">경력 시작 년도를 선택해 주세요.</div>
					</div>
					<div class="form-group col-md-7 mb-3">
						<label for="careerStartMonth" class="col-form-label-sm">&nbsp;</label>
						<select class="custom-select custom-select-sm d-block w-50" id="careerStartMonth" required>
						    <c:forEach var="month" begin="1" end="12" step="1">
						    	<option value="${ month }">${ month }</option>
						    </c:forEach>
						</select>
						<div class="invalid-feedback">경력 시작월을 선택해 주세요.</div>
					</div>
				</div>
			</div>
			<div class="form-group col-md-2 mb-3">
				<label for="academicLevel" class="col-form-label-sm">학력</label>
                <select class="custom-select custom-select-sm d-block w-100" id="academicLevel" required>
                	<mt:enumOptions enumClass="AcademicLevel" emptyValueName="선택"/>
                </select>
                <div class="invalid-feedback">학력을 선택해 주세요.</div>
			</div>
			
			<div class="form-group col-md-5 mb-3">
				<label for="" class="col-form-label-sm">산정 등급(경력 + 학력)</label>
                <input type="text" class="form-control form-control-sm" id=""  value="" readonly="readonly">
			</div>
		</div>

		
		<hr class="mb-4">
		<h6><b>보유기술</b></h6>
       	<div class="mb-3 input-group" id="skillSets"></div>
		<div class="mb-3" style="text-align: right">
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#skillSetConfModal" id="skillSetConfModalBtn">설정하기</button>
		</div>
		
		<hr class="mb-4">
		<h6><b>우대조건</b></h6>
       	<div class="mb-3 input-group" id="preferences"></div>
		<div class="mb-3" style="text-align: right">
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#preferenceConfModal" id="skillSetConfModalBtn">설정하기</button>
		</div>
		
		
		<hr class="mb-4">
		<h6><b>자격 사항</b></h6>
       	<div class="mb-3 input-group" id="licenses"></div>
		<div class="mb-3" style="text-align: right">
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#licenseConfModal" id="licenseConfModalBtn">설정하기</button>
		</div>
		
		
        <hr class="mb-4">
        <h6><b>경력 사항</b></h6><br>
		<div id="careers">
        </div>
        
        <div class="form-row">
         	<div class="form-group col-md-9 mb-3">
         		<div class="form-row">
					<div class="form-group input-group col-md-3 mb-3">
		        		<select class="custom-select input-group custom-select-sm d-block" id="careersStartYear">
		               		<option value="">년도</option>
		 					<c:forEach var="year" begin="1996" end="2020" step="1">
						    	<option value="${year}">${year}년</option>
						    </c:forEach>
		              	</select>
						<select class="custom-select input-group custom-select-sm d-block" id="careersStartMonth">
		               		<option value="">월</option>
						    <c:forEach var="month" begin="1" end="12" step="1">
						    	<option value="${ month }">${ month }월</option>
						    </c:forEach>
		              	</select>
		        	</div>	
					<div class="form-group input-group col-md-3 mb-3">
		        		<select class="custom-select input-group custom-select-sm d-block" id="careersEndYear">
		               		<option value="">년도</option>
		 					<c:forEach var="year" begin="1996" end="2020" step="1">
						    	<option value="${year}">${year}년</option>
						    </c:forEach>
		              	</select>
						<select class="custom-select input-group custom-select-sm d-block" id="careersEndMonth">
		               		<option value="">월</option>
						    <c:forEach var="month" begin="1" end="12" step="1">
						    	<option value="${ month }">${ month }월</option>
						    </c:forEach>
		              	</select>
		        	</div>	
		        	<div class="form-group col-md-2 mb-3">
		        		<select class="custom-select custom-select-sm d-block " id="careersRecruitType">
			            	<mt:enumOptions enumClass="RecruitType" emptyValueName="선택"/>
						</select>
		        	</div>
		        	<div class="form-group col-md-4 mb-3">
		        		<input type="text" class="form-control form-control-sm" id="careersJob" placeholder="업무"  value="">
		        	</div>
         		</div>  
         	</div>
        	<div class="form-group col-md-3 mb-3">
        		<div class="form-row">
        		    <div class="form-group col-md-10 mb-3">
		        		<input type="text" class="form-control form-control-sm" id="careersCompanyName" placeholder="직장명"  value="">
		        	</div>
		        	<div class="form-group col-md-2 mb-3">
		        		<button type="button" class="btn btn-outline-dark btn-sm btn-block" onclick="javascript:addCareer()"><strong>&#43;</strong></button>
		        	</div>
        		</div>
        	</div>
        </div>
        
        
        <hr class="mb-4">
        <h6><b>구직 정보</b></h6>
        <div class="form-row">
        	<div class="col-md-6 mb-3">
	           	<div class="custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" id="hopeWorkPosiType4" name="hopeWorkPosiType" value="4" class="custom-control-input" checked="checked">
					<label class="custom-control-label custom-control-label-sm" for="hopeWorkPosiType4">상주</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="hopeWorkPosiType2" name="hopeWorkPosiType" value="2" class="custom-control-input" checked="checked">
			 		<label class="custom-control-label custom-control-label-sm"  for="hopeWorkPosiType2">반상주</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="hopeWorkPosiType1" name="hopeWorkPosiType" value="1" class="custom-control-input" checked="checked">
			 		<label class="custom-control-label custom-control-label-sm"  for="hopeWorkPosiType1">재택</label>
				</div>
        	</div>
        	<div class="col-md-6 mb-3">
	           	<div class="custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" id="hopeRecruitType16" name="hopeRecruitType"  value="16" class="custom-control-input">
					<label class="custom-control-label custom-control-label-sm" for="hopeRecruitType16">정규직</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="hopeRecruitType8" name="hopeRecruitType"  value="8" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="hopeRecruitType8">프리랜서</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="hopeRecruitType2" name="hopeRecruitType"  value="2" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="hopeRecruitType2">알바</label>
				</div>
        	</div>
        </div>
		<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="manager" class="col-form-label-sm">담당자</label>
                <select class="custom-select input-group custom-select-sm d-block" id="manager">
                	<c:forEach var="manager" items="${ managerList }" >
                		<option value="${ manager.id }">${ manager.name }</option>
                	</c:forEach>
	            	
		        </select>
        	</div>
		</div>
		<div class="mb-3"> 
        	<label for="cutomerMemo" class="col-form-label-sm">담당자 메모</label>
			<textarea class="form-control form-control-sm" id="cutomerMemo" aria-label="With textarea" rows="3"></textarea>
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


<!-- Generated markup by the plugin -->
<div class="tooltip bs-tooltip-top" id="aaa" role="tooltip">
  <div class="arrow"></div>
  <div class="tooltip-inner">
    Some tooltip text!
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="licenseConfModal" tabindex="-1" role="dialog" aria-labelledby="licenseConfModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="licenseConfModalLabel"><b>자격 사항 설정</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="licensePopupDiv">
					<!-- 자격증 추가되는 영역 -->
					</div>
					<br>
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">자격증을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body">
							<c:forEach var="advantage" items="${ advantageList }">
								<c:if test="${ advantage.advantageType eq 'LICENSE' }">
									<c:if test="${ advantage.customerCode eq 'COMMON' }">
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:licenseSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>

<div class="modal fade" id="preferenceConfModal" tabindex="-1" role="dialog" aria-labelledby="preferenceConfModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="preferenceConfModalLabel"><b>우대조건  설정</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="preferencePopupDiv">
			       		 <!-- 우대조건 추가되는 영역 -->
					</div>
					<br>
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">우대조건을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body">
							<c:forEach var="advantage" items="${ advantageList }">
								<c:if test="${ advantage.advantageType eq 'PREFERENCE' }">
									<c:if test="${ advantage.customerCode eq 'COMMON' }">
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:preferenceSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>

<div class="modal fade" id="skillSetConfModal" tabindex="-1" role="dialog" aria-labelledby="skillSetConfModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="skillSetConfModalLabel"><b>보유 기술  설정</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="skillSetPopupDiv">
					</div>
					<br>
					<div class="accordion small" id="accordionSkillSet">
						<div class="card">
							<c:forEach var="skillSetType" items="${ skillSetTypeList }">
								<div class="card-header" style="padding: .35rem .75rem;" id="heading${ skillSetType }">
	   								<h5 class="mb-0">
	     							<button class="btn btn-link collapsed btn-sm" type="button" data-toggle="collapse" data-target="#collapse${skillSetType}" aria-expanded="false" aria-controls="collapse${skillSetType}">
	       							${ skillSetType.description } - 관련 기술
	     							</button>
	   								</h5>
								</div>
								
								<div id="collapse${ skillSetType }" class="collapse p-2" aria-labelledby="heading${ skillSetType }" data-parent="#accordionSkillSet">
									<div class="card-body" style="padding: .35rem .75rem;">
									<c:forEach var="advantage" items="${ advantageList }">
										<c:if test="${ advantage.advantageType eq 'SKILL' and advantage.skillSetType eq skillSetType }">
											<c:if test="${ advantage.customerCode eq 'COMMON' }">
												<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
												${ advantage.advantageName }</button>
											</c:if>
											<c:if test="${ advantage.customerCode ne 'COMMON' }">
												<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
												${ advantage.advantageName }</button>
											</c:if>
										</c:if>
									</c:forEach>
									</div>
								</div>
							</c:forEach>
							
							
						</div>
					</div>  	
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:skillSetSave();">적용</button>
      		</div>
    	</div>
  	</div>
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
	    
    $('#licenseConfModal').on('shown.bs.modal', function () {
    	 $('#licenseConfModalBtn').trigger('focus');
    	 $('#licensePopupDiv').append($('#licenses').html())
    })
    
    $('#preferenceConfModal').on('shown.bs.modal', function () {
    	 $('#preferenceConfModalBtn').trigger('focus');
    	 $('#preferencePopupDiv').append($('#preferences').html())
    })
    
    $('#skillSetConfModal').on('shown.bs.modal', function () {
    	 $('#skillSetConfModalBtn').trigger('focus');
    	 $('#skillSetPopupDiv').append($('#skillSets').html())
    })
	    
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
	param.customMemo = $('#customMemo').val();
	
	//경력
	var careers = new Array();
	$('.careersRowData').each(function(obj) {
		careers.push($(this).val());
	});
	param.careers = careers;

	 
	var preferences = new Array();
	$('.preferenceRow').each(function(obj) {
		preferences.push($(this).attr('data'));
	});
	param.preferences = preferences;
 
	
	var licenses = new Array();
	$('.licenseRow').each(function(obj) {
		licenses.push($(this).attr('data'));
	});
	param.licenses = licenses;
	
	
	var skillSets = new Array();
	$('.skillSetRow').each(function(obj) {
		skillSets.push($(this).attr('data'));
	});
	param.skillSets = skillSets;

	event.preventDefault();
    event.stopPropagation();
 
	COMMON.ajax({
	    url : '/resource/freelancer/registFreelancerProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	       alert('프리랜서를 등록하였습니다.');
	    }
	});
}

var careerRowIndex = 1;
function addCareer() {
	if ($('#careersStartYear').val() == '') {
		alert('시작 년도를 입력해 주세요.');
		return false;
	}
	
	if ($('#careersStartMonth').val() == '') {
		alert('시작 월을 입력해 주세요.');
		return false;
	}
	
	if ($('#careersEndYear').val() == '') {
		alert('종료 년도를 입력해 주세요.');
		return false;
	}
	
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
			'<div class="form-group input-group col-md-3 mb-3">' +
				'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersEndYear').val() + ' 년">' +
				'<input type="text" class="form-control form-control-sm" disabled="disabled" value="' + $('#careersEndMonth').val() + ' 월">' +
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


function licenseAdd(seq, name, customCode) {
	//있으면 추가안하는 로직도 해야하고, 그러려면 seq를 찾아야 하고
	var color = customCode == 'COMMON' ? 'info' : 'warning';
	var divId = 'license' + seq; 
	if ($('#licensePopupDiv #' + divId).length > 0) {
		//이미 자격증이 추가되어 있다면
		return false;
	}
	
	var html  = 
		'<div class="card small licenseRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-4" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#licensePopupDiv').append(html);
}

function licenseSave() {
	$('#licenses').html('');
	$('#licenses').append($('#licensePopupDiv').html());
	$('#licensePopupDiv').html('');
	$('#licenseConfModal').modal('hide');
}


function preferenceAdd(seq, name, customCode) {
	//있으면 추가안하는 로직도 해야하고, 그러려면 seq를 찾아야 하고
	var color = customCode == 'COMMON' ? 'info' : 'warning';
	var divId = 'preference' + seq; 
	if ($('#preferencePopupDiv #' + divId).length > 0) {
		//이미 자격증이 추가되어 있다면
		return false;
	}
	
	var html  = 
		'<div class="card small preferenceRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-4" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#preferencePopupDiv').append(html);
}

function preferenceSave() {
	$('#preferences').html('');
	$('#preferences').append($('#preferencePopupDiv').html());
	$('#preferencePopupDiv').html('');
	$('#preferenceConfModal').modal('hide');
}


function skillSetAdd(seq, name, customCode) {
	//있으면 추가안하는 로직도 해야하고, 그러려면 seq를 찾아야 하고
	var color = customCode == 'COMMON' ? 'info' : 'warning';
	var divId = 'skillSet' + seq; 
	if ($('#skillSetPopupDiv #' + divId).length > 0) {
		//이미 자격증이 추가되어 있다면
		return false;
	}
	
	var html  = 
		'<div class="card small skillSetRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-4" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#skillSetPopupDiv').append(html);
}

function skillSetSave() {
	$('#skillSets').html('');
	$('#skillSets').append($('#skillSetPopupDiv').html());
	$('#skillSetPopupDiv').html('');
	$('#skillSetConfModal').modal('hide');
}
</script>