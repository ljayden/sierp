var PER_PAGE = 10;
var ajaxRequests = {}

function getSiGunGuTypeSearch(sigunguId) {
	if ($('#sido').val() == '') {
		$('#' + sigunguId + ' option').remove();
    	$('#' + sigunguId).append('<option value=""> - </option>');
    	
	} else {
		
		COMMON.ajax({
		    url : '/common/getSiGunGu.json',
		    data : JSON.stringify({ sido : $('#sido').val()}),
		    successHandler : function(data){
		    	$('#' + sigunguId +'  option').remove();
		    	$('#' + sigunguId).append('<option value="">전체</option>')
		    	$(data.result).each(function(i, sigungu) {
		    		$('#' + sigunguId).append('<option value="' + sigungu.code + '">' + sigungu.description + '</option>')
		    	});
		    }
		});
	}
}

function getSiGunGuTypeReg(sigunguId) {
	if ($('#sido').val() == '') {
		$('#' + sigunguId + ' option').remove();
    	$('#' + sigunguId).append('<option value="">시/도를 선택해 주세요.</option>');
    	
	} else {
		
		COMMON.ajax({
		    url : '/common/getSiGunGu.json',
		    data : JSON.stringify({ sido : $('#sido').val()}),
		    successHandler : function(data){
		    	$('#' + sigunguId +'  option').remove();
		    	$('#' + sigunguId).append('<option value="">시/군/구</option>')
		    	$(data.result).each(function(i, sigungu) {
		    		$('#' + sigunguId).append('<option value="' + sigungu.code + '">' + sigungu.description + '</option>')
		    	});
		    }
		});
	}
}

var COMMON = {
 

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
    calendar: function (calendarIdOrOjc, datePickerOptionParam, timePickerOptionParam) {
        var result = {};

        var timePickerOption = {
            showMeridian: false,
            defaultHour: 0,
            defaultMinute: 0,
            minuteStep: 5
        }

        var datePickerOption = {
            element: null,
            dateForm: 'yyyy-mm-dd',
            pos: {
                top: 34,
                left: 1
            }
        };


        if (timePickerOptionParam) {
            $.each(timePickerOptionParam, function (name, val) {
                timePickerOption[name] = val;
            });

            result.timePicker = new tui.component.TimePicker(timePickerOption);
            datePickerOption.timePicker = result.timePicker;
        }

        if (datePickerOptionParam) {
            $.each(datePickerOptionParam, function (name, val) {
                datePickerOption[name] = val;
            });

            if (datePickerOption.element) {
                var $el = $(datePickerOption.element);
                if ($el && $el.val().length > 7) {
                    var dateArr = $el.val().split("-");
                    var startDate = new Date(dateArr[0], dateArr[1] - 1, dateArr[2]);

                    datePickerOption.date = {
                        year: startDate.getFullYear(),
                        month: startDate.getMonth() + 1,
                        date: startDate.getDate()
                    }
                }
            } else {
                //에러
            }
        }

        result.calendar = new tui.component.Calendar({
            element: calendarIdOrOjc,
            titleFormat: "yyyy-mm", //설정될 title의 형식
            yearTitleFormat: "yyyy"
            //bDrawOnload : true //로딩과 동시에 바로 그릴것인지 여부
        });
        result.calendar.draw();


        result.datePicker = new tui.component.DatePicker(datePickerOption, result.calendar);


        $(calendarIdOrOjc).on('click', function (event) {
            var $el = $(event.target);

            if ($el.hasClass('selectable')) {
                result.datePicker.close();
            }
        });

        $(datePickerOption.element).click(function () {
            $('.sel').removeClass('on');
        });

        $(datePickerOption.openers[0]).click(function () {
            $('.sel').removeClass('on');
        });

        return result;
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

    autoCompleteInput : function(elementId, sourceList, func) {
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
    			
    			$('#' + elementId).attr('matchItem', findFlag);
                if (func && typeof(func) == 'function') {
                	func(findFlag);
                }
    		},
    		select: function( event, ui ) {
    			if(ui.item.value) {
    				$('#' + elementId).css('background-color','#bfeffb');
    				$('#' + elementId).attr('matchItem', true);
    			} else {
    				$('#' + elementId).css('background-color','white');
    				$('#' + elementId).attr('matchItem', false);
    			}
    		},
    		classes: {
    		    'ui-autocomplete': 'highlight'
    		}
    	});
    }
}

