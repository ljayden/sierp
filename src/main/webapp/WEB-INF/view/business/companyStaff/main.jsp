<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<main role="main" class="container">

	<form id="searchForm" action="/business/companyStaff/getMainList.ldo" method="post" iframe-list-div="listDiv">
	<input type="hidden" id="pageInput" name="page" value="1"/>
	
	<div class="my-3 p-3 bg-white rounded shadow">
		<div id="searchTap">
			<div class="row">
				<div class="input-group input-group-sm col-md-4 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">담당자명</span>
			  		</div>
			  		<input type="text" class="form-control" id="companyStaffName" name="companyStaffName" aria-label="담당자명을 입력해 주세요." aria-describedby="search-name">
				</div>
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">업체명</span>
			  		</div>
			  		<input type="text" class="form-control" id="companyName" name="companyName" aria-label="업체명을 입력해 주세요." aria-describedby="search-name">
			  	</div>
			</div>
			<div class="row">
				<div class="input-group input-group-sm col-md-4 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">연락처</span>
			  		</div>
			  		<input type="text" class="form-control" id="phoneNo" name="phoneNo" aria-label="연락처를 입력해 주세요." aria-describedby="search-name">
			  	</div>
				<div class="input-group input-group-sm col-md-3 mb-3">
				 	<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="registerManagerId">등록자</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="registerManagerId" name="registerManagerId">
						<option value="">전체</option>
	                	<c:forEach var="manager" items="${ managerList }" >
	                		<option value="${ manager.id }">${ manager.name }</option>
	                	</c:forEach>
			  		</select>
				</div>
			</div>
  		</div>
  	</div>
  	
  	  	<div class="row">
  	  		<div class="col-md-10 mb-4 text-right"></div>
  			<div class="col-md-2 mb-4 text-right">
  			 	<button type="button" class="btn btn-primary btn-sm w-100" id="searchBtn">조회</button>
  			</div>
  		</div>
	</form>
  	  	
  	<div class="mt-2" id="listDiv">
  	</div>
 


<script>

$(document).ready(function() {
	

    $('#searchBtn').on('click', function () {
    
    	$('#searchForm').submit();
    });
	

});
 
</script>

<!-- 구직거절 제외 구현, 쿠키에 검색값 저장, 페이지 이동, 학사 선택시 대소값 비교, 주소 항목, 등록일 항목 채우기 -->