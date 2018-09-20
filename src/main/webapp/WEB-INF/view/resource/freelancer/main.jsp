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
			    	<label class="input-group-text" for="inputGroupSelect01">계약 상태</label>
			  	</div>
				<select class="custom-select custom-select-sm" id="inputGroupSelect01">
				    <option selected>전체</option>
				    <option value="1">계약</option>
				    <option value="2">계약 진행중</option>
				    <option value="3">없음</option>
			  	</select>
			</div>
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
  	
  	<button type="button" class="btn btn-success btn-sm " >프리랜서 등록하기</button>
  	
  	<div style="height: 6px;"></div>
	<table class="table h3 small text-center">
		<thead class="thead-dark" style="borde : 1px">
	    	<tr>
	      		<th scope="col" class="text-center">이름</th>
	      		<th scope="col">등급 구분</th>
	      		<th scope="col">전문 영역</th>
	      		<th scope="col">출생년도</th>
	      		<th scope="col">주소</th>
	      		<th scope="col" class="">계약 상태</th>
	      		<th scope="col" class="">계약 정보</th>
	      		<th scope="col" class="">계약 기간</th>
	      		<th scope="col" class="">구직 구분</th>
	      		<th scope="col">주 담당자</th>
	    	</tr>
	  	</thead>
	  	<tbody>
	    	<tr>
	      		<th scope="row">김철수</th>
	      		<td>중급</td>
	      		<td>개발자</td>
	      		<td>1985</td>
	      		<td>서울/강동구</td>
	      		<td><b>계약</b></td>
	      		<td>농협 차세대 개발</td>
	      		<td>2018.04 ~ 2019.04</td>
	      		<td></td>
	      		<td>김말단</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">이갑수</th>
	      		<td>초급</td>
	      		<td>퍼블리셔</td>
	      		<td>1991</td>
	      		<td>경기/성남시</td>
	      		<td><b>진행중</b></td>
	      		<td></td>
	      		<td></td>
	      		<td>구직 희망</td>
	      		<td>김과장</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">차영희</th>
	      		<td>중급</td>
	      		<td>개발자</td>
	      		<td>1984</td>
	      		<td>경기/과천시</td>
	      		<td><b>없음</b></td>
	      		<td></td>
	      		<td></td>
	      		<td>구직 희망</td>
	      		<td>김과장</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">이갑수</th>
	      		<td>초급</td>
	      		<td>개발자</td>
	      		<td>1987</td>
	      		<td>서울/도봉구</td>
	      		<td><b>없음</b></td>
	      		<td></td>
	      		<td></td>
	      		<td></td>
	      		<td>김과장</td>
	    	</tr>
		</tbody>
	</table>
	<small class="d-block text-right mt-3">총 4 명이 조회되었습니다</small>
</main>
