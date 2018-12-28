<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<table class="table h3 small text-center">
	<thead class="thead-light" style="borde : 1px">
	    	<tr>
	      		<th scope="col">진행상태</th>
	      		<th scope="col" class="">기간</th>
	      		<th scope="col">프로젝트명</th>
	      		<th scope="col">수행사</th>
	      		<th scope="col">위치</th>
	      		<th scope="col">구인</th>
	    	</tr>
  	</thead>
  	<tbody>
  		<c:if test="${ not empty searchList }">
	 		<c:forEach var="project" items="${ searchList }">
		    	<tr class="${ project.statusColorClass }">
		    		<th>${ project.statusName }</th>
		      		<td>${ project.startYmd } ~ ${ project.endYmd }</td>
		      		<td><a href="/business/project/viewProject.do?projectSeq=${ project.projectSeq }">${ project.projectName }</a></td>
		      		<td><a href="/business/company/viewCompany.do?companySeq=${ project.mainCompanySeq}">${ project.mainCompanyName }</a></td>
		      		<td>${ project.sido.description }/${ project.sigungu.description }</td>
		      		<td><b>4건</b></td>
		    	</tr>
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