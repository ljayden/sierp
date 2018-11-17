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
      		<th scope="col" class="">계약 기간</th>
      		<th scope="col" class="">구직 구분</th>
      		<th scope="col">주 담당자</th>
      		<th scope="col">등록일</th>
    	</tr>
  	</thead>
  	<tbody>
 		<c:forEach var="freelancer" items="${ searchList }">
	    	<tr>
	      		<th scope="row"><a href="/resource/freelancer/viewFreelancer.do?freelancerSeq=${ freelancer.freelancerSeq}">${ freelancer.name }</a></th>
	      		<td>중급</td>
	      		<td>${ freelancer.workerExpertType.description }</td>
	      		<td>${ freelancer.sido.description }/${ freelancer.siGunGu.description }</td>
	      		<td><b>${ freelancer.contractStatus }</b></td>
	      		<td>2018.04 ~ 2019.04</td>
	      		<td></td>
	      		<td><mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ freelancer.mainManagerId }"/></td>
	      		<td>2017.04.02</td>
	    	</tr>
 		</c:forEach>
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

<!-- 자릿수 짜르기, 루시넣기, html제거 -->