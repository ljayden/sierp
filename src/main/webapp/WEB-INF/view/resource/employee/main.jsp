<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
	
</head>

<main role="main" class="container">

	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<div style="" id="searchInputTap">
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-sm">이름검색 </span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
			</div>
		 	<div class="input-group input-group-sm mb-3">
			 	<div class="input-group-prepend">
			    	<label class="input-group-text" for="inputGroupSelect01">등급구분</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				    <option selected>전체</option>
				    <option value="1">초급</option>
				    <option value="2">중급</option>
				    <option value="3">고급</option>
				    <option value="3">전체</option>
			  	</select>
			 	<div class="input-group-prepend">
			    	<label class="input-group-text" for="inputGroupSelect01">전문 영역</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				    <option selected>전체</option>
				    <option value="1">개발자</option>
				    <option value="2">퍼블리셔</option>
				    <option value="3">기획</option>
			  	</select>
			</div>
	
			<div class="form-group form-check form-check-sm">
			    <input type="checkbox" class="form-check-input form-check-input-sm" id="exampleCheck1">
			    <label class="form-check-label form-check-label-sm" for="exampleCheck1">구직 거절 제외하고 보기</label>
	  		</div>
  		</div>
  		<div style="text-align: right"><button type="button" class="btn btn-outline-secondary btn-sm">검색 조건 닫기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-sm">조회</button></div>
  	</div>
 
	<table class="table h3 small text-center">
		<thead class="thead-dark" style="borde : 1px">
	    	<tr>
	      		<th scope="col" class="text-center">이름</th>
	      		<th scope="col" class="">직급</th>
	      		<th scope="col" class="">구분</th>
	      		<th scope="col" class="">현 프로젝트</th>
	      		<th scope="col" class="">파견일</th>
	      		<th scope="col" class="">종료일</th>
	    	</tr>
	  	</thead>
	  	<tbody>
	    	<tr>
	      		<th scope="row">김철수</th>
	      		<td>대리</td>
	      		<td>개발자</td>
	      		<td>한국은행 차세데 프로젝트</td>
	      		<td>2018.12.17</td>
	      		<td>2019.04.17</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">이영희</th>
	      		<td>과장</td>
	      		<td>퍼블리셔</td>
	      		<td>한국은행 차세데 프로젝트</td>
	      		<td>2018.12.17</td>
	      		<td>2019.04.17</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">최흥부</th>
	      		<td>과장</td>
	      		<td>개발자</td>
	      		<td>네이버 파견 프로젝트</td>
	      		<td>2018.12.17</td>
	      		<td>2019.04.17</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">박놀부</th>
	      		<td>과장</td>
	      		<td>개발자</td>
	      		<td> </td>
	      		<td> </td>
	      		<td> </td>
	    	</tr>
		</tbody>
	</table>
	<small class="d-block text-right mt-3">총 4 명이 조회되었습니다</small>
</main>
