<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>


<main role="main" class="container">

	<form id="searchForm" action="/resource/freelancer/getMainList.ldo" method="post" iframe-list-div="listDiv">
	<input type="hidden" id="pageInput" name="page" value="1"/>
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<div id="searchInputTap">
			<div class="row">
				<div class="input-group input-group-sm col-md-3 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">이름</span>
			  		</div>
			  		<input type="text" class="form-control" id="name" name="name" aria-label="검색할 이름을 입력해 주세요." aria-describedby="search-name">
				</div>
				<div class="input-group input-group-sm col-md-3 mb-3"></div>
				<div class="input-group input-group-sm col-md-3 mb-3">
			  		<div class="input-group-prepend ">
				    	<label class="input-group-text input-group-text-sm w80" for="workerExpertType">전문 영역</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="workerExpertType" name="workerExpertType">
						<mt:enumOptions enumClass="WorkerExpertType" emptyValueName="전체"></mt:enumOptions>
				  	</select>
				</div>
			</div>
			<div class="row">
				
				<div class="input-group input-group-sm col-md-3 mb-3">
					<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="freeGrade">등급구분</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="freeGrade" name="freeGrade">
						<mt:enumOptions enumClass="FreelancerGrade" emptyValueName="전체"/>
				  	</select>
				</div>
				
				<div class="input-group input-group-sm col-md-3 mb-3">
					<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="work-year-month">연차(만)</label>
				  	</div>
					<input type="text" class="form-control" id="workYear" name="workYear" aria-label="" width="5" placeholder="년" aria-describedby="work-year-month">
					<input type="text" class="form-control" id="workMonth" name="workMonth" aria-label="" width="5" placeholder="월" aria-describedby="work-year-month">
				</div>
				
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="minAcademicLevel">학력</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="minAcademicLevel" name="minAcademicLevel">
						<mt:enumOptions enumClass="AcademicLevel" emptyValueName="전체" optionNameSuffix=" 이상"/>
				  	</select>
				  	&nbsp;&nbsp;<b>~</b>&nbsp;&nbsp;
					<select class="custom-select custom-select-sm" id="maxAcademicLevel" name="maxAcademicLevel">
						<mt:enumOptions enumClass="AcademicLevel" emptyValueName="전체" optionNameSuffix=" 이하"/>
				  	</select>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group input-group-sm col-md-3 mb-3">
				 	<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="">계약상태</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="">
				    	<option selected>전체</option>
				    	<option value="1">계약</option>
				    	<option value="2">계약 진행중</option>
				    	<option value="3">없음</option>
			  		</select>
				</div>
				
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
			
			<div class="row">
				<div class="input-group input-group-sm col-md-3 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="skill-set">보유기술</span>
			  		</div>
			  		<input type="text" class="form-control" aria-label="" aria-describedby="skill-set">
				</div>
				<div class="input-group input-group-sm col-md-8 mb-3"></div>
			</div>
			
			<div class="row">
				<div class="input-group input-group-sm col-md-3 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="license">자격사항</span>
			  		</div>
			  		<input type="text" class="form-control" aria-label="" aria-describedby="license">
				</div>
				<div class="input-group input-group-sm col-md-8 mb-3"></div>
			</div>
  		</div>
  		<div class="d-inline clearfix">
  			<button type="button" class="btn btn-outline-secondary btn-sm float-right" id="searchFormOpen">상세 검색 열기</button>
  			<button type="button" class="btn btn-outline-secondary btn-sm float-right" id="searchFormClose">상세 검색 닫기</button>
  		</div>
  	</div>
  	
 	<div class="pl-4 pr-3">
  	  	<div class="row">
  			<div class="col-md-3 mb-3" style="margin-top: -0.5rem">
			    <input type="checkbox" class="form-check-input " id="rejectSeekingWork" name="rejectSeekingWork" value="true" checked="checked" style="margin-top: .45rem;">
			    <label class="form-check-label form-check-label-sm" for="rejectSeekingWork" style="font-size: 90%">구직 거절 제외</label>
  			</div>
  			<div class="col-md-7 mb-3"></div>
  			<div class="col-md-2 mb-3 text-right">
  			 	<button type="button" class="btn btn-primary btn-sm w-100" id="searchBtn">조회</button>
  			</div>
  		</div>
 	</div>
	</form>
  	
  	<button type="button" class="btn btn-success btn-sm" onclick="javascript:location.href = '/resource/freelancer/registFreelancer.do'">프리랜서 등록하기</button>
  	
  	<div class="mt-2" id="listDiv">
  	</div>


<script>

$(document).ready(function() {
	
 
	$('#searchInputTap').hide();
	$('#searchFormOpen').show();
	$('#searchFormClose').hide();
	
	$('#searchFormOpen').on('click', function () {
		$('#searchInputTap').show();
		$('#searchFormOpen').hide();
		$('#searchFormClose').show();
    })

    $('#searchFormClose').on('click', function () {
    	$('#searchInputTap').hide();
    	$('#searchFormOpen').show();
    	$('#searchFormClose').hide();
    })
    
    $('#searchBtn').on('click', function () {
    	$('#searchForm').submit();
    });
	
});

function goPage(page) {
	$('#pageInput').val(page);
	$('#searchForm').submit();
}
</script>