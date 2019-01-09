<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<table class="table h3 small text-center">
	<thead class="thead-dark" style="borde : 1px">
	    	<tr>
	      		<th scope="col">진행상태</th>
	      		<th scope="col" class="">채용형태</th>
	      		<th scope="col">공고명</th>
	      		<th scope="col">업체</th>
	      		<th scope="col">게시여부</th>
	      		<th scope="col">담당자</th>
	      		<th scope="col">등록일</th>
	    	</tr>
  	</thead>
  	<tbody>
  		<c:if test="${ not empty searchList }">
	 		<c:forEach var="project" items="${ searchList }">

	 		</c:forEach>
 		</c:if>
 		<c:if test="${ empty searchList }">
	    	<tr class="table-secondary">
	      		<td colspan="7">검색 결과가 없습니다.</td>
	    	</tr>
 		</c:if>
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 건이 조회되었습니다</small>


<jsp:include page="/WEB-INF/view/decorators/page.jsp"></jsp:include>