$(function() {
		
	// 쇼핑 계속하기 버튼 기능
	$('.shoppingBtn').on('click', function() {
		
		location.href = "/BANDI/views/main/Main.jsp";
		
	});
	
	// 장바구니 버튼 기능
	$('.cartBtn').on('click', function() {
		
		location.href = "/BANDI/cart.ct";
		
	});
	
	// 주문 상세보기 버튼 기능
	$('.detailBtn').on('click', function() {
		
		location.href = "/BANDI/check.ct";
		
	});
		
});
