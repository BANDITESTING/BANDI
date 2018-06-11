$(function() {
		
	$(function () {$('#cancle').change(function() {
	        if ($(this).children("option:selected").text() == "기타") {
	            $('#writeText').attr("disabled", false);
	        } else {
	            $('#writeText').val("").attr("disabled", true);
	        }
	    });
	});
	
	// 주문 상세보기 버튼 기능
	$('.detailBtn').on('click', function() {
		
		location.href = "/BANDI/check.ct";
		
	});
	
	// 주문 취소 버튼 기능
	$('.cancleBtn').on('click', function() {
		
		var orderUID = "";
		var bookUID = "";
		var canclePrice = $('#canclePrice').text().replace(",", "");
		
		$('.orderUID').each(function(index, item) {
			
			orderUID = $(this).val();
			bookUID += $(this).siblings('.bookUID').val() + ",";
						
		});
		
		location.href = "/BANDI/canclecomplete.ct?orderUID=" + orderUID + "&bookUID=" + bookUID + "&canclePrice=" + canclePrice;
		
	});
	
});