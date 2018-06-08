$(function() {
	
	if (flag == 0) {
		
		$('#fail').css("display", "block");
		$('#success').css("display", "none");
		
	} else if (flag == 2) {
		
		$('#fail').css("display", "block");
		$('#success').css("display", "none");
		alert("장바구니 정보 삭제 실패. (관리자에게 문의 바랍니다)");
		
	} else if (flag == 3) {
		
		$('#fail').css("display", "block");
		$('#success').css("display", "none");
		alert("사용자 포인트 갱신 실패. (관리자에게 문의 바랍니다)");
		
	}
	
	// 쇼핑 계속하기 버튼 기능
	$('.shoppingBtn').on('click', function() {
		
		location.href = "/BANDI/views/main/Main.jsp";
		
	});
	
	// 장바구니 버튼 기능
	$('.cartBtn').on('click', function() {
		
		location.href = "/BANDI/cart.ct";
		
	});
	
	// 주문 상세보기 버튼 기능
	$('#detailBtn').ob('click', function() {
		
		location.href = "/BANDI/check.ct";
		
	});
		
});
