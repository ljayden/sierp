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
      		<th scope="col">등록일</th>
    	</tr>
  	</thead>
  	<tbody>
 		<c:forEach var="company" items="${ companyList }">
	    	<tr>
	      		<th scope="row"><a href="/business/company/viewCompany.do?companySeq=${ company.companySeq}">${ company.companyName }</a></th>
	      		<td>${ company.sido.description }/${ company.siGunGu.description }</td>
	      		<td>2명</td>
	      		<td>1건</td>
	      		<td><b>4건</b></td>
	      		<td><mt:mgrNm customerCode="${ sessionScope.customer.customerCode }" managerId="${ company.registerManagerId }"/></td>
	      		<td>2017.04.02</td>
	    	</tr>
 		</c:forEach>
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 명이 조회되었습니다</small>


<jsp:include page="/WEB-INF/view/decorators/page.jsp"></jsp:include>