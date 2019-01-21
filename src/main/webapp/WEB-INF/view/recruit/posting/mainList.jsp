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
	      		<th scope="col">마감일</th>
	      		<th scope="col">게시상태</th>
	      		<th scope="col">공고명</th>
	      		<th scope="col" class="">채용구분</th>
	      		<th scope="col">업체</th>
	      		<th scope="col">담당자</th>
	    	</tr>
  	</thead>
  	<tbody>
  		<c:if test="${ not empty searchList }">
	 		<c:forEach var="posting" items="${ searchList }">
		    	<tr>
		      		<th scope="row">${ posting.status.description }</th>
		      		<td>
		      			<c:if test="${ posting.endLeftDay eq -2 }"> - </c:if>
		      			<c:if test="${ posting.endLeftDay eq -1 }"> 마감 </c:if>
		      			<c:if test="${ posting.endLeftDay eq  0 }"> 오늘 마감 </c:if>
		      			<c:if test="${ posting.endLeftDay > 0 }">
		      				<c:if test="${ posting.endLeftDay <= 30 }">  ${ posting.endLeftDay } 일 후   
		      				</c:if>
							<c:if test="${ posting.endLeftDay > 30 }"> ${ posting.endLeftDay / 30  } 달 후   
		      				</c:if>
		      			</c:if>
		      		</td>
		      		<td>${ posting.sitePostingStatusInfo }</td>
		      		<td><a href="/recruit/posting/viewPosting.do?postingSeq=${ posting.postingSeq}"><b>${ posting.postingTitle }</b></a></td>
		      		<td>${ posting.recruitType.description }</td>
		      		<td><a href="/business/company/viewCompany.do?companySeq=${ posting.companySeq}"><b>${ posting.companyName }</b></a></td>
		      		<td><mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ posting.mainManagerId }"/></td>
		    	</tr>
	 		</c:forEach>
 		</c:if>
 		<c:if test="${ empty searchList }">
	    	<tr class="">
	      		<td colspan="7">검색 결과가 없습니다.</td>
	    	</tr>
 		</c:if>
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 건이 조회되었습니다</small>


<jsp:include page="/WEB-INF/view/decorators/page.jsp"></jsp:include>