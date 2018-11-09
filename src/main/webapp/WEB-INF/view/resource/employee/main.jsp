<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
	
</head>

<main role="main" class="container">

	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<div class="row">
			<div class="input-group input-group-sm col-md-3 mb-3">
				<div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-sm">이름검색 </span>
			  	</div>
			  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
			</div>
  		</div>
  		<div style="text-align: right"><button type="button" class="btn btn-primary btn-sm">조회</button></div>
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
