$(document).ready(function(){
    //상단으로 바로가기 버튼 클릭
    $('.to_top a').smoothScroll();
    // 모바일용 메뉴 보이기/숨기기 액션처리
	$('.openMOgnb').click(function(){
		// alert('메뉴보이기 액션클릭');
		// $('.header_cont').css('display','block');
		$('.header_cont').slideDown("slow");
		$("#header").addClass("on");
	});
	$('.closePop').click(function(){
		// $('.header_cont').css('display','none');
		$('.header_cont').slideUp("fast");
		$("#header").removeClass("on");
	});
});

//PC용 서브메뉴가 사라지는 액션(아래)
//첫번째대메뉴 서브메뉴 .gnb_depth2_1 마우스 롤아웃 상태처리
var isOver1 = false; //대메뉴1이 false 일때 서브메뉴가 사라지는 조건
var isOverSub1 = false; //서브메뉴 1번이 false 일때 서브메뉴가 사라지는 조건
//1번 서브메뉴를 숨기는 함수(아래)
function goHide1() {
	if(!isOver1 && !isOverSub1) { //2개변수값이 false일때 구현조건이 됩니다
        //jQuery는 뒤에서 앞으로 해석(영어와 같은)
		$('.gnb_depth2_1').stop().fadeOut('fast');
		//대메뉴 중 1번의 2차 .gnb_depth2_1 영역
	}
}
//두번째대메뉴 서브메뉴 .gnb_depth2_2 마우스 롤아웃 상태처리
var isOver2 = false; //대메뉴 2번이 false 일때 서브메뉴가 사라지는 조건
var isOverSub2 = false; //서브메뉴 2번이 false일때 서브메뉴가 사라지는 조건
//1번 서브메뉴를 숨기는 함수(아래)
function goHide2() {
	if(!isOver2 && !isOverSub2) {
		$('.gnb_depth2_2').stop().fadeOut('fast');
	}
}
//pc용 서브메뉴가 나타나는 액션 만들기(아래)
$(document).ready(function(){
	//대메뉴1액션
	$('.openAll1').mouseover(function(){
		if( parseInt($('header').css('width')) >=1049){
			$('.gnb_depth2_1').stop().fadeIn('fast'); //서브메뉴 1번 나타나게 처리
		}
		isOver1 = true; //false 일때 숨기는 조건 <-> true 일때 나타나는 조건
	});
	$('.openAll1').mouseout(function(){
		isOver1 = false;
		setTimeout('goHide1()',200); //기본은 goHide() 이것만 하면되는데 mouseout 이벤트 놓치면 안되기 때문에 setTimeout사용
	});
	//서브메뉴1 액션
	$('.gnb_depth2_1').mouseover(function(){
		isOverSub1 = true; //서브메뉴 1이 계속 나타납니다
	});
	$('.gnb_depth2_1').mouseout(function(){
		isOverSub1 = false; //서브메뉴 1번이 사라집니다
		setTimeout('goHide()',200);
	});
	//대메뉴 2 액션
	$('.openAll2').mouseover(function(){
		if( parseInt($('header').css('width')) >=1049){
			$('.gnb_depth2_2').stop().fadeIn('fast'); //서브메뉴 1번 나타나게 처리
		}
		isOver2 = true; //false 일때 숨기는 조건 <-> true 일때 나타나는 조건
	});
	$('.openAll2').mouseout(function(){
		isOver2 = false;
		setTimeout('goHide2()',200);
	});
	//서브메뉴 2 액션
	$('.gnb_depth2_2').mouseover(function(){
		isOverSub2 = true;
	});
	$('.gnb_depth2_2').mouseout(function(){
		isOverSub2 = false; //서브메뉴 2번이 사라집니다
		setTimeout('goHide2()',200);
	});
});