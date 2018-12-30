<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<table class="table h3 small text-center">
	<thead class="thead-dark" style="borde : 1px">
    	<tr>
      		<th scope="col" class="text-center">업체명</th>
      		<th scope="col">주소</th>
      		<th scope="col">업체 담당자</th>
      		<th scope="col">계약중 건</th>
      		<th scope="col" class="">총 계약건수</th>
      		<th scope="col">등록자</th>
    	</tr>
  	</thead>
  	<tbody>
  		<c:if test="${ not empty companyList }">
	 		<c:forEach var="company" items="${ companyList }">
		    	<tr>
		      		<th scope="row"><a href="/business/company/viewCompany.do?companySeq=${ company.companySeq}">${ company.companyName }</a></th>
		      		<td>
		      		
		      		<c:if test="${ not empty company.sido }">
		      			${ company.sido.description }
		      			<c:if test="${ not empty company.siGunGu }">
		      				/${ company.siGunGu.description }
		      			</c:if>
		      			<c:if test="${ empty company.siGunGu }">
		      				/ -
		      			</c:if>
		      		</c:if>
		      		<c:if test="${ empty company.sido }">
		      			- / - 
		      		</c:if>	
						
		      			
		      		</td>
		      		<td>${ company.staffCnt }명</td>
		      		<td>1건</td>
		      		<td><b>4건</b></td>
		      		<td><mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ company.registerManagerId }"/></td>
		    	</tr>
	 		</c:forEach>
 		</c:if>
 		<c:if test="${ empty companyList }">
 			<tr>
 				<td colspan="6">검색 결과가 없습니다.</td>
 			</tr>
 		</c:if>
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 건이 조회되었습니다</small>


<jsp:include page="/WEB-INF/view/decorators/page.jsp"></jsp:include>