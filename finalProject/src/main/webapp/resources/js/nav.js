/* *******************************************************
 * filename : nav.js
 * description : header, nav 관련 JS
 * date : 2019-05-22
******************************************************** */

$(document).ready(function(){
	
	/* Header, Nav */
	var $gnb = $("#gnb");
	var $gnbList = $("#gnb > ul");
	var $gnb_dep1 = $("#gnb > ul > li");
	var $gnb_dep2 = $("#gnb > ul > li .gnb-2dep");
	
	//gnb_total_on();
	gnb_each_on();
	
	//gnb 전체메뉴
	function gnb_total_on(){
		$gnbList.children("li").children("a").on("mouseenter focus",function(){
			if($gnb_dep2.css('display') == 'none'){
				$gnb_dep2.stop().slideDown("fast");
				$gnb.find("#gnbBg").stop().slideDown("fast");
			}
		});
		
		$gnbList.on("mouseleave",gnb_return);
		$gnbList.find("a").last().on("focusout",gnb_return);
		
		function gnb_return(){
			if($gnb_dep2.css('display') == 'block'){
				$gnb_dep2.stop().slideUp("fast");
				$gnb.find("#gnbBg").stop().slideUp("fast");
			}
		}
	}
	
	// gnb 각각메뉴
	function gnb_each_on () {
		$gnbList.children("li").children("a").on("mouseenter focus",function  () {
			$gnbList.children("li").removeClass("on").children(".gnb-2dep").hide();
			$(this).parent("li").addClass("on").children(".gnb-2dep").stop().slideDown(300);
		})
		
		$gnbList.on("mouseleave",gnb_return);
		$gnbList.find("a").last().on("focusout",gnb_return);
		
		function gnb_return () {
			$gnbList.children("li").removeClass("on").children(".gnb-2dep").hide();
		}
	}
	
	//MyPage
	$(".header-util-box > li.mypage").children("a").click(function(){
		$(this).siblings(".mypage-box").toggleClass("show");
	});
	
});