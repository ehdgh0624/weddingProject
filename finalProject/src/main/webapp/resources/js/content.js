/* *******************************************************
 * filename : content.js
 * description : 웨딩계산기 JS
 * date : 2019-07-08
******************************************************** */

$(document).ready(function(){
	/* *********************** 웨딩 계산기  ************************ */
	/*$('.simulator-select-group-list').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		arrows: true,
		fade: false,
		dots:false,
		autoplay: true,
		speed:800,
		infinite:false,
		autoplaySpeed: 3000,
		easing: 'easeInOutQuint',
		pauseOnHover:false,
		//prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Prev" tabindex="0" role="button"><i class="material-icons">&#xE314;</i></button>',
		//nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><i class="material-icons">&#xE315;</i></button>',
	});*/
	
	
	
	
	/* *********************** 웨딩 계산기 :: 장바구니  ************************ */
	var $menuOpenBtn = $(".cart-sideBar .cart-sideBar-btn");
	var $cartSideBar = $(".cart-sideBar-container");
	var menuState = false;
	
	$menuOpenBtn.click(function  () {
		if ( menuState ) {
			menuClose();
			menuState = false;
			$(this).removeClass("active");
		}else {
			menuOpen();
			menuState = true;
			$(this).addClass("active");
		}
		return false;
	});

	/* 메뉴열기 */ 
	function menuOpen () {
		$cartSideBar.addClass("open");
	}
	/* 메뉴닫기 */ 
	function menuClose () {
		$cartSideBar.removeClass("open");
	}
	
	
});