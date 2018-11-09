<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
	 
</head>
	<main role="main" class="container">
	<br>
	<div class="card text-center">
  		<div class="card-header">
    		<ul class="nav nav-tabs card-header-tabs">
	      		<li class="nav-item">
	        		<a class="nav-link" href="#">홈</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" href="#">프로젝트관리</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link active" href="#">인재관리</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" href="#">계약관리</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" href="#">영업관리</a>
	      		</li>
    		</ul>
  		</div>
 
	 	<div class="card-body" id="resourceConf">
	    	<h5 class="card-title">인재 관리 - 대쉬보드 설정</h5>
	    	<p class="card-text"><small>With supporting text below as a natural lead-in to additional content.</small></p>
	    	
	    	<div class="border p-2 m-3" ondrop="drop(event)" ondragover="allowDrop(event)" matchingId=""><span class="text-muted">1.&nbsp;</span></div>
	    	<div class="border p-2 m-3" ondrop="drop(event)" ondragover="allowDrop(event)" matchingId=""><span class="text-muted">2.&nbsp;</span></div>
	    	<div class="border p-2 m-3" ondrop="drop(event)" ondragover="allowDrop(event)" matchingId=""><span class="text-muted">3.&nbsp;</span></div>
	    	<div class="border p-2 m-3" ondrop="drop(event)" ondragover="allowDrop(event)" matchingId=""><span class="text-muted">4.&nbsp;</span></div>
	    	<div class="border p-2 m-3" ondrop="drop(event)" ondragover="allowDrop(event)" matchingId=""><span class="text-muted">5.&nbsp;</span></div>
	    	
	    	<div class="border p-2 m-3 bg-light" ondrop="dropRemove(event)" ondragover="allowDrop(event)"><span class="text-muted">제거</span></div>

	    	<br>
	    	<div class=""><small>대쉬 보드에 추가할 내용을 선택해 주세요.</small></div>
	    	<br>
	    	<div id="buttons">
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag1">최근 등록 프리랜서</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag2">구직 대기 </button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag3">계약 만료 임박</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag4">계약 만료 확인</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag5">계약 진행중 프리랜서</button>
	    	
	    	
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag6">최근 등록 프리랜서(나의 담당)</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag7">계약 만료 임박(나의 담당)</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag8">계약 만료 확인(나의 담당)</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag9">계약 진행중 프리랜서(나의 담당)</button>
	    	<button class="btn btn-sm btn-outline-info m-1" draggable="true" ondragstart="drag(event)" id="drag10">구직 대기 (나의 담당)</button>
	   		</div>
	   		
	    	<br><br><br>
	    	<a href="#" class="btn btn-sm btn-primary">Save</a>
	  	</div>
	</div>

    </main>

<script>
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function allowDrop(ev) {
    ev.preventDefault();
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
 	if (ev.target.getAttribute('matchingId') == '') { //매칭된적이 없다면 넣어준다.
 		
 		if ($('div[matchingId="' + data + '"]').length == 1) {//추가된적이 있다면
 			$('div[matchingId="' + data + '"]').attr('matchingId', '');
 		}
 		ev.target.appendChild(document.getElementById(data));
 		ev.target.setAttribute('matchingId', data);
 	}
}

function dropRemove(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	
	if ($('div[matchingId="' + data + '"]').length == 1) { //추가됏다가 삭제된것만
		document.getElementById('buttons').appendChild(document.getElementById(data));
		$('div[matchingId="' + data + '"]').attr('matchingId', '');
	}
	
}

</script>