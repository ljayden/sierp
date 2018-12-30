<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<main role="main" class="container">

	<form id="searchForm" action="/business/company/getMainList.ldo" method="post" iframe-list-div="listDiv">
	<input type="hidden" id="pageInput" name="page" value="1"/>
	
	<div class="my-3 p-3 bg-white rounded shadow">
		<div id="searchTap">
			<div class="row">
				<div class="input-group input-group-sm col-md-4 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">업체명</span>
			  		</div>
			  		<input type="text" class="form-control" id="companyName" name="companyName" aria-label="검색할 이름을 입력해 주세요." aria-describedby="search-name">
				</div>
				<div class="input-group input-group-sm col-md-8 mb-3">
			  		<div class="input-group-prepend ">
				    	<label class="input-group-text input-group-text-sm w80" for="sido">주소</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="sido" name="sido" required onchange="javascript: getSiGunGuTypeSearch('sido','sigungu');">
				    	<mt:enumOptions enumClass="SidoType" emptyValueName="전체"/>
			  		</select>	
					<select class="custom-select custom-select-sm" id="sigungu" name="sigungu" required>
                		<option value=""> - </option>
			  		</select>
			  	</div>
			</div>
			
			<div class="row">
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
  	
  	<button type="button" class="btn btn-success btn-sm" onclick="javascript:location.href = '/business/company/registCompany.do'">업체 등록하기</button>
  	
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