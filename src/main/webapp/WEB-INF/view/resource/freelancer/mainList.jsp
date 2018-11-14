<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<table class="table h3 small text-center">
	<thead class="thead-dark" style="borde : 1px">
    	<tr>
      		<th scope="col" class="text-center">이름</th>
      		<th scope="col">등급 구분</th>
      		<th scope="col">전문 영역</th>
      		<th scope="col">주소</th>
      		<th scope="col" class="">계약 상태</th>
      		<th scope="col" class="">계약 정보</th>
      		<th scope="col" class="">계약 기간</th>
      		<th scope="col" class="">구직 구분</th>
      		<th scope="col">주 담당자</th>
    	</tr>
  	</thead>
  	<tbody>
		!!
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 명이 조회되었습니다</small>

<nav aria-label="Page navigation">
 	<ul class="pagination pagination-sm justify-content-center">
 		
 		<c:if test="${ (request.firstPage - request.indexSize) > 1}">
 			<li class="page-item"><a class="page-link" href="javascript: goPage(1)">1..</a></li> 
 		</c:if>
 		<c:if test="${ request.prevLastPage > 1}">
   			<li class="page-item"><a class="page-link" href="javascript: goPage(${ request.prevLastPage })" tabindex="-1">Prev</a></li>
 		</c:if>
   		
   		<c:forEach var="curPage" begin="${ request.firstPage }" end="${ request.lastPage }" step="1">
   		<c:if test="${ curPage eq request.page }">
   			<li class="page-item disabled"><a class="page-link">${ curPage }</a></li> 
   		</c:if>
   		<c:if test="${ curPage ne request.page }">
   			<li class="page-item"><a class="page-link" href="javascript: goPage(${ curPage })">${ curPage }</a></li> 
   		</c:if>
   		</c:forEach>
   		 
   		<c:if test="${ request.nextFirstPage > request.lastPage }">
   			<li class="page-item"><a class="page-link" href="javascript: goPage(${ request.nextFirstPage })">Next</a></li>
   		</c:if>
   		
   		<c:if test="${ request.totalPage > (request.lastPage + request.indexSize)}">
   			<li class="page-item"><a class="page-link" href="javascript: goPage(${ request.totalPage })">.. ${ request.totalPage }</a></li> 
   		</c:if>
   		
	</ul>
</nav>

<!--     	<tr> -->
<!--       		<th scope="row">김철수</th> -->
<!--       		<td>중급</td> -->
<!--       		<td>개발자</td> -->
<!--       		<td>서울/강동구</td> -->
<!--       		<td><b>계약</b></td> -->
<!--       		<td>농협 차세대 개발</td> -->
<!--       		<td>2018.04 ~ 2019.04</td> -->
<!--       		<td></td> -->
<!--       		<td>김말단</td> -->
<!--     	</tr> -->
<!--     	<tr> -->
<!--       		<th scope="row">이갑수</th> -->
<!--       		<td>초급</td> -->
<!--       		<td>퍼블리셔</td> -->
<!--       		<td>경기/성남시</td> -->
<!--       		<td><b>진행중</b></td> -->
<!--       		<td></td> -->
<!--       		<td></td> -->
<!--       		<td>구직 희망</td> -->
<!--       		<td>김과장</td> -->
<!--     	</tr> -->
<!--     	<tr> -->
<!--       		<th scope="row">차영희</th> -->
<!--       		<td>중급</td> -->
<!--       		<td>개발자</td> -->
<!--       		<td>경기/과천시</td> -->
<!--       		<td><b>없음</b></td> -->
<!--       		<td></td> -->
<!--       		<td></td> -->
<!--       		<td>구직 희망</td> -->
<!--       		<td>김과장</td> -->
<!--     	</tr> -->
<!--     	<tr> -->
<!--       		<th scope="row">이갑수</th> -->
<!--       		<td>초급</td> -->
<!--       		<td>개발자</td> -->
<!--       		<td>서울/도봉구</td> -->
<!--       		<td><b>없음</b></td> -->
<!--       		<td></td> -->
<!--       		<td></td> -->
<!--       		<td></td> -->
<!--       		<td>김과장</td> -->
<!--     	</tr> -->