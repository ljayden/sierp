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
		<div class="" id="searchTap">
			
			<div class="row">
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80 " id="search-name">마감일</span>
			  		</div>
			  		<input type="text" class="form-control" id="closeStart" name="closeStart" aria-label="시작일" aria-describedby="" autocomplete="off">
			  		&nbsp;&nbsp;<b>~</b>&nbsp;&nbsp;
			  		<input type="text" class="form-control" id="closeEnd" name="closeEnd" aria-label="종료일" aria-describedby="" autocomplete="off">
				</div>
				<div class="input-group input-group-sm col-md-6 mb-3">
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-2" onclick="javascript: selectMonthEnd();">이번달</button>
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-2" onclick="javascript: selectWeekEnd();">이번주</button>
			  		<button type="button" class="btn btn-outline-secondary btn-sm mr-4" onclick="javascript: select7DayEnd();">7일내</button>
			  		
			  		<input type="text" style="font-size: 90%" id="endDayInput"  size=2 aria-label="" aria-describedby="">
			  		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="javascript: selectSomethingEnd();">일 내</button>
				</div>
			</div>
			
			<div class="row">
				<div class="input-group input-group-sm col-md-6 mb-3 small">
				 	<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="">상태</label>
				  	</div>
				  	
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-3">
				    	<input type="checkbox" class="custom-control-input" name="status" value="ING" id="statusIng" checked="checked">
				    	<label class="custom-control-label" for="statusIng">진행</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-4">
				    	<input type="checkbox" class="custom-control-input" name="status" value="CONTRACT" id="statusContract">
				    	<label class="custom-control-label" for="statusContract">계약</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-4">
				    	<input type="checkbox" class="custom-control-input" name="status" value="END" id="statusEnd">
				    	<label class="custom-control-label" for="statusEnd">종료</label>
				  	</div>
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
				<div class="input-group input-group-sm col-md-3 mb-3"></div>
			</div>
			
			
			<div class="row searchFormToggle">
				<div class="input-group input-group-sm col-md-3 mb-3">
 					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="freelancerGrade">요구 등급</span>
			  		</div>
		      		<select class="custom-select custom-select-sm d-block"  name="freelancerGrade" id="freelancerGrade">
	                	<mt:enumOptions enumClass="FreelancerGrade" emptyValueName="전체" ></mt:enumOptions>
	                </select>
				</div>
				<div class="input-group input-group-sm col-md-3 mb-3"></div>
				<div class="input-group input-group-sm col-md-3 mb-3">
 					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="workType">업무 구분</span>
			  		</div>
		      		<select class="custom-select custom-select-sm d-block"  name="workType" id="workType">
	                	<mt:enumOptions enumClass="WorkType" emptyValueName="전체"></mt:enumOptions>
	                </select>
				</div>
			</div>	  
			    
			    
			<div class="row searchFormToggle">
				<div class="input-group input-group-sm col-md-3 mb-3">
 					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-recruit-type">채용구분</span>
			  		</div>
		      		<select class="custom-select custom-select-sm d-block"  name="recruitType" id="recruitType">
	                	<mt:enumOptions enumClass="RecruitType" emptyValueName="전체"></mt:enumOptions>
	                </select>
				</div>
				<div class="input-group input-group-sm col-md-3 mb-3"></div>
				<div class="input-group input-group-sm col-md-6 mb-3">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">업체명</span>
			  		</div>
			  		<input type="text" class="form-control" id="companyName" name="companyName" aria-label="검색할 이름을 입력해 주세요." aria-describedby="search-name">
				</div>
			</div>    
			
			<div class="row searchFormToggle">
				<div class="input-group input-group-sm col-md-10 mb-3 small">
				 	<div class="input-group-prepend">
				    	<label class="input-group-text w80" for="">재택여부</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-3">
				    	<input type="checkbox" class="custom-control-input" value="" id="workWhereAll" checked="checked">
				    	<label class="custom-control-label" for="workWhereAll">전체</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-3">
				    	<input type="checkbox" class="custom-control-input" name="officeWorkYn" value="Y" id="workWhereOffice" >
				    	<label class="custom-control-label" for="workWhereOffice">상주근무</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-4">
				    	<input type="checkbox" class="custom-control-input" name="officeHomeWorkYn" value="Y" id="workWhereOfficeHome">
				    	<label class="custom-control-label" for="workWhereOfficeHome">반상주</label>
				  	</div>
				  	<div class="custom-control custom-checkbox mb-1 mt-1 ml-4">
				    	<input type="checkbox" class="custom-control-input" name="homeWorkYn" value="Y" id="workWhereHome">
				    	<label class="custom-control-label" for="workWhereHome">재택가능</label>
				  	</div>
				</div>
			</div>

			<div class="row searchFormToggle">
				<div class="input-group input-group-sm col-md-6 mb-3 small">
					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id="search-name">게시 여부</span>
			  		</div>
				  	<div class="custom-control custom-radio mb-1 mt-1 ml-3">
				    	<input type="radio" class="custom-control-input" name="postingYn" value="" id="postingAll" checked="checked">
				    	<label class="custom-control-label" for="postingAll">전체</label>
				  	</div>
				  	<div class="custom-control custom-radio mb-1 mt-1 ml-3">
				    	<input type="radio" class="custom-control-input" name="postingYn" value="Y" id="postingY" >
				    	<label class="custom-control-label" for="postingY">게시건만</label>
				  	</div>
				  	<div class="custom-control custom-radio mb-1 mt-1 ml-4">
				    	<input type="radio" class="custom-control-input" name="postingYn" value="N" id="postingN" >
				    	<label class="custom-control-label" for="postingN">미 게시건만</label>
				  	</div>
				</div>

				<div class="input-group input-group-sm col-md-6 mb-3">
 					<div class="input-group-prepend">
			    		<span class="input-group-text w80" id=" ">파트너 공고</span>
			  		</div>
		      		<select class="custom-select custom-select-sm d-block"  name="" id="">
	                	<option>자사</option>
	                </select>
				</div>
			</div>
  		</div>
  		<div class="d-inline clearfix ">
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
  	<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript: recommandWorker();" id="recommandWorkerBtn" disabled="disabled">맞춤 인재 찾기</button>
  	<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript: findWorker();" id="findWorkerBtn" disabled="disabled">인재 참기</button>
  	<button type="button" class="btn btn-outline-primary btn-sm " onclick="javascript: sendPosting();" id="sendPostingBtn" disabled="disabled">채용공고 발송</button>
  	<div class="mt-2" id="listDiv">
  	</div>

<div class="modal fade" id="recommandWorkerModal" tabindex="-1" role="dialog" aria-labelledby="recommandWorkerModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        		<h5 class="modal-title" id="recommandWorkerModalLabel"><b>"<span id="recomModalTitle"></span>" 의 채용 조건</b></h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">검색 조건을 확인해 주세요.</span>
						</div>
						<div class="card-body p-2">
 							
							<div class="form-row" id="recomModalNeedAcademic">
					        	<div class="input-group input-group-sm col-md-5 mb-3  ">
								  	<div class="custom-control custom-checkbox small mt-m080 small">
								    	<input type="checkbox" class="custom-control-input" name="selectPosting" value="${ posting.postingSeq }" id="select_posting_${ posting.postingSeq }" data_status="${ posting.status }" onclick="javascript : selectPosting(this.id);">
								    	<label class="custom-control-label" for="select_posting_${ posting.postingSeq }"></label>
								  	</div>
	        						<div class="input-group-prepend">
							    		<span class="input-group-text">학력 제한  : </span>
							  		</div>
					                <select class="custom-select custom-select-sm d-block w-50" style="font-weight: bold" id="needAcademicLevel">
					                	<mt:enumOptions enumClass="AcademicLevel" emptyValueName="없음" optionNameSuffix=" 이상"></mt:enumOptions>
					                </select>
					        	</div>
					        	<div class="form-group col-md-1 mb-3"></div>
 							</div>
 
							<div class="form-row" id="recomModalNeedFreeGrade">
					        	<div class="input-group input-group-sm col-md-5 mb-3  ">
								  	<div class="custom-control custom-checkbox small mt-m080 small">
								    	<input type="checkbox" class="custom-control-input" name="selectPosting" value="${ posting.postingSeq }" id="select_posting_${ posting.postingSeq }" data_status="${ posting.status }" onclick="javascript : selectPosting(this.id);">
								    	<label class="custom-control-label" for="select_posting_${ posting.postingSeq }"></label>
								  	</div>
	        						<div class="input-group-prepend">
							    		<span class="input-group-text">등급 제한  : </span>
							  		</div>
					                <select class="custom-select custom-select-sm d-block w-50" style="font-weight: bold" id="needFreeGrade">
					                	<mt:enumOptions enumClass="FreelancerGrade" emptyValueName="없음" optionNameSuffix=" 이상"></mt:enumOptions>
					                </select>
					        	</div>
					        	<div class="form-group col-md-1 mb-3"></div>
 							</div>
 							
 							
 							<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript: findWorker();" id="findWorkerBtn" disabled="disabled">위 조건으로 찾기</button>
 
						</div>
					</div> 
  				</div>
			</div>
    		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
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
    	
    	$('#searchForm').submit();
    });
	
	COMMON.calendar('closeStart');
	COMMON.calendar('closeEnd');
	
    $('#searchResetBtn').on('click', function () {
    	formReset();
    });
    
    $('#workWhereAll').on('click', function () {
    	if ($(this).is(':checked')) {
    		//전체를 체크했으니 다 풀자
    		$('#workWhereOffice').prop('checked', true);
    		$('#workWhereOfficeHome').prop('checked', true);
    		$('#workWhereHome').prop('checked', true);
    	} else {
    		$('#workWhereOffice').prop('checked', false);
    		$('#workWhereOfficeHome').prop('checked', false);
    		$('#workWhereHome').prop('checked', false);
    	}
    });
    
    $('#workWhereOffice').on('click', function () {
    	if (!$(this).is(':checked')) {
    		if ( !$('#workWhereOfficeHome').is(':checked') && !$('#workWhereOfficeHome').is(':checked')) {
    			$('#workWhereAll').prop('checked', true);
    		} else {
        		$('#workWhereAll').prop('checked', false);
    		}
    	} else {
    		if ( $('#workWhereOfficeHome').is(':checked') && $('#workWhereOfficeHome').is(':checked')) {
    			$('#workWhereAll').prop('checked', true);
    		} else {
        		$('#workWhereAll').prop('checked', false);
    		}
    	}
    });
    
    $('#workWhereOfficeHome').on('click', function () {
    	if (!$(this).is(':checked')) {
    		if ( !$('#workWhereOffice').is(':checked') && !$('#workWhereHome').is(':checked')) {
    			$('#workWhereAll').prop('checked', true);
    		} else {
        		$('#workWhereAll').prop('checked', false);
    		}
    	} else {
    		if ( $('#workWhereOffice').is(':checked') && $('#workWhereHome').is(':checked')) {
    			$('#workWhereAll').prop('checked', true);
    		} else {
        		$('#workWhereAll').prop('checked', false);
    		}
    	}
    });
    
    $('#workWhereHome').on('click', function () {
    	if (!$(this).is(':checked')) {
    		if ( !$('#workWhereOffice').is(':checked') && !$('#workWhereOfficeHome').is(':checked')) {
    			$('#workWhereAll').prop('checked', true);
    		} else {
        		$('#workWhereAll').prop('checked', false);
    		}
    	} else {
    		if ( $('#workWhereOffice').is(':checked') && $('#workWhereOfficeHome').is(':checked')) {
    			$('#workWhereAll').prop('checked', true);
    		} else {
        		$('#workWhereAll').prop('checked', false);
    		}
    	}
    });
});

	
function formReset() {

	$('#searchTap select, input[type="text"]').val('');
	$('#pageInput').val('1');
	$('#statusIng').prop('checked',true);
	$('#statusContract').prop('checked',false);
	$('#statusEnd').prop('checked',false);
	
	$('#postingAll').prop('checked',true);
	
	$('#workWhereAll').prop('checked',true);
	$('#workWhereOffice').prop('checked',false);
	$('#workWhereOfficeHome').prop('checked',false);
	$('#workWhereHome').prop('checked',false);
}

function goPage(page) {
	$('#pageInput').val(page);
	$('#searchBtn').click();
}

function selectSomethingEnd() {
	addDay(Number($('#endDayInput').val()));
}

function selectMonthEnd() {
	var now = new Date();
	var last = new Date(now.getFullYear(), now.getMonth() + 1, 0);
	var str = last.format('yyyy-MM-dd');
	$('#closeEnd').val(str);
}

function selectWeekEnd() {
	addDay(7 - new Date().getDay());
}

function select7DayEnd() {
	addDay(7);
}

function addDay(day) {
	var now = new Date();
	now.setDate(now.getDate() + day);
	var str = now.format('yyyy-MM-dd');
	$('#closeEnd').val(str);
}

var selectedValidPosting;

function selectPosting() {
	selectedValidPosting = new Array();
	$('input[name="selectPosting"]:checked').each(function(i, posting) {
		if ($(this).attr('data_status') == 'ING' ) {
			selectedValidPosting.push($(this).val());
		}
	});
	
	if (selectedValidPosting.length == 0) {
		//선택한 공고가 하나도 없다면..
		$('#recommandWorkerBtn').prop('disabled',true);
		$('#findWorkerBtn').prop('disabled',true);
		$('#sendPostingBtn').prop('disabled',true);
	} else {
		$('#findWorkerBtn').prop('disabled',false);
		$('#sendPostingBtn').prop('disabled',false);
		if (selectedValidPosting.length > 1) {
			//한개 이상 선택
			$('#recommandWorkerBtn').prop('disabled',true);
		} else {
			//한개 선택
			$('#recommandWorkerBtn').prop('disabled',false);
		}
	}
}

function recommandWorker() {
	//선택한 공고로 팝업을 띄우자..
	var postingSeq = selectedValidPosting[0];
	
	COMMON.ajax({
   		url : '/recruit/posting/getPosting.json?postingSeq=' + postingSeq,
   		successHandler : function(data){
  			var posting = data.result;
  			
  			$('#recomModalTitle').text(posting.postingTitle);
  			
  			if (posting.needAcademicLevel != null) {
  				//학력 제한 보이게 하기, 체크넣기
  			}
  			//학력 제한
  			//등급제한
  			//연차제한
  			//나이제한
  			//상주가능, 반상주 재택 여부
  			//필요조건이 있는 사람
   			$('#recommandWorkerModal').modal('show');
   			
		}
	});
   	
}

function findWorker() {
	
}

function sendPosting() {
	
}

</script>