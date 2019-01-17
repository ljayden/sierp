<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<main role="main" class="container">

	<form id="searchForm" action="/recruit/posting/getMainList.ldo" method="post" iframe-list-div="listDiv">
	<input type="hidden" id="pageInput" name="page" value="1"/>

	<div class="my-3 p-3 bg-white rounded shadow">
		<div class="searchFormToggle" id="searchTap">
			
			<div class="row">
				<div class="input-group input-group-sm col-md-6 mb-3">
				 	<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="">상태</label>
				  	</div>
				  	
				  	<div class="custom-control custom-checkbox mb-2 mt-1 ml-3">
				    	<input type="checkbox" class="custom-control-input" name="status" value="ING" id="statusReady" checked="checked">
				    	<label class="custom-control-label" for="statusReady">진행</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-3 mt-1 ml-4">
				    	<input type="checkbox" class="custom-control-input" name="status" value="CONTRACT" id="statusIng" checked="checked">
				    	<label class="custom-control-label" for="statusIng">계약</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-3 mt-1 ml-4">
				    	<input type="checkbox" class="custom-control-input" name="status" value="END" id="statusEnd">
				    	<label class="custom-control-label" for="statusEnd">종료</label>
				  	</div>
				</div>
				
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">업체명</span>
			  		</div>
			  		<input type="text" class="form-control" id="companyName" name="companyName" aria-label="검색할 이름을 입력해 주세요." aria-describedby="search-name">
				</div>
			</div>
			<div class="row">
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80 " id="search-name">마감일</span>
			  		</div>
			  		<input type="text" class="form-control" id="" name="" aria-label="시작일" aria-describedby="">
			  		&nbsp;&nbsp;<b>~</b>&nbsp;&nbsp;
			  		<input type="text" class="form-control" id="" name="" aria-label="종료일" aria-describedby="">
				</div>
				<div class="input-group input-group-sm col-md-6 mb-3">
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-2" >이번주</button>
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-2" >이번달</button>
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-4" >7일내</button>
			  		
			  		<input type="text" style="font-size: 90%" id="" name="" size=2 aria-label="" aria-describedby="">
			  		<button type="button" class="btn btn-outline-secondary btn-sm" >일 내</button>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group input-group-sm col-md-3 mb-3">
				 	<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="mainManagerId">담당자</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="mainManagerId" name="mainManagerId">
						<option value="">전체</option>
	                	<c:forEach var="manager" items="${ managerList }" >
	                		<option value="${ manager.id }">${ manager.name }</option>
	                	</c:forEach>
			  		</select>
				</div>
			</div>
  		</div>
  		<div class="d-inline clearfix">
  			<button type="button" class="btn btn-outline-secondary btn-sm float-right searchFormToggle" id="searchFormOpenBtn">상세 검색 열기</button>
  			<button type="button" class="btn btn-outline-secondary btn-sm float-right searchFormToggle ml-2" id="searchFormCloseBtn">상세 검색 닫기</button>
  			<button type="button" class="btn btn-outline-danger btn-sm float-right searchFormToggle mr-2" id="searchResetBtn">검색 초기화</button>
  		</div>
  	</div>
  	
 	<div class="pl-4 pr-3">
  	  	<div class="row">
  			<div class="col-md-3 mb-3" style="margin-top: -0.5rem"></div>
  			<div class="col-md-7 mb-3"></div>
  			<div class="col-md-2 mb-3 text-right">
  			 	<button type="button" class="btn btn-primary btn-sm w-100" id="searchBtn">조회</button>
  			</div>
  		</div>
 	</div>
	</form>
  	
  	<button type="button" class="btn btn-success btn-sm" onclick="javascript:location.href = '/recruit/posting/registPosting.do'">채용공고 등록하기</button>
  	
  	<div class="mt-2" id="listDiv">
  	</div>

<script>
$(document).ready(function() {
	
	$('.searchFormToggle').toggle();
	$('#searchFormOpenBtn').show();
	
	$('#searchFormOpenBtn, #searchFormCloseBtn').on('click', function () {
		$('.searchFormToggle').toggle();
    })
    
    $('#searchBtn').on('click', function () {
    	
    	$('#searchForm').submit();
    });
	
	
    $('#searchResetBtn').on('click', function () {
    	formReset();
    });
});

function formReset() {

	$('#searchTap select, input[type="text"]').val('');
	$('#pageInput').val('1')
}

function goPage(page) {
	$('#pageInput').val(page);
	$('#searchBtn').click();
}
</script>
