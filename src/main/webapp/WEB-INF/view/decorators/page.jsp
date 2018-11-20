<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
