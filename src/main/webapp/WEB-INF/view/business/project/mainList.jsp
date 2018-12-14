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
	      		<th scope="col" class="">기간</th>
	      		<th scope="col">프로젝트명</th>
	      		<th scope="col">업체</th>
	      		<th scope="col">수행사</th>
	      		<th scope="col">위치</th>
	      		<th scope="col">구인</th>
	    	</tr>
  	</thead>
  	<tbody>
  		<c:if test="${ not empty companyList }">
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
 		</c:if>
 		<c:if test="${ empty companyList }">
	    	<tr class="table-secondary">
	      		<th>종료</th>
	      		<td>2018.08.21 ~ 2019.08.21</td>
	      		<td>STOVE 개발</td>
	      		<td>스마일게이트</td>
	      		<td>BD</td>
	      		<td>경기/성남시분당구</td>
	      		<td>2건</td>
	    	</tr>
	    	<tr>
	      		<th>진행중</th>
	      		<td>2018.08 ~ 2019.08</td>
	      		<td>PG모듈 개발</td>
	      		<td>웹케시</td>
	      		<td>-</td>
	      		<td>서울/마포구</td>
	      		<td>3건</td>
	    	</tr>
	    	<tr class="table-success">
	      		<th>준비중</th>
	      		<td>2018.08.21 ~ 2019.08.21</td>
	      		<td>사이트 유지보수</td>
	      		<td>네이버</td>
	      		<td>-</td>
	      		<td>경기/성남시분당구</td>
	      		<td>0건</td>
	    	</tr>
 		</c:if>
	</tbody>
</table>	
<small class="d-block text-right mt-3">총 ${ request.totalCount } 명이 조회되었습니다</small>


<jsp:include page="/WEB-INF/view/decorators/page.jsp"></jsp:include>