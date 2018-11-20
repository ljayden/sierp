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
	
    <form class="needs-validation" id="regForm" novalidate> <!--  -->
    	<div class="form-row">
        	<div class="form-group col-md-4 mb-3">
                <label for="name" class="col-form-label-sm">업체명</label>
                <input type="text" class="form-control form-control-sm" id="name" required>
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
            <div class="form-group col-md-4 mb-3">
              	<label for="phoneNo" class="col-form-label-sm">사업자번호<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm" id="bizNo">
        	</div>
		</div>
  
		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="sido" class="col-form-label-sm">주소</label>
                <select class="custom-select custom-select-sm d-block w-100" id="sido"  onchange="javascript: getSiGunGuTypeReg('sigungu');">
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
 				<input type="text" class="form-control form-control-sm" id="addrDetail" placeholder="ex: 강남구청역 푸르지오">
			</div>
		</div>
	 
		이름/핸드폰/자리번호/이메일/직급/부서/메모
        <hr class="mb-3">
        <h6><b>업체 담당자 </b></h6><br>
        <div class="form-row">
         	<div class="form-group col-md-2 mb-3">
		        <input type="text" class="form-control form-control-sm" id="careersJob" placeholder="이름"  value="">
         	</div>
        	<div class="form-group col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="careersJob" placeholder="핸드폰"  value="">
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="careersJob" placeholder="회사연락처"  value="">
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="careersJob" placeholder="이메일"  value="">
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="careersJob" placeholder="직급"  value="">
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<input type="text" class="form-control form-control-sm" id="careersJob" placeholder="부서"  value="">
        	</div>
        </div>
        
         
		<div class="mb-3"> 
        	<label for="cutomerMemo" class="col-form-label-sm">담당자 메모</label>
			<textarea class="form-control form-control-sm" id="customerMemo" aria-label="With textarea" rows="3"></textarea>
		</div>                                                 
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
		    	//regFreelancer(event);
		    }
		    
	    }, false);
	});
	    
   
	}, false);
})();


</script>