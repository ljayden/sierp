<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<main role="main" class="container">

	<form id="searchForm" action="/resource/freelancer/getMainList.ldo" method="post" iframe-list-div="listDiv">
	<input type="hidden" id="pageInput" name="page" value="1"/>
	<input type="hidden" id="licenseInput" name="licenses" value=""/>
	<input type="hidden" id="preferenceInput" name="preferences" value=""/>
	<input type="hidden" id="skillsetInput" name="skillsets" value=""/>
	
	<div class="my-3 p-3 bg-white rounded shadow-sm">
		<div class="searchFormToggle" id="searchTap">
			<div class="row">
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">등록일</span>
			  		</div>
			  		<input type="text" class="form-control" id="" name="" aria-label="시작일" aria-describedby="">
			  		&nbsp;&nbsp;<b>~</b>&nbsp;&nbsp;
			  		<input type="text" class="form-control" id="" name="" aria-label="종료일" aria-describedby="">
				</div>
				<div class="input-group input-group-sm col-md-6 mb-3">
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-2" >지난주</button>
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-2" >지난달</button>
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-4" >오늘</button>
			  		
			  		<input type="text" style="font-size: 90%" id="" name="" size=2 aria-label="" aria-describedby="">
			  		<button type="button" class="btn btn-outline-secondary btn-sm" >일 간</button>
				</div>
			</div>
			<div class="row">
				<div class="input-group input-group-sm col-md-3 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">이름</span>
			  		</div>
			  		<input type="text" class="form-control" id="name" name="name" aria-label="검색할 이름을 입력해 주세요." aria-describedby="search-name">
				</div>
				<div class="input-group input-group-sm col-md-3 mb-3">
			  		<div class="input-group-prepend ">
				    	<label class="input-group-text input-group-text-sm w80" for="workerExpertType">전문 영역</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="workerExpertType" name="workerExpertType">
						<mt:enumOptions enumClass="WorkerExpertType" emptyValueName="전체"></mt:enumOptions>
				  	</select>
				</div>
				<div class="input-group input-group-sm col-md-6 mb-3">
			  		<div class="input-group-prepend ">
				    	<label class="input-group-text input-group-text-sm w80" for="sido">주소</label>
				  	</div>
					<select class="custom-select custom-select-sm" id="sido" required onchange="javascript: getSiGunGuTypeSearch('sigungu');">
				    	<mt:enumOptions enumClass="SidoType" emptyValueName="전체"/>
			  		</select>	
					<select class="custom-select custom-select-sm" id="sigungu" required>
                		<option value=""> - </option>
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
					<select class="custom-select custom-select-sm" id="contractStatus" name="contractStatus">
				    	<option value="">전체</option>
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
				<div class="input-group input-group col-md-12 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id=""><small>보유기술</small></span>
			  		</div>
					<div class="input-group-prepend w-75">
			    		<span class="input-group-text w-100 bg-white" id="skillSets" style="padding: .1rem">
			    		</span>
			  		</div>
			  		<button type="button" class="btn btn-outline-info btn-sm" id="skillSetConfModalBtn" data-toggle="modal" data-target="#skillSetConfModal">검색</button>
				</div>
			</div>
					
			<div class="row">
				<div class="input-group input-group col-md-12 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id=""><small>자격증</small></span>
			  		</div>
					<div class="input-group-prepend w-75">
			    		<span class="input-group-text w-100  bg-white " id="licenses" style="padding: .1rem"></span>
			  		</div>
			  		<button type="button" class="btn btn-outline-info btn-sm" id="licenseConfModalBtn" data-toggle="modal" data-target="#licenseConfModal">검색</button>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group input-group col-md-12 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id=""><small>우대조건</small></span>
			  		</div>
					<div class="input-group-prepend w-75">
			    		<span class="input-group-text w-100 bg-white" id="preferences" style="padding: .1rem"></span>
			  		</div>
			  		<button type="button" class="btn btn-outline-info btn-sm" id="preferenceConfModalBtn" data-toggle="modal" data-target="#preferenceConfModal">검색</button>
				</div>
			</div>
  		</div>
  		<div class="d-inline clearfix">
  			<button type="button" class="btn btn-outline-secondary btn-sm float-right searchFormToggle" id="searchFormOpenBtn">상세 검색 열기</button>
  			<button type="button" class="btn btn-outline-secondary btn-sm float-right searchFormToggle ml-2" id="searchFormCloseBtn">상세 검색 닫기</button>
  			<button type="button" class="btn btn-outline-danger btn-sm float-right searchFormToggle mr-2" id="searchResetBtn">검색 초기화</button>
  			<button type="button" class="btn btn-outline-success btn-sm float-right searchFormToggle mr-2" onclick="javascript: alert('나만의 검색 페이지추가')">페이지 추가</button>
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

<!-- Modal -->
<div class="modal fade" id="licenseConfModal" tabindex="-1" role="dialog" aria-labelledby="licenseConfModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="licenseConfModalLabel"><b>자격 사항 조건 추가</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="licensePopupDiv">
					<!-- 자격증 추가되는 영역 -->
					</div>
					<br>
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">자격증을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body">
							<c:forEach var="advantage" items="${ advantageList }">
								<c:if test="${ advantage.advantageType eq 'LICENSE' }">
									<c:if test="${ advantage.customerCode eq 'COMMON' }">
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:licenseSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>

<div class="modal fade" id="preferenceConfModal" tabindex="-1" role="dialog" aria-labelledby="preferenceConfModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="preferenceConfModalLabel"><b>우대조건 조건 추가</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="preferencePopupDiv">
			       		 <!-- 우대조건 추가되는 영역 -->
					</div>
					<br>
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">우대조건을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body">
							<c:forEach var="advantage" items="${ advantageList }">
								<c:if test="${ advantage.advantageType eq 'PREFERENCE' }">
									<c:if test="${ advantage.customerCode eq 'COMMON' }">
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:preferenceSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>

<div class="modal fade" id="skillSetConfModal" tabindex="-1" role="dialog" aria-labelledby="skillSetConfModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="skillSetConfModalLabel"><b>보유 기술 조건 추가</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="skillSetPopupDiv">
					</div>
					<br>
					<div class="accordion small" id="accordionSkillSet">
						<div class="card">
							<c:forEach var="skillSetType" items="${ skillSetTypeList }">
								<div class="card-header" style="padding: .35rem .75rem;" id="heading${ skillSetType }">
	   								<h5 class="mb-0">
	     							<button class="btn btn-link collapsed btn-sm" type="button" data-toggle="collapse" data-target="#collapse${skillSetType}" aria-expanded="false" aria-controls="collapse${skillSetType}">
	       							${ skillSetType.description } - 관련 기술
	     							</button>
	   								</h5>
								</div>
								
								<div id="collapse${ skillSetType }" class="collapse p-2" aria-labelledby="heading${ skillSetType }" data-parent="#accordionSkillSet">
									<div class="card-body clearfix" style="padding: .35rem .75rem;">
									<c:forEach var="advantage" items="${ advantageList }">
										<c:if test="${ advantage.advantageType eq 'SKILL' and advantage.skillSetType eq skillSetType }">
											<c:if test="${ advantage.customerCode eq 'COMMON' }">
						
		<div class="card border-info float-left m-1" style="border-bottom-width : 1px; border-bottom-style : solid;">
			<div class="card-body text-info "  style="padding: 0.40rem;" >
				${ advantage.advantageName }
				<select class="custom-select custom-select-sm w90 ml-1 text-info border-info">
				    <mt:enumOptions enumClass="SkillSetWorkmanship" selectedValue="EXIST"/>
			  	</select>
			  	<button type="button" class="btn btn-outline-info btn-sm ml-1" style="margin: -3px" onclick="javacript: skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', this)">&#43;</button>
			</div>
    	</div>
											</c:if>
											<c:if test="${ advantage.customerCode ne 'COMMON' }">


		<div class="card border-warning float-left m-1" style="border-bottom-width : 1px; border-bottom-style : solid;">
			<div class="card-body text-warning "  style="padding: 0.40rem;" >
				${ advantage.advantageName }
				<select class="custom-select custom-select-sm w90 ml-1 text-warning border-warning">
				    <mt:enumOptions enumClass="SkillSetWorkmanship" selectedValue="EXIST"/>
			  	</select>
			  	<button type="button" class="btn btn-outline-warning btn-sm ml-1" style="margin: -3px" onclick="javacript: skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', this)">&#43;</button>
			</div>
    	</div>

											</c:if>
										</c:if>
									</c:forEach>
									</div>
								</div>
							</c:forEach>
							
							
						</div>
					</div>  	
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:skillSetSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>


<script>

$(document).ready(function() {
	
	$('.searchFormToggle').toggle();
	$('#searchFormOpenBtn').show();
	
	$('#searchFormOpenBtn, #searchFormCloseBtn').on('click', function () {
		$('.searchFormToggle').toggle();
    })
    
    $('#searchBtn').on('click', function () {
    	
    	$('#preferenceInput').val('')
    	$('#licenseInput').val('')
    	$('#skillsetInput').val('')
    	
    	$('.preferenceRow').each(function(obj) {
    		if ($('#preferenceInput').val().length > 0) {
    			$('#preferenceInput').val($('#preferenceInput').val() + ',' + $(this).attr('data'))
    		} else {
    			$('#preferenceInput').val($(this).attr('data'))
    		}
    	});
    	
    	$('.licenseRow').each(function(obj) {
    		if ($('#licenseInput').val().length > 0) {
    			$('#licenseInput').val($('#licenseInput').val() + ',' + $(this).attr('data'))
    		} else {
    			$('#licenseInput').val($(this).attr('data'))
    		}
    	});
    	

    	$('.skillSetRow').each(function(obj) {
    		if ($('#skillsetInput').val().length > 0) {
    			$('#skillsetInput').val($('#skillsetInput').val() + ',' + $(this).attr('data'))
    		} else {
    			$('#skillsetInput').val($(this).attr('data'))
    		}
    	});
    	
    	$('#searchForm').submit();
    });
	
    $('#licenseConfModal').on('shown.bs.modal', function () {
   		$('#licenseConfModalBtn').trigger('focus');
   	 	$('#licensePopupDiv').append($('#licenses').html())
   	})
   
   	$('#preferenceConfModal').on('shown.bs.modal', function () {
   	 	$('#preferenceConfModalBtn').trigger('focus');
   	 	$('#preferencePopupDiv').append($('#preferences').html())
   	})
   
   	$('#skillSetConfModal').on('shown.bs.modal', function () {
   	 	$('#skillSetConfModalBtn').trigger('focus');
   	 	$('#skillSetPopupDiv').append($('#skillSets').html())
   	})
	
    $('#searchResetBtn').on('click', function () {
    	formReset();
    });
});

function formReset() {
// 	$('#preferenceInput').val('');
// 	$('#licenseInput').val('');
// 	$('#skillsetInput').val('');
// 	$('#name').val('');
// 	$('#workerExpertType').val('');
// 	$('#freeGrade').val('');
// 	$('#workYear').val('');
// 	$('#workMonth').val('');
// 	$('#minAcademicLevel').val('');
// 	$('#maxAcademicLevel').val('');
// 	$('#contractStatus').val('');
// 	$('#mainManagerId').val('');
 	$('.licenseRow').remove();
 	$('.preferenceRow').remove();
 	$('.skillSetRow').remove();

	$('#searchTap select, input').val('')
}

function goPage(page) {
	$('#pageInput').val(page);
	$('#searchBtn').click();
}


function licenseAdd(seq, name, customCode) {
	var color = 'secondary';
	var divId = 'license' + seq; 
	if ($('#licensePopupDiv #' + divId).length > 0) {
		return false;
	}
	
	var html  = 
		'<div class="card small licenseRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-2" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#licensePopupDiv').append(html);
}

function licenseSave() {
	$('#licenses').html('');
	$('#licenses').append($('#licensePopupDiv').html());
	$('#licensePopupDiv').html('');
	$('#licenseConfModal').modal('hide');
}


function preferenceAdd(seq, name, customCode) {
	var color = 'secondary';
	var divId = 'preference' + seq; 
	if ($('#preferencePopupDiv #' + divId).length > 0) {
		return false;
	}
	
	var html  = 
		'<div class="card small preferenceRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-2" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#preferencePopupDiv').append(html);
}

function preferenceSave() {
	$('#preferences').html('');
	$('#preferences').append($('#preferencePopupDiv').html());
	$('#preferencePopupDiv').html('');
	$('#preferenceConfModal').modal('hide');
}


function skillSetAdd(seq, name, customCode, btn) {
	var color = 'secondary';
	var divId = 'skillSet' + seq; 
	if ($('#skillSetPopupDiv #' + divId).length > 0) {
		return false;
	}
	

	var expVal = $(btn).parent().find('select option:checked').val();
	var expText = $(btn).parent().find('select option:checked').text();
	
	var html  = 
		'<div class="card small skillSetRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + ':' + expVal + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '-' + expText + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-2" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#skillSetPopupDiv').append(html);
}

function skillSetSave() {
	$('#skillSets').html('');
	$('#skillSets').append($('#skillSetPopupDiv').html());
	$('#skillSetPopupDiv').html('');
	$('#skillSetConfModal').modal('hide');
}
</script>

<!-- 구직거절 제외 구현, 쿠키에 검색값 저장, 페이지 이동, 학사 선택시 대소값 비교, 주소 항목, 등록일 항목 채우기 -->