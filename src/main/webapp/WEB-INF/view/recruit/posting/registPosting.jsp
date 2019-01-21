<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mt" uri="myTags" %>

<head></head>

<main role="main" class="container">
	<div class="my-3 p-3 bg-white rounded shadow">
	
	<input type="hidden" id="selectedCompanyName" value="${ selectedCompany.companyName }">
    <form class="needs-validation" id="regForm" novalidate> <!--  -->
    
		<div class="form-row">
        	<div class="form-group col-md-7 mb-3"><h4 class="mb-3">채용공고 등록하기</h4></div>
        	<div class="form-group col-md-2 mb-3">
        		<label for="postingEndYear" class="col-form-label-sm">공고 마감일<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control form-control-sm d-block w-100" id="postingEnd">
        	</div>
        	<div class="form-group col-md-1 mb-3"></div>
        	<div class="form-group col-md-2 mb-3 float-right">
				<label for="projectName" class="col-form-label-sm ">게시 여부 </label>
				<div>
		           	<div class="custom-control custom-checkbox custom-control-inline">
						<input type="checkbox" id="sitePostYn" value="Y" class="custom-control-input">
						<label class="custom-control-label custom-control-label-sm" for="sitePostYn">사이트 게시</label>
					</div>
				</div>
        	</div>
<!--         	<div class="form-group col-md-2 mb-3"> -->
<!--             	<label for="postingEndYear" class="col-form-label-sm">공고 마감일<span class="text-muted">(Optional)</span></label> -->
<!--                 <select class="custom-select custom-select-sm d-block w-100" id="postingEndYear"> -->
<!--                 	<option value="">년도</option> -->
<%--  					<c:forEach var="year" begin="${ thisYear - 20 }" end="${ thisYear + 3 }" step="1"> --%>
<%-- 				    	<c:if test="${ ((thisYear + 3) - year + (thisYear - 20)) eq thisYear }"><option value="${(thisYear + 3) - year + (thisYear - 20)}" selected="selected">${(thisYear + 3) - year + (thisYear - 20)}</option></c:if> --%>
<%-- 				    	<c:if test="${ ((thisYear + 3) - year + (thisYear - 20)) ne thisYear }"><option value="${(thisYear + 3) - year + (thisYear - 20)}">${(thisYear + 3) - year + (thisYear - 20)}</option></c:if> --%>
<%-- 				    </c:forEach> --%>
<!--                 </select> -->
<!--                 <div class="invalid-feedback">년도를 선택해 주세요.</div> -->
<!-- 			</div> -->
<!--             <div class="form-group col-md-1 mb-3"> -->
<!--               	<label for="postingEndMonth" class="col-form-label-sm">&nbsp;</label> -->
<!--                	<select class="custom-select custom-select-sm d-block w-100" id="postingEndMonth"> -->
<!--                		<option value="">월</option> -->
<%-- 				    <c:forEach var="month" begin="1" end="12" step="1"> --%>
<%-- 				    	<c:if test="${ month eq thisMonth }"><option value="${month}" selected="selected"><fmt:formatNumber pattern="00" value="${month}"/></option></c:if> --%>
<%-- 				    	<c:if test="${ month ne thisMonth }"><option value="${month}"><fmt:formatNumber pattern="00" value="${month}"/></option></c:if> --%>
<%-- 				    </c:forEach> --%>
<!--               	</select> -->
<!--             </div> -->
<!--             <div class="form-group col-md-1 mb-3"> -->
<!--                 <label for="postingEndDay" class="col-form-label-sm">&nbsp;</label> -->
<!--                	<select class="custom-select custom-select-sm d-block w-100" id="postingEndDay"> -->
<!--                		<option value="">일</option> -->
<%-- 				    <c:forEach var="day" begin="1" end="31" step="1"> --%>
<%-- 				    	<c:if test="${ day eq thisDay }"><option value="${day}" selected="selected"><fmt:formatNumber pattern="00" value="${day}" /></option></c:if> --%>
<%-- 				    	<c:if test="${ day ne thisDay }"><option value="${day}"><fmt:formatNumber pattern="00" value="${day}" /></option></c:if> --%>
<%-- 				    </c:forEach> --%>
<!--               	</select> -->
<!--             </div> -->
		</div>  
		<br>
    	<div class="form-row">
        	<div class="form-group col-md-8 mb-3">
                <label for="posingTitle" class="col-form-label-sm">채용공고 제목 </label>
                <input type="text" class="form-control form-control-sm" id="posingTitle" required>
            	<div class="invalid-feedback">채용공고 제목을 입력해 주세요.</div>
        	</div>
		</div>  

    	<div class="form-row">
        	<div class="form-group col-md-4 mb-3">
                <label for="company" class="col-form-label-sm">업체명</label>
                <input type="text" class="form-control form-control-sm" id="company" onchange="javascript: companyChange('company')">
            	<div class="invalid-feedback">업체명을 입력해 주세요.</div>
        	</div>
        	<div class="form-group col-md-2 mb-3">
        		<label for="companyManager" class="col-form-label-sm">업체 담당자<span class="text-muted">(Optional)</span></label>
        		<select class="custom-select custom-select-sm d-block w-100" id="companyManager">
        		</select>
        	</div>
		</div>

    	<div class="form-row">
        	<div class="form-group col-md-2 mb-3">
                <label for="workType" class="col-form-label-sm">업무 구분<span class="text-muted">(Optional)</span></label>
				<select class="custom-select custom-select-sm d-block w-100"  id="workType">
                	<mt:enumOptions enumClass="WorkType" emptyValueName="없음"></mt:enumOptions>
                </select>
        	</div>
        	<div class="form-group col-md-2 mb-3"></div>
            <div class="form-group col-md-7 mb-3 ">
              	<label for="project" class="col-form-label-sm">프로젝트<span class="text-muted">(Optional)</span></label>
              	<div>
	                <input type="text" class="form-control form-control-sm w-75 float-left " id="project" readonly="readonly" value="">
	                <c:if test="${ empty selectedProject }">
	                	<input type="hidden" id="projectSeq" value="">
	                </c:if>
	                <c:if test="${ not empty selectedProject }">
	                	<input type="hidden" id="projectSeq" value="${ selectedProject.projectSeq }">
	                	<input type="hidden" id="selectedProjectName" value="${ selectedProject.projectName }">
	                	<input type="hidden" id="selectedProjectSido" value="${ selectedProject.sido }">
	                	<input type="hidden" id="selectedProjectSigungu" value="${ selectedProject.siGunGu }">
	                	<input type="hidden" id="selectedProjectDetailAddr" value="${ selectedProject.detailAddr }">
	                </c:if>
	                <button type="button" class="btn btn-outline-secondary btn-sm float-left ml-2"   id="deleteProjectBtn"><b>&times;</b></button>
	                <button type="button" class="btn btn-outline-primary btn-sm float-left ml-2"  id="projectFindModalBtn">찾아보기</button>
              	</div>
        	</div>
		</div>
    	<div class="form-row">
        	<div class="form-group col-md-2 mb-3">
                <label for="recruitType" class="col-form-label-sm">채용 구분 </label>
                <select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="recruitType">
                	<mt:enumOptions enumClass="RecruitType"></mt:enumOptions>
                </select>
        	</div>
			<div class="form-group col-md-2 mb-3">
                <label for="recruitManCount" class="col-form-label-sm" >채용 수</label>
				<select class="custom-select custom-select-sm d-block w-100" style="background-color: #E3F2F5; font-weight: bold" id="recruitManCount">
               		<option value="-2">0 명</option>
               		<option value="-1">00 명</option>
	                <c:forEach var="manCount" begin="1" end="20" step="1">
						<option value="${manCount}">${manCount} 명</option>
					</c:forEach>
               	</select>
        	</div>
        	<div class="form-group col-md-2 mb-3">
                <label for="recruitContractUnitValue" class="col-form-label-sm">계약 단위<span class="text-muted">(Optional)</span> </label>
				<select class="custom-select custom-select-sm d-block w-100" id="recruitContractUnitValue">
					<option>없음</option>
	                <c:forEach var="monthVal" begin="1" end="60" step="1">
						<option value="${monthVal}">${monthVal} 개월</option>
					</c:forEach>
               	</select>
        	</div>
        	<div class="form-group col-md-6 mb-3">
                <label for="rewardType" class="col-form-label-sm">보상 정보<span class="text-muted">(Optional)</span> </label>
                <div>
					<select class="custom-select custom-select-sm d-block w-25 float-left"  id="rewardType" onchange="javascript : changeRewardType();">
	                	<mt:enumOptions enumClass="RewardType" emptyValueName="없음" selectedValue="MONTH"></mt:enumOptions>
	                </select> 
	                <input type="text" class="form-control form-control-sm w-25 float-left ml-2" id="rewardMinPrice" placeholder="만원 이상">
	                <div class="float-left ">&nbsp; ~ &nbsp;</div>
	                <input type="text" class="form-control form-control-sm w-25 float-left" id="rewardMaxPrice" placeholder="만원 이하">
                </div>
        	</div>
		</div>  

		<br>
		<h6><b>근무 정보</b></h6>
		<div class="form-row">
			<div class="form-group col-md-2 mb-3">
                <label for="workSido" class="col-form-label-sm">근무지<span class="text-muted">(Optional)</span></label>
                <select class="custom-select custom-select-sm d-block w-100" id="workSido" required onchange="javascript: getSiGunGuTypeReg('workSido','workSiGunGu');">
				    <mt:enumOptions enumClass="SidoType" emptyValueName="시/도 "/>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/도를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-3 mb-3">
                <label for="workSiGunGu" class="col-form-label-sm">&nbsp;</label>
                <select class="custom-select custom-select-sm d-block w-100" id="workSiGunGu" required>
                	<option value="">시/도를 선택해 주세요.</option>
			  	</select>
			  	<div class="invalid-feedback" style="width: 100%;">시/군/구를 선택해 주세요.</div>
			</div>
			<div class="form-group col-md-7 mb-3">
                <label for="workDetailAddr" class="col-form-label-sm">상세 근무지<span class="text-muted">(Optional)</span></label>
 				<input type="text" class="form-control form-control-sm" id="workDetailAddr" placeholder="ex: 강남구청역 푸르지오">
			</div>
		</div>
		
		<div class="form-row">
        	<div class="form-group col-md-8 mb-3">
                <label for="projectName" class="col-form-label-sm">근무 가능 형태</label>
                <div>
		           	<div class="custom-control custom-checkbox custom-control-inline">
						<input type="checkbox" id="officeWorkYn"  value="Y" class="custom-control-input" checked="checked">
						<label class="custom-control-label custom-control-label-sm" for="officeWorkYn">상주</label>
					</div>
					<div class="custom-control custom-checkbox custom-control-inline">
				 		<input type="checkbox" id="officeHomeWorkYn"  value="Y" class="custom-control-input">
				 		<label class="custom-control-label custom-control-label-sm"  for="officeHomeWorkYn">반상주</label>
					</div>
					<div class="custom-control custom-checkbox custom-control-inline">
				 		<input type="checkbox" id="homeWorkYn"   value="Y" class="custom-control-input">
				 		<label class="custom-control-label custom-control-label-sm"  for="homeWorkYn">재택 가능</label>
					</div>
				</div>
        	</div>
		</div>  
		
		<div class="mb-3"> 
        	<label for="jobInfo" class="col-form-label-sm">직무 안내</label>
			<textarea class="form-control form-control-sm" id="jobInfo" aria-label="With textarea" rows="4"></textarea>
		</div>
		
		
		<br>
		<br>
		<h6><b>채용 조건</b></h6>
    	<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="needAcademicLevel" class="col-form-label-sm">학력 제한 </label>
                <select class="custom-select custom-select-sm d-block w-100" style="font-weight: bold" id="needAcademicLevel">
                	<mt:enumOptions enumClass="AcademicLevel" emptyValueName="없음" optionNameSuffix=" 이상"></mt:enumOptions>
                </select>
        	</div>
			<div class="form-group col-md-3 mb-3">
                <label for="needFreeGrade" class="col-form-label-sm">등급 제한</label>
				<select class="custom-select custom-select-sm d-block w-100" id="needFreeGrade">
               		<mt:enumOptions enumClass="FreelancerGrade" emptyValueName="없음" optionNameSuffix=" 이상"></mt:enumOptions>
               	</select>
        	</div>
        	<div class="form-group col-md-1 mb-3"></div>
			<div class="form-group col-md-5 mb-3">
                <label for="limitWorkYearMin" class="col-form-label-sm">연차 제한</label>
                <div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitWorkYearMin">
						<option value="" selected="selected">없음</option>
		                <c:forEach var="year" begin="1" end="20" step="1">
							<option value="${year}" >${year} 년</option>
						</c:forEach>
	               	</select>
	               	<div class="float-left">&nbsp; ~ &nbsp;</div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitWorkYearMax">
						<option value="" selected="selected">없음</option>
		                <c:forEach var="year" begin="1" end="20" step="1">
							<option value="${year}" >${year} 년</option>
						</c:forEach>
	               	</select>
                </div>
        	</div>
		</div>  
		
    	<div class="form-row">
        	<div class="form-group col-md-7 mb-3"></div>
			<div class="form-group col-md-5 mb-3">
                <label for="limitAgeMin" class="col-form-label-sm">나이 제한</label>
                <div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitAgeMin">
						<option value="" selected="selected">없음</option>
		                <c:forEach var="year" begin="1980" end="2014" step="1">
							<option value="${year}" >${year} 년생 </option>
						</c:forEach>
	               	</select>
	               	<div class="float-left">&nbsp; ~ &nbsp;</div>
					<select class="custom-select custom-select-sm d-block w120 float-left" id="limitAgeMax">
						<option value="" selected="selected">없음</option>
		                <c:forEach var="year" begin="1980" end="2014" step="1">
							<option value="${year}" >${year} 년생</option>
						</c:forEach>
	               	</select>
                </div>
        	</div>
		</div>  
		
		<div class="form-row">
        	<div class="form-group col-md-12 mb-3">
        		<label for="projectName" class="col-form-label-sm">필수 조건</label>
		       	<div class="mb-2 input-group rounded p-2" id="needs" style="background-color: #F5F5F5; min-height: 40px"></div>
				<div class="mb-3" style="text-align: right">
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#postingNeedsModal" id="postingNeedsModalBtn">설정하기</button>
				</div>
        	</div>	
        </div>
		<div class="form-row">
        	<div class="form-group col-md-12 mb-3">
        		<label for="projectName" class="col-form-label-sm">우대 조건</label>
		       	<div class="mb-2 input-group rounded p-2" id="prefers" style="background-color: #F5F5F5; min-height: 40px"></div>
				<div class="mb-3" style="text-align: right">
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#postingPrefersModal" id="postingPrefersModalBtn">설정하기</button>
				</div>
        	</div>	
        </div>
		
		<div class="mb-3"> 
        	<label for="recruitInfo" class="col-form-label-sm">채용 정보<span class="text-muted">(Optional)</span></label>
			<textarea class="form-control form-control-sm" id="recruitInfo" aria-label="With textarea" rows="4"></textarea>
		</div>
		

		<br>
		<br>
		<div class="form-row">
        	<div class="form-group col-md-3 mb-3">
                <label for="manager" class="col-form-label-sm">담당자</label>
                <select class="custom-select input-group custom-select-sm d-block" id="manager">
                	<option value="">미정</option>
                	<c:forEach var="manager" items="${ managerList }" >
                		<c:if test="${ sessionScope.customerManager.id eq manager.id }"><option value="${ manager.id }" selected="selected">${ manager.name }</option></c:if>
                		<c:if test="${ sessionScope.customerManager.id ne manager.id }"><option value="${ manager.id }">${ manager.name }</option></c:if>
                	</c:forEach>
		        </select>
        	</div>
		</div>
		<div class="mb-3"> 
        	<label for="managerMemo" class="col-form-label-sm">담당자 메모</label>
			<textarea class="form-control form-control-sm" id="managerMemo" aria-label="With textarea" rows="3"></textarea>
		</div>                                                 
  		<br>
  		<br>
  		<div class="form-row">
			<div class="col-md-5 mb-3">&nbsp;</div>
		  	<div class="col-md-3 mb-3">
		  		<button class="btn btn-primary btn-md btn-block" type="button" id="preview">미리보기</button>
		  	</div>
			<div class="col-md-2 mb-3">
		  		<button  class="btn btn-primary btn-md btn-block" type="button" id="save">저장</button>
		  	</div>
		  	<div class="col-md-2 mb-3">
		  		<button class="btn btn-outline-secondary btn-md btn-block" type="button" onclick="javascript: location.href = '/recruit/posting/main.do'">취소</button>
		  	</div>
		</div>
  	</form>
  	</div>
  	
<div class="modal fade" id="projectFindModal" tabindex="-1" role="dialog" aria-labelledby="projectFindModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        		<h5 class="modal-title" id="projectFindModalLabel"><b>프로젝트 찾기</b></h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">프로젝트를 선택해 주세요.</span>
						</div>
						<div class="card-body p-2">
							<table class="table h3 small text-center" >
								<thead class="thead-light" style="borde : 1px">
								    	<tr>
								      		<th scope="col">진행상태</th>
								      		<th scope="col" class="">기간</th>
								      		<th scope="col">프로젝트명</th>
								    		<th>선택</th>
								    	</tr>
							  	</thead>
							  	<tbody  id="projectList">
								</tbody>
							</table>
							<div id="projectCountDiv">
							</div>
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

<div class="modal fade" id="postingNeedsModal" tabindex="-1" role="dialog" aria-labelledby="postingNeedsModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="postingNeedsModalLabel"><b>필수 조건  설정</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="needsPopupDiv"> </div>
					<br>
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">우대조건을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body">
							<c:forEach var="advantage" items="${ advantageList }">
								<c:if test="${ advantage.advantageType eq 'PREFERENCE' }">
									<c:if test="${ advantage.customerCode eq 'COMMON' }">
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'needs')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'needs')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
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
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'needs')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'needs')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div> 
					<br>
					
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">보유 기술을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body p-2">
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
												  	<button type="button" class="btn btn-outline-info btn-sm ml-1" style="margin: -3px" onclick="javacript: skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'needs', this)">&#43;</button>
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
												  	<button type="button" class="btn btn-outline-warning btn-sm ml-1" style="margin: -3px" onclick="javacript: skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'needs', this)">&#43;</button>
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
					
	
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:needsSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>


<div class="modal fade" id="postingPrefersModal" tabindex="-1" role="dialog" aria-labelledby="postingPrefersModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     		<div class="modal-header  text-white bg-info">
        	<h5 class="modal-title" id="postingPrefersModalLabel"><b>우대 조건  설정</b></h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      		</div>
			
			<div class="modal-body">
				<div class="container-fluid">
			       	<div class="mb-3 input-group" id="prefersPopupDiv"> </div>
					<br>
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">우대조건을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body">
							<c:forEach var="advantage" items="${ advantageList }">
								<c:if test="${ advantage.advantageType eq 'PREFERENCE' }">
									<c:if test="${ advantage.customerCode eq 'COMMON' }">
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'prefers')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:preferenceAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'prefers')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
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
										<button type="button" class="btn btn-outline-info btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'prefers')">
										${ advantage.advantageName }</button>
									</c:if>
									<c:if test="${ advantage.customerCode ne 'COMMON' }">
										<button type="button" class="btn btn-outline-warning btn-sm" value="${ advantage.advantageSeq }" onclick="javascipt:licenseAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'prefers')">
										${ advantage.advantageName }</button>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div> 
					<br>
					
					<div class="card">
						<div class="card-header">
      						<span class="text-muted small">보유 기술을 선택해 추가해 주세요.</span>
						</div>
						<div class="card-body p-2">
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
												  	<button type="button" class="btn btn-outline-info btn-sm ml-1" style="margin: -3px" onclick="javacript: skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'prefers', this)">&#43;</button>
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
												  	<button type="button" class="btn btn-outline-warning btn-sm ml-1" style="margin: -3px" onclick="javacript: skillSetAdd('${ advantage.advantageSeq }','${ advantage.advantageName }','${ advantage.customerCode }', 'prefers', this)">&#43;</button>
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
					
	
  				</div>
			</div>
    		<div class="modal-footer">
        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
        	<button type="button" class="btn btn-primary btn-sm" onclick="javascript:prefersSave();">적용</button>
      		</div>
    	</div>
  	</div>
</div>
</main>


<script>
var companyInfos = new Array();
<c:forEach var="company" items="${ companyList }" varStatus="status">
companyInfos['${company.companyName}'] = ${company.companySeq}
</c:forEach>


var companyList = [//'네이년','네이놈',
<c:forEach var="company" items="${ companyList }" varStatus="status">
<c:if test="${ not status.last }">'${company.companyName}',</c:if>
<c:if test="${ status.last }">'${company.companyName}'</c:if>
</c:forEach>
];
				
				
(function() {
	'use strict';

	window.addEventListener('load', function() {
		
		$('#preview').bind('click', function(event) {

		});
		
		$('#save').bind('click', function(event) {
			var form = document.getElementById('regForm');
		  	if (form.checkValidity() === false) {
		    	event.preventDefault();
		        event.stopPropagation();
		        form.classList.add('was-validated');
		    } else {
		    	regPosting();
		    }
		});
		
		$('#deleteProjectBtn').bind('click', function(event) {
			$('#project').val('');
			$('#projectSeq').val('');
		});
		
		$('#projectFindModalBtn').bind('click', function(event) {
			$('#projectFindModalBtn').trigger('focus');

	    	
 			var company = companyList.filter(function (value) {
		        return (value == $('#company').val());
		    });
			if (company.length != 1) {
				alert('업체정보를 다시 확인 해주세요.');
				return false;
			}
			
			$('#projectFindModal').modal('show');
	    	$('#projectList').html('');
	    	
			var param = {}
			param.companySeq = companyInfos[company[0]];
			param.status = ['READY','ING'];
			
 			COMMON.ajax({
			    url : '/business/project/getCompanyProjectListAjax.json',
			    data : JSON.stringify(param),
			    successHandler : function(data){
			    	
			    	var pageInf = data.result.pager;
			    	var list = data.result.list;
			    	var html = '';
			    	if (list != null && list.length > 0) { 
				    	$(list).each(function(i, project) {
				    		
				    		html += '<tr>' +  '<th>' + project.statusName  + '</th>' + '<td>' + project.startYmd + ' ~ ' + project.endYmd + '</td>' 
				    		+ '<td>' + project.projectName + '</td><td><button type="button" class="btn btn-outline-primary btn-sm float-left ml-2"  onclick="javacript:selectProject(' 
				    				+ project.projectSeq +', \'' + project.projectName +'\', \'' + project.sido +'\', \'' + project.sigungu +'\', \'' + project.detailAddr +'\')">선택</button></td></tr>'
				    	});
			    	} else {
			    		html = '<tr class=""><td colspan="4">등록된 프로젝트가 없습니다.</td></tr>'
			    	}
					
			    	$('#projectList').append(html);
			    	$('#projectCountDiv').html('<small class="d-block text-right mt-3">총 ' + pageInf.totalCount + ' 건이 조회되었습니다</small>');
			    	//TODO -다음에는 페이지 처리
			    }
			});
		});
		
		COMMON.autoCompleteInput('company', companyList, function() {
			var company = companyList.filter(function (value) {
		        return (value == $('#company').val());
		    });
			return company.length == 1;
		});
		
		COMMON.calendar('postingEnd', {defaultDate: +30});
		
		if ($('#selectedCompanyName').val() != '') {
			$('#company').val($('#selectedCompanyName').val());
			$('#company').css('background-color','#bfeffb');
			$('#company').attr('isMatchItem', true);

			companyChange('company', $('#projectSeq').val() != '' ? true : false);
		}
		
		if ($('#projectSeq').val() != '') {
			selectProject($('#projectSeq').val(), $('#selectedProjectName').val(), $('#selectedProjectSido').val(), $('#selectedProjectSigungu').val(), $('#selectedProjectDetailAddr').val());
		}
    	
	}, false);
})();

function selectProject(projectSeq, projectName, sido, sigungu, detailAddr) {
	$('#projectSeq').val(projectSeq);
	$('#project').val(projectName);
	$('#projectFindModal').modal('hide');
	
	$('#workSido').val('');
	$('#workSiGunGu').val('');
	$('#workDetailAddr').val('');
	
	if (sido && sido != 'null' && $('#workSido').val() == '' && $('#workSiGunGu').val() == '' ) {
		$('#workSido').val(sido);
		
		if (sigungu && sigungu != 'null') {
			getSiGunGuTypeReg('workSido', 'workSiGunGu', sigungu);
		}
		
		
		if (detailAddr && detailAddr != 'null'  && $('#workDetailAddr').val() == '') {
			$('#workDetailAddr').val(detailAddr)
		}
	}
}

function changeRewardType() {
	if ($('#rewardType option:selected').val() == '') {
		$('#rewardMinPrice').val('');
		$('#rewardMinPrice').prop('readonly', true);
		$('#rewardMaxPrice').val('');
		$('#rewardMaxPrice').prop('readonly', true);
	} else {
		$('#rewardMinPrice').prop('readonly', false);
		$('#rewardMaxPrice').prop('readonly', false);	
	}
}

function companyChange(id , flag) {
	
	if ($('#' + id).val() && $('#' + id).val().length > 0) {
		var company = companyList.filter(function (value) {
	        return (value == $('#' + id).val());
	    });
		if (company.length == 1) {
			
			COMMON.ajax({
			    url : '/business/companyStaff/getCompanyManagerList.json?companySeq=' + companyInfos[company[0]],
			    successHandler : function(data){
			    	$('#' + id + 'Manager  option').remove();
			    	$('#' + id + 'Manager').append('<option value=""> - </option>')
			    	$(data.result).each(function(i, companyStaff) {
			    		$('#' + id + 'Manager').append('<option value="' + companyStaff.companyStaffSeq + '">' + companyStaff.name + '</option>')
			    	});
			    }
			});
			
		} else {
			$('#' + id + 'Manager option').remove();
	    	$('#' + id + 'Manager').append('<option value="">&nbsp;</option>')
		}
	} else {
		$('#' + id + 'Manager option').remove();
    	$('#' + id + 'Manager').append('<option value="">&nbsp;</option>')
	}
	
	if (!flag) {
		$('#project').val('');
		$('#projectSeq').val('');
	}
}

function licenseAdd(seq, name, customCode, tapId) {
	var color = customCode == 'COMMON' ? 'info' : 'warning';
	var divId = 'license' + seq; 
	if ($('#' + tapId + 'PopupDiv #' + divId).length > 0) {
		return false;
	}
	
	var html  = 
		'<div class="card small licenseRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-4" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#' + tapId + 'PopupDiv').append(html);
}

function preferenceAdd(seq, name, customCode, tapId) {
	var color = customCode == 'COMMON' ? 'info' : 'warning';
	var divId = 'preference' + seq; 
	if ($('#' + tapId + 'PopupDiv #' + divId).length > 0) {
		return false;
	}
	
	var html  = 
		'<div class="card small preferenceRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-4" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#' + tapId + 'PopupDiv').append(html);
}

function skillSetAdd(seq, name, customCode, tapId, btn) {
	var color = customCode == 'COMMON' ? 'info' : 'warning';
	var divId = 'skillSet' + seq; 
	if ($('#' + tapId + 'PopupDiv #' + divId).length > 0) {
		return false;
	}
	
	var expVal = $(btn).parent().find('select option:checked').val();
	var expText = $(btn).parent().find('select option:checked').text();
	
	var html  = 
		'<div class="card small skillSetRow border-' + color + ' m-1" id="' + divId + '" data="' + seq + ',' + expVal + '">' +
			'<div class="card-body text-' + color + '"  style="padding: 0.40rem">' +
				'<p class="card-text">' + name + '-' + expText + '<button type="button" class="btn btn-outline-' + color + ' btn-sm ml-3" style="margin: -3px" onclick="javacript: $(this).parent().parent().parent().remove();">&times;</button></p>' +
			'</div>' +
    	'</div>';
    
    $('#' + tapId + 'PopupDiv').append(html);
}

function needsSave() {
	$('#needs').html('');
	$('#needs').append($('#needsPopupDiv').html());
	$('#postingNeedsModal').modal('hide');
}

function prefersSave() {
	$('#prefers').html('');
	$('#prefers').append($('#prefersPopupDiv').html());
	$('#postingPrefersModal').modal('hide');
}

function regPosting() {
	var param = {};
	
	param.endYmd = $('#postingEnd').val();
	var company = companyList.filter(function (value) {
        return (value == $('#company').val());
    });
	if (company.length != 1) {
		alert('업체정보를 다시 확인 해주세요.');
		return false;
	}
	param.companySeq = companyInfos[company[0]];
	if ($('#companyManager').val() != '') {
		param.companyStaffSeq = $('#companyManager').val();
	} else {
		param.companyStaffSeq = null;
	}
	
	param.postingTitle = $('#posingTitle').val();
	param.sitePostYn = $('#sitePostYn').is(':checked') ? 'Y' : 'N';
	
	if ($('#workType').val() != '') {
		param.workType = $('#workType').val();
	}
	if ($('#projectSeq').val() != '') {
		param.projectSeq = $('#projectSeq').val();
	}
	
	param.recruitType = $('#recruitType').val();
	param.recruitManCount = $('#recruitManCount').val();
	
	if ($('#recruitContractUnitValue').val() != '') {
		param.recruitContractUnitValue = $('#recruitContractUnitValue').val();
	}
	
	param.rewardType = $('#rewardType').val();
	if ($('#rewardMinPrice').val() != '' && $('#rewardMaxPrice').val() != '') {
		var minNum = new Number($('#rewardMinPrice').val());
		var maxNum = new Number($('#rewardMaxPrice').val());
		if (minNum > maxNum) {
			alert('보상 정보를 확인해 주세요.');
			return false;
		}
	}
	
	if ($('#rewardMinPrice').val() != '') {
		param.rewardMinPrice = $('#rewardMinPrice').val();
	}
	if ($('#rewardMaxPrice').val() != '') {
		param.rewardMaxPrice = $('#rewardMaxPrice').val();
	}
	
	if ($('#needAcademicLevel').val() != '') {
		param.needAcademicLevel = $('#needAcademicLevel').val();
	}
	if ($('#needFreeGrade').val() != '') {
		param.needFreeGrade = $('#needFreeGrade').val();
	}
	
	if ($('#limitWorkYearMin').val() != '' && $('#limitWorkYearMax').val() != '') {
		var minNum = new Number($('#limitWorkYearMin').val());
		var maxNum = new Number($('#limitWorkYearMax').val());
		if (minNum > maxNum) {
			alert('필요 경력을 확인해 주세요.');
			return false;
		}
	}
	
	if ($('#limitWorkYearMin').val() != '') {
		param.limitWorkYearMin = $('#limitWorkYearMin').val();
	}
	if ($('#rewardMaxPrice').val() != '') {
		param.limitWorkYearMax = $('#limitWorkYearMax').val();
	}
	
	
	if ($('#limitAgeMin').val() != '' && $('#limitAgeMax').val() != '') {
		var minNum = new Number($('#limitAgeMin').val());
		var maxNum = new Number($('#limitAgeMax').val());
		if (minNum > maxNum) {
			alert('연령 제한을 확인해 주세요.');
			return false;
		}
	}
	
	if ($('#limitAgeMin').val() != '') {
		param.limitAgeMin = $('#limitAgeMin').val();
	}
	if ($('#limitAgeMax').val() != '') {
		param.limitAgeMax = $('#limitAgeMax').val();
	}
	
	param.workSido = $('#workSido').val() == '' ? null : $('#workSido').val();
	param.workSiGunGu = $('#workSiGunGu').val() == '' ? null : $('#workSiGunGu').val();
	param.workDetailAddr = $('#workDetailAddr').val();
	

	param.officeWorkYn = $('#officeWorkYn').is(':checked') ? 'Y' : 'N';
	param.officeHomeWorkYn = $('#officeHomeWorkYn').is(':checked') ? 'Y' : 'N';
	param.homeWorkYn = $('#homeWorkYn').is(':checked') ? 'Y' : 'N';
	
	param.jobInfo = $('#jobInfo').val();
	param.recruitInfo = $('#recruitInfo').val();
	
	param.mainManagerId = $('#manager').val();
	param.managerMemo = $('#managerMemo').val(); 

	var prefers = new Array();
	$('#prefers .preferenceRow').each(function(obj) {
		prefers.push({'advantageSeq' : $(this).attr('data'), 'advantageType' : 'PREFERENCE'});
	});
	 
	$('#prefers  .licenseRow').each(function(obj) {
		prefers.push({'advantageSeq' : $(this).attr('data'), 'advantageType' : 'LICENSE'});
	});
	var skillSets = new Array();
	$('#prefers .skillSetRow').each(function(obj) {
		prefers.push({'advantageSeq' : $(this).attr('data').split(',')[0], 'skillSetWorkmanship' : $(this).attr('data').split(',')[1], 'advantageType' : 'SKILL'});
	});
	param.prefers = prefers;
	
	var needs = new Array();
	$('#needs .preferenceRow').each(function(obj) {
		needs.push({'advantageSeq' : $(this).attr('data'), 'advantageType' : 'PREFERENCE'});
	});
	 
	$('#needs  .licenseRow').each(function(obj) {
		needs.push({'advantageSeq' : $(this).attr('data'), 'advantageType' : 'LICENSE'});
	});
	var skillSets = new Array();
	$('#needs .skillSetRow').each(function(obj) {
		needs.push({'advantageSeq' : $(this).attr('data').split(',')[0], 'workmanship' : $(this).attr('data').split(',')[1], 'advantageType' : 'SKILL'});
	});
	param.needs = needs;
	
	event.preventDefault();
    event.stopPropagation();
 
	COMMON.ajax({
	    url : '/recruit/posting/registPostingProc.json',
	    data : JSON.stringify(param),
	    successHandler : function(data){
	    	
	    	alert('채용공고를 등록하였습니다.');
			location.href = '/recruit/posting/main.do';
	    }
	});
}

//TODO 등록 후에 프리랜서 검색으로 이동해서 검색되고.... 검색 조건 체크하는 항목

//파트너사 관리 - 파트너의 공고라는 의미
</script>