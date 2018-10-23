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
	
    <form class="needs-validation" novalidate>
    	<div class="row">
        	<div class="col-md-5 mb-3">
                <label for="firstName" class="col-form-label-sm">이름</label>
                <input type="text" class="form-control form-control-sm" id="name" placeholder="" value="" required>
            	<div class="invalid-feedback">이름을 입력해 주세요.</div>
        	</div>
            <div class="col-md-7 mb-3">
              	<label for="username" class="col-form-label-sm">연락처<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm" id="username" placeholder="">
                <div class="invalid-feedback" style="width: 100%;">연락처를 입력해 주세요.</div>
        	</div>
		</div>
		<div class="mb-3">
        	<label for="email" class="col-form-label-sm">Email</label>
            <input type="email" class="form-control form-control-sm" id="email" placeholder="ex:freelancer@example.com" required>
            <div class="invalid-feedback">이메일을 입력해 주세요.</div>
        </div>
        <div class="row">
			<div class="col-md-5 mb-3">
				<label for="firstName" class="col-form-label-sm">성별</label>&nbsp;&nbsp;
	       		<div></div>
	           	<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input" checked="checked">
					<label class="custom-control-label custom-control-label-sm" for="customRadioInline1">남자</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
			 		<input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="customRadioInline2">여자</label>
				</div>
			</div>
        	<div class="col-md-3 mb-3">
            	<label for="country" class="col-form-label-sm">생년월일<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id=""  required>
                	<option value="">년도 선택</option>
 					<c:forEach var="year" begin="1960" end="2000" step="1">
				    	<c:if test="${ year eq 1980 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 1980 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
                </select>
                <div class="invalid-feedback">년도를 선택해 주세요.</div>
			</div>
            <div class="col-md-2 mb-3">
              	<label for="country" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="">
               		<option value="">월 선택</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
              	</select>
            </div>
            <div class="col-md-2 mb-3">
                <label for="country" class="col-form-label-sm">&nbsp;</label>
               	<select class="custom-select custom-select-sm d-block w-100" id="">
               		<option value="">날짜 선택</option>
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<option value="${ day }">${ day }</option>
				    </c:forEach>
              	</select>
            </div>
        </div>      

		<div class="row">
			<div class="col-md-2 mb-3">
                <label for="firstName" class="col-form-label-sm">주소</label>
                <select class="custom-select custom-select-sm d-block w-100" required>
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/도를 선택해 주세요.</div>
			</div>
			<div class="col-md-3 mb-3">
                <label for="firstName" class="col-form-label-sm">&nbsp;</label>
                <select class="custom-select custom-select-sm d-block w-100" required>
				    <mt:enumOptions enumClass="SiGunGuType" emptyValueName="시/군/구 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/군/구를 선택해 주세요.</div>
			</div>
			<div class="col-md-7 mb-3">
                <label for="firstName" class="col-form-label-sm">상세주소<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="username" placeholder="ex: 강남구청역 푸르지오">
			</div>
		</div>
		<hr class="mb-4">
		<div class="row">
			<div class="col-md-3 mb-3">
				<select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="" required>
	            	<mt:enumOptions enumClass="WorkerExpertType" emptyValueName="직업 선택"></mt:enumOptions>
	            </select>
	            <div class="invalid-feedback">직업을 선택해 주세요.</div>
	        </div>
		</div>
		<div class="row">
			<div class="col-md-3 mb-3">
				<label for="" class="col-form-label-sm">경력 시작일</label>
				<select class="custom-select custom-select-sm d-block " id="" required>
					<option value="">년도 선택</option>
	                <c:forEach var="year" begin="1990" end="2017" step="1">
						<c:if test="${ year eq 2012 }"><option value="${year}" selected="selected">${year}</option></c:if>
					    <c:if test="${ year ne 2012 }"><option value="${year}">${year}</option></c:if>
					</c:forEach>
				</select>
				<div class="invalid-feedback">경력 시작 년도를 선택해 주세요.</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="" class="col-form-label-sm">&nbsp;</label>
				<select class="custom-select custom-select-sm d-block" id="" required>
					<option value="">월 선택</option>
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
				</select>
				<div class="invalid-feedback">경력 시작 월을 선택해 주세요.</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="" class="col-form-label-sm">학력</label>
                <select class="custom-select custom-select-sm d-block w-100" id="" required>
                	<mt:enumOptions enumClass="AcademicLevel" emptyValueName="선택"/>
                </select>
                <div class="invalid-feedback">학력을 선택해 주세요.</div>
			</div>
			<div class="col-md-4 mb-3">
				<label for="" class="col-form-label-sm">산정 등급</label>
                <input type="text" class="form-control form-control-sm" id="" placeholder="" value="" readonly="readonly">
			</div>
		</div>
		
		<hr class="mb-4">
		<h6><b>자격 사항</b></h6>
       	<div class="mb-3">
       		<div class="card card-sm" style="background-color: #F7F7F7">
	  			<div class="card-body" style="padding: 0.4rem;">
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;" disabled="disabled">정보처리기사</button>
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;"disabled="disabled">CCOA</button>
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;" disabled="disabled">NAP</button>
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;" disabled="disabled">Oracle Master</button>
	  			</div>
			</div>
		</div>
		<div class="mb-3" style="text-align: right">
			<button type="button" class="btn btn-info btn-sm">설정하기</button>
		</div>
		
        <hr class="mb-4">
        <h6><b>보유 기술</b></h6>
       	<div class="mb-3">
       		<div class="card card-sm" style="background-color: #F7F7F7">
	  			<div class="card-body" style="padding: 0.4rem;">
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;" disabled="disabled">Java</button>
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;"disabled="disabled">Jsp</button>
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;" disabled="disabled">Oracle</button>
		       	<button type="button" class="btn btn-outline-primary btn-sm" style="background-color: white;" disabled="disabled">JQuery</button>
	  			</div>
			</div>
		</div>
		<div class="mb-3" style="text-align: right">
			<button type="button" class="btn btn-info btn-sm">설정하기</button>
		</div>
        <hr class="mb-4">
        <h6><b>경력 사항</b></h6>
        <div class="row">
            <div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="1992.05">
        	</div>	
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="1994.03">
        	</div>
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="정규직">
        	</div>
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="개발">
        	</div>
        	<div class="col-md-3 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="농협은행">
        	</div>
        	<div class="col-md-1 mb-3">
        		<button type="button" class="btn btn-outline-dark btn-sm btn-block">X</button>
        	</div>
        </div>
        <div class="row">
            <div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="1994.05">
        	</div>	
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="1996.01">
        	</div>
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="프리랜서">
        	</div>
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="개발">
        	</div>
        	<div class="col-md-3 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="" disabled="disabled" value="농협은행">
        	</div>
        	<div class="col-md-1 mb-3">
        		<button type="button" class="btn btn-outline-dark btn-sm btn-block">X</button>
        	</div>
        </div>
         <div class="row">
            <div class="col-md-2 mb-3">
        		<select class="custom-select custom-select-sm d-block " id="" required>
					<option value="">년도 선택</option>
	                <c:forEach var="year" begin="1990" end="2017" step="1">
						<c:if test="${ year eq 2012 }"><option value="${year}" selected="selected">${year}</option></c:if>
					    <c:if test="${ year ne 2012 }"><option value="${year}">${year}</option></c:if>
					</c:forEach>
				</select>
        	</div>	
        	<div class="col-md-2 mb-3">
        		<select class="custom-select custom-select-sm d-block " id="" required>
					<option value="">년도 선택</option>
	                <c:forEach var="year" begin="1990" end="2017" step="1">
						<c:if test="${ year eq 2012 }"><option value="${year}" selected="selected">${year}</option></c:if>
					    <c:if test="${ year ne 2012 }"><option value="${year}">${year}</option></c:if>
					</c:forEach>
				</select>
        	</div>
        	<div class="col-md-2 mb-3">
        		<select class="custom-select custom-select-sm d-block " id="" required>
        			<option value="">선택</option>
	               	<option>정규직</option>
				</select>
        	</div>
        	<div class="col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="업무"  value="">
        	</div>
        	<div class="col-md-3 mb-3">
        		<input type="text" class="form-control form-control-sm" id="username" placeholder="직장명"  value="">
        	</div>
        	<div class="col-md-1 mb-3">
        		<button type="button" class="btn btn-outline-dark btn-sm btn-block">추가</button>
        	</div>
         </div>
        <hr class="mb-4">
        <h6><b>구직 정보</b></h6>
        <div class="row">
        	<div class="col-md-6 mb-3">
	           	<div class="custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" id="customCheckboxInline1" name="customCheckboxInline1" class="custom-control-input">
					<label class="custom-control-label custom-control-label-sm" for="customCheckboxInline1">상주</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="customCheckboxInline2" name="customCheckboxInline1" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="customCheckboxInline2">반상주</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="customCheckboxInline3" name="customCheckboxInline1" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="customCheckboxInline3">재택</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="customCheckboxInline4" name="customCheckboxInline1" class="custom-control-input" checked="checked">
			 		<label class="custom-control-label custom-control-label-sm"  for="customCheckboxInline4">무관</label>
				</div>
        	</div>
        	<div class="col-md-6 mb-3">
	           	<div class="custom-control custom-checkbox custom-control-inline">
					<input type="checkbox" id="customCheckboxInline21" name="customCheckboxInline22" class="custom-control-input">
					<label class="custom-control-label custom-control-label-sm" for="customCheckboxInline21">정규직</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="customCheckboxInline22" name="customCheckboxInline22" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="customCheckboxInline22">프리랜서</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="customCheckboxInline23" name="customCheckboxInline22" class="custom-control-input">
			 		<label class="custom-control-label custom-control-label-sm"  for="customCheckboxInline23">단기 알바</label>
				</div>
				<div class="custom-control custom-checkbox custom-control-inline">
			 		<input type="checkbox" id="customCheckboxInline24" name="customCheckboxInline22" class="custom-control-input" checked="checked">
			 		<label class="custom-control-label custom-control-label-sm"  for="customCheckboxInline24">무관</label>
				</div>
        	</div>
        </div>
  		<br>
  		<br>
  		<div class="row">
			<div class="col-md-8 mb-3">&nbsp;</div>
			<div class="col-md-2 mb-3">
		  		<button class="btn btn-primary btn-md btn-block" type="submit">저장</button>
		  	</div>
		  	<div class="col-md-2 mb-3">
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button">취소</button>
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
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
</script>