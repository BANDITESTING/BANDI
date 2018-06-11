$(function() {
	
	// 전체 선택 기능	
	$('.chkAll').on('change',function(){
		
		console.log("Test");
		
		if($(this).prop("checked") == true) {
			
			$(this).parent().parent().siblings().children().find('.chk').prop("checked", true);
			console.log("true");
	    
		} else {
			
	    	$(this).parent().parent().siblings().children().find('.chk').prop("checked", false);
	    	console.log("false");
	    	
		}
		
	});
	
	// 개별 선택 기능 (전체 체크가 아닐 시 전체 체크 지우기)
	$('.chk').on('change', function() {
		
		if ($(this).prop("checked") == false) {
			
			$(this).parent().parent().siblings().children().find('.chkAll').prop("checked", false);

		}
		
	});
		
	// 쇼핑 계속하기 버튼 기능
	$('.shoppingBtn').on('click', function() {
		
		location.href = "/BANDI/views/main/Main.jsp";
		
	});
	
	// 주문 전체 취소 버튼
	$('.allCancleBtn').on('click', function() {
		$(this).parent().parent().siblings('.deliveryData').children().find('.tdChk').find('.chk').each(function(index, item) {
			
			$(this).prop("checked", true);
		});
		
		cancleBook(this);
	});
	
	// 주문 선택 취소 버튼
	$('.cancleBtn').on('click', function() {
		
		cancleBook(this);
		
	});
	
	function cancleBook(num) {
		
		var bookUID = "";
		var orderUID;
		var price;
		
		$(num).parent().parent().siblings('.deliveryData').children().find('.tdChk').find('.chk').each(function(index, item) {
			
			if ($(this).prop("checked") == true) {
				bookUID += $(this).parent().siblings().find('.bookUID').val() + ",";
			}
			
		});
		
		orderUID = $(num).parent().parent().siblings('.deliveryData').children().find('.orderTh').find('.order_UID').text();
		price = $(num).parent().parent().siblings('.priceTable').children().find('.priceTd').find('.finalPrice').text().replace(",", "");
		
		location.href = "/BANDI/cancle.ct?orderUID=" + orderUID + "&bookUID=" + bookUID + "&canclePrice=" + price;
		
	}
	
});