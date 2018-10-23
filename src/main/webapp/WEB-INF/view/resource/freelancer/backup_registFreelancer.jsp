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
	<div class="alert alert-warning" role="alert">
		<h4><b>프리랜서 등록하기</b></h4>
	</div>
	
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<div style="" id="searchInputTap">
		
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="">이름</span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="">
			</div>
			
			<div class="input-group input-group-sm mb-3">	
			  	<div class="input-group-prepend">
			    <span class="input-group-text w100" id="">연락처</span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="">
			</div>
			
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="">E-mail</span>
			  	</div>
			  	<input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="">
			</div>

			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="">성별</span>
			  	</div>
			  	<select class="custom-select custom-select-sm" id="sex">
				    <option value="M">남자</option>
				    <option value="F">여자</option>
			  	</select>
			  	<div class="w40"></div>
			  	
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="">생년월일</span>
			  	</div>
			  	<select class="custom-select custom-select-sm" style="flex : 0.2 1 auto" id="sex">
				    <c:forEach var="year" begin="1960" end="2000" step="1">
				    	<c:if test="${ year eq 1980 }"><option value="${year}" selected="selected">${year}</option></c:if>
				    	<c:if test="${ year ne 1980 }"><option value="${year}">${year}</option></c:if>
				    </c:forEach>
			  	</select>
			  	<select class="custom-select custom-select-sm" style="flex : 0.15 1 auto" id="sex">
				    <c:forEach var="month" begin="1" end="12" step="1">
				    	<option value="${ month }">${ month }</option>
				    </c:forEach>
			  	</select>
			  	<select class="custom-select custom-select-sm" style="flex : 0.15 1 auto" id="sex">
				    <c:forEach var="day" begin="1" end="31" step="1">
				    	<option value="${ day }">${ day }</option>
				    </c:forEach>
			  	</select>
			</div>
			
			
 		 	<div class="input-group input-group-sm mb-3">
			 	<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="inputGroupSelect01">시/도</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도"/>
			  	</select>
			 	<div class="w40"></div>
			 	
			 	<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="inputGroupSelect01">시/군/구</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				   	<mt:enumOptions enumClass="SiGunGuType" emptyValueName="시/군/구"/>
			  	</select>
			</div>
			
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text w100" id="inputGroup-sizing-sm">상세주소</span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
			</div>
			
			
			
			<div class="input-group input-group-sm mb-3">
			 	<div class="input-group-prepend">
			    	<label class="input-group-text w100" for="workerExpertSel">직무 구분</label>
			  	</div>
				<select class="custom-select custom-select-sm"  id="workerExpertSel">
					<mt:enumOptions enumClass="WorkerExpertType" emptyValueName="선택"></mt:enumOptions>
			  	</select>
			  	<div class="w600"></div>
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
			    	<label class="input-group-text w100" for="inputGroupSelect01">전문 영역</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				    <option selected>전체</option>
				    <option value="1">개발자</option>
				    <option value="2">퍼블리셔</option>
				    <option value="3">기획</option>
			  	</select>
			</div>
	

			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text w100" for="With textarea">메모</span>
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
