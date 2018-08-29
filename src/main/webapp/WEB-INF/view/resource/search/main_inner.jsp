<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
	
</head>

<main role="main" class="container">

	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<small class="d-block text-right mt-3">검색 조건</small>
  	</div>
  	
	<table class="table h3 small text-center">
		<thead class="thead-dark" style="borde : 1px">
	    	<tr>
	      		<th scope="col" class="text-center">이름</th>
	      		<th scope="col">등급구분</th>
	      		<th scope="col">직원구분</th>
	      		<th scope="col" class="">계약상태</th>
	      		<th scope="col" class="">구직구분</th>
	      		<th scope="col" class="">계약구분</th>
	      		<th scope="col" class="">프로젝트/직무</th>
	      		<th scope="col" class="">기간</th>
	      		<th scope="col">계약 이력</th>
	      		<th scope="col">주소</th>
	      		<th scope="col">담당자</th>
	    	</tr>
	  	</thead>
	  	<tbody>
	    	<tr>
	      		<th scope="row">김철수</th>
	      		<td>중급</td>
	      		<td>외부</td>
	      		<td>계약</td>
	      		<td>-</td>
	      		<td>외부</td>
	      		<td>농협 차세데..</td>
	      		<td>2018.04 ~ 2019.04</td>
	      		<td>3</td>
	      		<td>성남시</td>
	      		<td>성대리</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">이갑수</th>
	      		<td>초급</td>
	      		<td>외부</td>
	      		<td>미계약</td>
	      		<td>상관없음</td>
	      		<td>-</td>
	      		<td>-</td>
	      		<td>-</td>
	      		<td>1</td>
	      		<td>과천</td>
	      		<td>김과장</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">차영희</th>
	      		<td>중급</td>
	      		<td>외부</td>
	      		<td>계약</td>
	      		<td>내부</td>
	      		<td>스마일게이트 스토브 웹개발</td>
	      		<td>2018.04 ~ 2018.09</td>
	      		<td>1</td>
	      		<td>서울</td>
	      		<td>김과장</td>
	    	</tr>
	    	<tr>
	      		<th scope="row">이갑수</th>
	      		<td>초급</td>
	      		<td>외부</td>
	      		<td>미계약</td>
	      		<td>상관없음</td>
	      		<td>-</td>
	      		<td>-</td>
	      		<td>-</td>
	      		<td>1</td>
	      		<td>과천</td>
	      		<td>김과장</td>
	    	</tr>
		</tbody>
	</table>
	<small class="d-block text-right mt-3">메일 발송</small>
</main>
