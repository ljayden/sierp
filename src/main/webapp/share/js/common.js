var PER_PAGE = 10;
var ajaxRequests = {}

var staticSigunguList = new Array();
//staticSigunguList.push({'code':'GANGNAMGU', 'sido':'SEOUL', 'description':'강남구'});
//staticSigunguList.push({'code':'GANGDONGGU', 'sido':'SEOUL', 'description':'강동구'});
//staticSigunguList.push({'code':'GANGBUKGU', 'sido':'SEOUL', 'description':'강북구'});
//staticSigunguList.push({'code':'GANGSEOGU', 'sido':'SEOUL', 'description':'강서구'});
//staticSigunguList.push({'code':'GWANAKGU', 'sido':'SEOUL', 'description':'관악구'});
//staticSigunguList.push({'code':'GWANGJINGU', 'sido':'SEOUL', 'description':'광진구'});
//staticSigunguList.push({'code':'GUROGU', 'sido':'SEOUL', 'description':'구로구'});
//staticSigunguList.push({'code':'GEUMCHEONGU', 'sido':'SEOUL', 'description':'금천구'});
//staticSigunguList.push({'code':'NOWONGU', 'sido':'SEOUL', 'description':'노원구'});
//staticSigunguList.push({'code':'DOBONGGU', 'sido':'SEOUL', 'description':'도봉구'});
//staticSigunguList.push({'code':'DONGDAEMOONGU', 'sido':'SEOUL', 'description':'동대문구'});
//staticSigunguList.push({'code':'DONGJAKGU', 'sido':'SEOUL', 'description':'동작구'});
//staticSigunguList.push({'code':'MAPOGU', 'sido':'SEOUL', 'description':'마포구'});
//staticSigunguList.push({'code':'SEODAEMOONGU', 'sido':'SEOUL', 'description':'서대문구'});
//staticSigunguList.push({'code':'SEOCHOGU', 'sido':'SEOUL', 'description':'서초구'});
//staticSigunguList.push({'code':'SEONGDONGGU', 'sido':'SEOUL', 'description':'성동구'});
//staticSigunguList.push({'code':'SEONGBUKGU', 'sido':'SEOUL', 'description':'성북구'});
//staticSigunguList.push({'code':'SONGPAGU', 'sido':'SEOUL', 'description':'송파구'});
//staticSigunguList.push({'code':'YANGCHEONGU', 'sido':'SEOUL', 'description':'양천구'});
//staticSigunguList.push({'code':'YEONGDEUNGPOGU', 'sido':'SEOUL', 'description':'영등포구'});
//staticSigunguList.push({'code':'YONGSANGU', 'sido':'SEOUL', 'description':'용산구'});
//staticSigunguList.push({'code':'EUNPYEONGGU', 'sido':'SEOUL', 'description':'은평구'});
//staticSigunguList.push({'code':'JONGNOGU  ', 'sido':'SEOUL', 'description':'종로구'});
//staticSigunguList.push({'code':'JUNGGU', 'sido':'SEOUL', 'description':'중구'});
//staticSigunguList.push({'code':'JUNGNANGGU', 'sido':'SEOUL', 'description':'중랑구'});
//
//
//staticSigunguList.push({'code':'GAPYEONGGUN', 'sido':'GYUNGGI', 'description':'가평군'});
//staticSigunguList.push({'code':'GOYANGSI_DUKYANGGU', 'sido':'GYUNGGI', 'description':'고양시 덕양구'});
//staticSigunguList.push({'code':'GOYANGSI_ILSANDONGGU', 'sido':'GYUNGGI', 'description':'고양시 일산동구'});
//staticSigunguList.push({'code':'GOYANGSI_ILSANSEOGU', 'sido':'GYUNGGI', 'description':'고양시 일산서구'});
//staticSigunguList.push({'code':'GWACHEONSI', 'sido':'GYUNGGI', 'description':'과천시'});
//staticSigunguList.push({'code':'GWANGMYEONGSI', 'sido':'GYUNGGI', 'description':'광명시'});
//staticSigunguList.push({'code':'GWANGJUSI', 'sido':'GYUNGGI', 'description':'광주시'});
//staticSigunguList.push({'code':'GURISI', 'sido':'GYUNGGI', 'description':'구리시'});



function getSigungu(sidoCode) {
	var sigunguListOfSido = staticSigunguList.filter(function (sigungu) {
        return (sigungu.sido == sidoCode);
    });
	return sigunguListOfSido ? sigunguListOfSido: new Array();	
}



function getSiGunGuTypeSearch(sidoElementId, sigunguElementId) {
	if ($('#' + sidoElementId).val() == '') {
		$('#' + sigunguElementId + ' option').remove();
    	$('#' + sigunguElementId).append('<option value="">전체</option>');
    	
	} else {
		var sigunguList = getSigungu($('#' + sidoElementId).val());
		$('#' + sigunguElementId +'  option').remove();
		$('#' + sigunguElementId).append('<option value="">전체</option>')
		$(sigunguList).each(function(i, sigungu) {
	    	$('#' + sigunguElementId).append('<option value="' + sigungu.code + '">' + sigungu.description + '</option>')
	    });
//		COMMON.ajax({
//		    url : '/common/getSiGunGu.json',
//		    data : JSON.stringify({ sido : $('#' + sidoElementId).val()}),
//		    successHandler : function(data){
//		    	$('#' + sigunguElementId +'  option').remove();
//		    	$('#' + sigunguElementId).append('<option value="">전체</option>')
//		    	$(data.result).each(function(i, sigungu) {
//		    		$('#' + sigunguElementId).append('<option value="' + sigungu.code + '">' + sigungu.description + '</option>')
//		    	});
//		    }
//		});
	}
}

function getSiGunGuTypeReg(sidoElementId, sigunguElementId, selectedValue) {
	if ($('#' + sidoElementId).val() == '') {
		$('#' + sigunguElementId + ' option').remove();
    	$('#' + sigunguElementId).append('<option value="">시/도를 선택해 주세요.</option>');
    	
	} else {
		var sigunguList = getSigungu($('#' + sidoElementId).val());
		$('#' + sigunguElementId +'  option').remove();
		$('#' + sigunguElementId).append('<option value="">시/군/구</option>')
		$(sigunguList).each(function(i, sigungu) {
			$('#' + sigunguElementId).append('<option value="' + sigungu.code + '">' + sigungu.description + '</option>')
		});
		    	
		if (selectedValue) {
			$('#' + sigunguElementId).val(selectedValue);
		}
	}
}
			
//		COMMON.ajax({
//		    url : '/common/getSiGunGu.json',
//		    data : JSON.stringify({ sido : $('#' + sidoElementId).val()}),
//		    successHandler : function(data){
//		    	$('#' + sigunguElementId +'  option').remove();
//		    	$('#' + sigunguElementId).append('<option value="">시/군/구</option>')
//		    	$(data.result).each(function(i, sigungu) {
//		    		$('#' + sigunguElementId).append('<option value="' + sigungu.code + '">' + sigungu.description + '</option>')
//		    	});
//		    	
//		    	if (selectedValue) {
//		    		$('#' + sigunguElementId).val(selectedValue);
//		    	}
//		    }
//		});





var COMMON = {
 
	openWin : function(sURL, sWindowName, w, h, sScroll, reSize, status) {
		// 화면 중앙으로 Popup 띄우기.. 스크롤바는 옵션..
		// ex)
		//		openWin("test.asp", "winTest", 400, 300);			☞ 스크롤바 없음
		//		openWin("test.asp", "winTest", 400, 300, "yes");	☞ 스크롤바 있음
		//		openWin("test.asp", "winTest", 400, 300, "auto");	☞ 스크롤바 자동

		var x = (screen.width - w) / 2;
		var y = (screen.height - h) / 2;

		if (sScroll==null) sScroll = "no";
		if (screen.width >= 800 && screen.height >= 600 ) sScroll = "yes"; // 해상도 800*600일 때 스크롤 생기도록 함 
		
		var sOption = "";
		sOption = sOption + "toolbar=no, channelmode=no, location=no, directories=no, menubar=no";
		sOption = sOption + ", scrollbars=" + sScroll + ", resizable=" + reSize + ", status=" + status +", left=" + x + ", top=" + y + ", width=" + w + ", height=" + h;

		var win = window.open(sURL, sWindowName, sOption);
		try {
			win.focus();
		} catch(e) {}

		return win;
	},
		
    ajax: function (optionParam) {

        var ajaxOption = {
            //ajax option
            headers: {
                "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8;"
            },
            url: null,
            method: 'POST',
            form: null,
            data: null,
            dataType: 'json',

            //custom option
            successHandler: null,  //function successHandler(data)
            failHandler: null,  //function successHandler(code, message, data)
            isShowloadingImg: false
        };

        if (optionParam) {
            $.each(optionParam, function (name, val) {
                ajaxOption[name] = val;
            });
        }
 

        if (ajaxOption.e) {
            return;
        }

        if (ajaxOption.form) {
            ajaxOption.url = ajaxOption.form.attr("action");
            ajaxOption.data = ajaxOption.form.serialize();
        } else {
            ajaxOption.headers['Content-Type'] = 'application/json';
        }
        
        if (!ajaxOption.success) {
            ajaxOption.success = function (result, status) {
                if (status == 'success') {

                    if (result.code == 0) {
                        if (ajaxOption.successHandler && typeof(ajaxOption.successHandler) == 'function') {

                            ajaxOption.successHandler(result);
                        }

                    } else {
                    	if (result.code == 9000) {
                    		alert('로그아웃 되었습니다.');
                    		location.href = '/login.do';
                    		//TO-DO 다음에는 다시 로그인 할수 있도록 기능제공
                    		
                    	} else {
                            if (ajaxOption.failHandler && typeof(ajaxOption.failHandler) == 'function') {

                                ajaxOption.failHandler(result.code, result.serverMessage, result);
                            }
                            else {
                                if (COMMON.serverFailResponseProcessor && typeof(COMMON.serverFailResponseProcessor) == 'function') {
                                    COMMON.serverFailResponseProcessor(result.code, result.serverMessage, result);
                                } else {
                                    COMMON.defaultServerFailResponseProcessor(result.code, result.serverMessage, result);
                                }
                            }
                    	}

                    }

                } else {
                    alert('데이터 요청 중 오류가 발생하였습니다. 다시 한 번 시도해주세요.');
                }
            }
        }


        ajaxOption.error = function (jqXHR, textStatus, errorThrown) {
        	if (ajaxOption.failHandler && typeof(ajaxOption.failHandler) == 'function') {
                ajaxOption.failHandler(jqXHR.responseJSON.code, jqXHR.responseJSON.info.clientMessage, jqXHR.responseJSON.info);
                
            } else if (jqXHR.responseJSON != null) {
                if (jqXHR.responseJSON.info.errorMessage != null && jqXHR.responseJSON.info.errorMessage.length < 50) {
                    alert(jqXHR.responseJSON.info.errorMessage);
                } else {
                    alert('데이터 요청 중 오류가 발생하였습니다. 다시 한 번 시도해주세요.');
                }
            }
        };

        ajaxOption.complete = function (jqXHR, textStatus) {
            if (ajaxOption.isShowloadingImg) {
                $('#ajaxLoadingDiv').hide();
            }
            
            ajaxRequests[ajaxOption.url] = null;
        };

        var ajax = $.ajax(ajaxOption);

        if (ajaxOption.isShowloadingImg) {
            var ald = $('#ajaxLoadingDiv');
            if (!ald) {
            	 $('<div id="ajaxLoadingDiv" style="width: 100%;height: 100%;position: absolute;z-index: 10000;top: 0%;left: 0%;"><img alt="loading" src="/share/img/loader-normal.gif" style="top: 50%;left: 50%;position: fixed;"></div>').appendTo(document.body);
            }
            ald.show();
        }

        //$(window).ajaxStart(function() {});
        //$(window).ajaxStop(function() {});


    },


    defaultServerFailResponseProcessor: function (code, message, data) {
        if (data.message != null) {
            alert(data.message);
        } else {
            alert('데이터 요청 중 오류가 발생하였습니다. 다시 한 번 시도해주세요.(' + code + ')');
        }
    },

    serverFailResponseProcessor: false,

    /*
     * datepicker
     * @NOTE : calendar가 아니라 datepicker임
     */
    calendar: function (eldId, optionParam) {
	
        var datepickerOption = {
					    	        dateFormat: "yy-mm-dd",
					    	        changeMonth: true,
					    	        changeYear: true,
					    	        monthNames:  [ "1월", "2월", "3월", "4월", "5월", "6월",  "7월", "8월", "9월", "10월", "11월", "12월" ],
					    	        monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",  "7월", "8월", "9월", "10월", "11월", "12월" ],
					    			dayNamesMin:   ["일", "월", "화", "수", "목", "금", "토",]
					    			//minDate: new Date(2012, 1 - 1, 1) 
					    			
    							}
        if (optionParam) {
        	$.each(optionParam, function (name, val) {
        		datepickerOption[name] = val;
            });
        }
        
    	$('#' + eldId).datepicker(datepickerOption);
    },

    /*
     * dateFormat
     */
    dateFormat: function () {
        Date.prototype.format = function (f) {
            if (!this.valueOf()) return " ";

            var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
            var d = this;

            return f.replace(/(yyyy|yy|MM|M|dd|d|E|HH|hh|mm|SSS|ss|a\/p)/g, function ($1) {
                switch ($1) {
                    case "yyyy":
                        return d.getFullYear();
                    case "yy":
                        return (d.getFullYear() % 1000).zf(2);
                    case "MM":
                        return (d.getMonth() + 1).zf(2);
                    case "M":
                        return (d.getMonth() + 1).zf(1);
                    case "dd":
                        return d.getDate().zf(2);
                    case "d":
                        return d.getDate().zf(1);
                    case "E":
                        return weekName[d.getDay()];
                    case "HH":
                        return d.getHours().zf(2);
                    case "hh":
                        return ((h = d.getHours() % 12) ? h : 12).zf(2);
                    case "mm":
                        return d.getMinutes().zf(2);
                    case "ss":
                        return d.getSeconds().zf(2);
                    case "a/p":
                        return d.getHours() < 12 ? "AM" : "PM";
                    case "SSS":

                        var temp = "0000";
                        var milliSeconds = d.getMilliseconds();

                        temp = temp + milliSeconds;
                        temp = temp.substring(temp.length - 3, temp.length);
                        return temp;

                    default:
                        return $1;
                }
            });
        };

        String.prototype.string = function (len) {
            var s = '', i = 0;
            while (i++ < len) {
                s += this;
            }
            return s;
        };
        String.prototype.zf = function (len) {
            return "0".string(len - this.length) + this;
        };
        Number.prototype.zf = function (len) {
            return this.toString().zf(len);
        };
    },

    chart: function (series, drawId, title) {
        var container = document.getElementById(drawId);
        data = {
            categories: [title],
            series: series
        };

        newTheme = {
            series: {
                colors: ['#ac4142', '#d28445', '#f4bf75', '#90a959', '#75b5aa', '#6a9fb5', '#aa759f', '#8f5536', "#D7E81E", "#AF35E8"],
            }
        };
        tui.chart.registerTheme('newTheme', newTheme);
        options = {
            chart: {
                width: 336,
                height: 350,
                title: title
            },
            series: {
                showLegend: true,
                labelAlign: 'center',
                showLabel: true,
                radiusRange: ["40%", "100%"],
            },
            legend: {
                align: 'bottom', // legend align
                visible: true, // whether visible or not
                showCheckbox: false // whether show checkbox or not
            },
            theme: "newTheme"
        };


        tui.chart.pieChart(container, data, options);
    },

    imageFileRead: function (file, $img, callback) {
        console.log(file);

        var type = file.type.substring(0, file.type.indexOf("/"));

        if (type !== "image") {
            alert('이미지 파일이 아닙니다.');
            return false;
        }

        var reader = new FileReader();

        reader.readAsDataURL(file);
        reader.onload = function () {
            callback(reader.result, file.name, $img);
        };
        reader.onerror = function (error) {
            console.log('Error: ', error);
        }
    },

    mouseOverThumbnailFloating: function ($dom) {

        var $content = $("#content");
        //console.log($content);
        $dom
            .find('img')
            .hover(
                function (e) {
                    var $this = $(this),
                        _color = $this.attr('rel');
                    var image = new Image();
                    image.src = this.src;
                    var width;
                    var height;
                    image.onload = function () {
                        width = this.width;
                        height = this.height;

                        var top = ($this.offset().top - (height / 2));
                        var left = ($this.offset().left - width);

                        var hover = $("<div id='hoverThumb'></div>").css({
                            'background-color': _color,
                            'top': (top > 0 ? top : 0) + "px",
                            'left': (left > 0 ? left : 0) + "px",
                            'position': "absolute",
                            "display": "inline-block",
                            "z-index": 150
                        }).append($("<img>", {src: this.src}));
                        hover.appendTo($content);
                        //hover.show();
                    };

                },
                function (e) {
                    $('div#hoverThumb').remove();
                }
            );

    },

    openModal: function (element) {
        $(element).show();
        $(".dimmed").show();
    },

    closeModal: function (element) {
        $(element).hide();
        $(".dimmed").hide();
    },

    autoCompleteInput : function(elementId, sourceList, changeNotFoundfunc) {
    	$('#' + elementId).autocomplete({
    		source: sourceList,
    		minLength: 2,
    		change: function( event, ui ) {
    			var findFlag = false;
    			if (ui.item != null && ui.item.value) {
    				$('#' + elementId).css('background-color','#bfeffb');
    				findFlag = true;
    			} else {
    				$('#' + elementId).css('background-color','white');
    			}
    			
    			$('#' + elementId).attr('isMatchItem', findFlag);
    			
                if (!findFlag && changeNotFoundfunc && typeof(changeNotFoundfunc) == 'function') {
                	if (changeNotFoundfunc()) {
                		$('#' + elementId).css('background-color','#bfeffb');
                		$('#' + elementId).attr('isMatchItem', true);
                	}
                }
    		},
    		select: function( event, ui ) {
    			if(ui.item.value) {
    				$('#' + elementId).css('background-color','#bfeffb');
    				$('#' + elementId).attr('isMatchItem', true);
    			} else {
    				$('#' + elementId).css('background-color','white');
    				$('#' + elementId).attr('isMatchItem', false);
    			}
    		},
    		classes: {
    		    'ui-autocomplete': 'highlight'
    		}
    	});
    	
//    	$("#test1").bind('mouseenter', function () { // bind(이벤트 타입, 실행시킬 함수)
//			$(this).css({"background":"black", "color":"white"}); 
// 
//    	$('#' + elementId).bind(
    }
}

