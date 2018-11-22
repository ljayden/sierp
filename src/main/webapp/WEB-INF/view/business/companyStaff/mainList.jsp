<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<table class="table h3 small text-center">
	<thead class="thead-dark" style="borde : 1px">
    	<tr>
      		<th scope="col" class="text-center">담당자명</th>
      		<th scope="col" >부서</th>
      		<th scope="col" >직급</th>
      		<th scope="col" class="text-center">업체명</th>
      		<th scope="col">전화번호</th>
      		<th scope="col">등록자</th>
      		<th scope="col">등록일</th>
    	</tr>
  	</thead>
  	<tbody>
  		<c:if test="${ not empty companyStaffList }">
 		<c:forEach var="companyStaff" items="${ companyStaffList }">
	    	<tr>
	      		<th scope="row"><a href="/business/companyManager/viewCompanyStaff.do?companyStaffSeq=${ companyStaff.companyStaffSeq}">${ companyStaff.name }</a></th>
	      		<td>${ companyStaff.part }</td>
	      		<td>${ companyStaff.position }</td>
	      		<td>${ companyStaff.companyName }</td>
	      		<td>${ companyStaff.phoneNo }</td>
	      		<td><mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ companyStaff.registerManagerId }"/></td>
	      		<td>2017.04.02</td>
	    	</tr>
 		</c:forEach>
 		</c:if>
 		<c:if test="${ empty companyStaffList }">
 			<tr>
 				<td colspan="7">검색 결과가 없습니다.</td>
 			</tr>
 		</c:if>
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 명이 조회되었습니다</small>


<jsp:include page="/WEB-INF/view/decorators/page.jsp"></jsp:include>