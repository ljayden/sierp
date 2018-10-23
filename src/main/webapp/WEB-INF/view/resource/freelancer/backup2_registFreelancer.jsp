<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<head>
	
</head>

<main role="main" class="container">
	<br>
	<div class="alert alert-primary" role="alert">
		<h4><b>프리랜서 등록하기</b></h4>
	</div>
	
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<div style="" id="searchInputTap">
			
			<h6><b>인적 사항</b></h6>
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text w100" style="flex : 0.5 1 auto" id="">이름</span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="">
			</div>
			
			<div class="input-group input-group-sm mb-3">	
			  	<div class="input-group-prepend">
			    <span class="input-group-text w100" style="flex : 0.5 1 auto" id="">연락처</span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="">
			</div>
			
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text w100"  style="flex : 0.48 1 auto" id="">E-mail</span>
			  	</div>
			  	<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="">
			</div>

			<div class="input-group input-group-sm mb-3">
							  	
				<div class="input-group-prepend">
			    	<span class="input-group-text w100" id="">생년월일</span>
			  	</div>
			  	<select class="custom-select custom-select-sm" style="flex : 0.16 1 auto" id="sex">
				    <c:forEach var="year" begin="1960" end="2000" step="1">
				    	<c:if test="${ year eq 1980 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 1980 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
			  	</select>
			  	<select class="custom-select custom-select-sm" style="flex : 0.12 1 auto" id="sex">
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
			  	</select>
			  	<select class="custom-select custom-select-sm" style="flex : 0.12 1 auto" id="sex">
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<option value="${ day }">${ day }</option>
				    </c:forEach>
			  	</select>
			  	<div class="w40"></div>
			  	
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="">성별</span>
			  	</div>
			  	<select class="custom-select custom-select-sm" id="sex">
				    <option value="M">남자</option>
				    <option value="F">여자</option>
			  	</select>
			</div>
			
 		 	<div class="input-group input-group-sm mb-3">
			 	<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="inputGroupSelect01">주소</label>
			  	</div>
				<select class="custom-select custom-select-sm" style="flex : 0.23 1 auto" id="inputGroupSelect01">
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도"/>
			  	</select>
 
				<select class="custom-select custom-select-sm" style="flex : 0.23 1 auto" id="inputGroupSelect01">
				   	<mt:enumOptions enumClass="SiGunGuType" emptyValueName="시/군/구"/>
			  	</select>
			  	
			  	<div class="w40"></div>
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="inputGroup-sizing-sm">상세주소</span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
			</div>
 
 			<h6><b>경력 사항</b></h6>
			<div class="input-group input-group-sm mb-3">
			 	<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="workerExpertSel">직무 구분</label>
			  	</div>
				<select class="custom-select custom-select-sm" style="flex : 0.26 1 auto"  id="workerExpertSel">
					<mt:enumOptions enumClass="WorkerExpertType" emptyValueName="선택"></mt:enumOptions>
			  	</select>
			</div>

		 	<div class="input-group input-group-sm mb-3">
			 	<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="inputGroupSelect01">학력</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				    <mt:enumOptions enumClass="AcademicLevel" emptyValueName="선택"/>
			  	</select>
			 	<div class="w40"></div>
			 	
 				<div class="input-group-prepend">
			    	<span class="input-group-text w100" id="">경력 시작일</span>
			  	</div>
			  	<select class="custom-select custom-select-sm" style="flex : 0.16 1 auto" id="sex">
				    <c:forEach var="year" begin="1990" end="2017" step="1">
				    	<c:if test="${ year eq 2000 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 2000 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
			  	</select>
			  	<select class="custom-select custom-select-sm" style="flex : 0.12 1 auto" id="sex">
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
			  	</select>
			  	<div class="w40"></div>
				<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="inputGroupSelect01">책정 등급</label>
			  	</div>
			  	<input type="text" class="form-control" readonly="readonly" style="background-color: #EEEEEE" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="고급"/>
			</div>
	
	
			<h6><b>자격 사항</b></h6>
			자격증 리스트 여부만
			
			<h6><b>보유 기술</b></h6>
			스킬셋
			
			<h6><b>경력</b></h6>
			업체 또는 프리경력
			
			<h6><b>구직 정보</b></h6>
			상주 희망, 비상주 희망, 무관
			정규직희망, 프리랜서 희망 , 무관
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
			    	<span class="input-group-text w100" style="font-size: .875rem;" for="With textarea">메모</span>
			  	</div>
			  	<textarea class="form-control" aria-label="With textarea" rows="3"></textarea>
			</div>
			
			
			<div class="form-group form-check form-check-sm">
			    <input type="checkbox" class="form-check-input form-check-input-sm" id="exampleCheck1">
			    <label class="form-check-label form-check-label-sm" for="exampleCheck1">구직 거절 제외하고 보기</label>
	  		</div>
  		</div>
  		
  		
  		<div style="text-align: right">
	  		<button type="button" class="btn btn-primary btn-sm">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;
	  		<button type="button" class="btn btn-outline-secondary btn-sm">취소</button>
  		</div>
  	</div>
</main>
