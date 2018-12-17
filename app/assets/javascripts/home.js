$(function(){
	resize();
	//genGallery();
	setHeaderPos();
	toAnchor();
	$(window).scroll(function () {
		setHeaderPos();
	});
	circleGallery();
	/*$(".marker").click(function() {
		togglePlaceDescHolder(this);
	});*/
	setInputs();
	//initNavActive();
});

function setHeaderPos() {
	$("#header").css("left", -$(window).scrollLeft());
}

function toAnchor(){
	$(".navigation").find("a").click(function(event) {
		event.preventDefault();
		var id  = $(this).attr('href');
		var height = $(id).offset().top - 110;
		$('body,html').animate({scrollTop: height}, 700);
		$(".navigation").find("li.active").removeClass("active");
		$(this).parent().addClass("active");
	});
}

function initNavActive() {
	var links = $(".navigation").find("a");
	var bodyScroll = $('body').scrollTop();
	for (var i = 0; i < links.length; i++) {
		var id  = $(links[i]).attr('href');
		if (bodyScroll === ($(id).offset().top - 110)) {
			$(links[i]).parent().addClass("active");
			break;
		}
	}
}

function resize() {
	var nodes = $("#waterfall-box").children();
	var imgs = $("#waterfall-box").find("img");
	if (nodes !== undefined && nodes !== null && 
			imgs !== undefined && imgs !== null && nodes.length == imgs.length) {
		for (var i = 0; i < imgs.length; i++) {
			var h = parseInt($(imgs[i]).attr('height')) + 47;
			$(nodes[i]).css('height', h);
		}
	}
}

function genGallery() {
	$(".waterfall-box").waterfall({
		colMinWidth: 240,
		defaultContainerWidth: 1000,
		autoresize: true
	});
}

function circleGallery() {
	var images = $("#circle").find("image");
	var resetImages = function() {
		$(images).css("opacity", "0");
		$(images[0]).css("opacity", "1");
	}
	resetImages();
	var i = 0;
  setInterval(function() {
  	if (i == images.length) { 
		 resetImages();
		 i = 0;
		}
		$(images[i++]).css("opacity", "1");
	}, 3000);
}

function togglePlaceDescHolder(obj) {
	var nextObj = $(obj).next();
	var ifVisible = $(nextObj).css("display") == "block";
	$(".place-desc-holder").css("display", "none");	
	if (ifVisible) {
		$(nextObj).css("display", "none");
	} else {
		$(nextObj).css("display", "block");
	}
}

function setInputs() {
	$("#phone").mask("(999) 999-99-99");
	var datePickerOptions = {
		dateFormat: 'dd/mm/yy',
		dayNames: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
		dayNamesMin: ["Вc", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
		monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
		monthNamesMin: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
		firstDay: 1
	};
	$("#date1").datepicker(datePickerOptions);
	$("#date2").datepicker(datePickerOptions);
}
