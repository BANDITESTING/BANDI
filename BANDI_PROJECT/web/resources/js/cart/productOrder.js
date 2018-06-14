$(function() {
	
	var chkTotal = 0;
	var keyTotal = parseInt($('#priceTotal').text().replace(",", ""));
	var bookList = "";
	var quanList = "";

	$('.bookImg').each(function(index, item) {
	
		bookList += $(this).parent().siblings('#bookUID').val() + ",";
		quanList += $(this).parent().parent().siblings().find('.bookQuan').text() + ",";
		
	});
		
	// 장바구니로 돌아가는 기능
	$('#returnBtn').on('click', function() {
		
		location.href="/BANDI/cart.ct";
		
	});
	
	// 주소 찾기 기능
	$('#addrSearch').on('click', function() {
		var width = 500;
	    var height = 500;
	
	    new daum.Postcode({
	        oncomplete: function(data) {
	           	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	
	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;
	
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('#stamp').val(data.zonecode); //5자리 새우편번호 사용
	                
	            $('#addr1').val(fullAddr);
	
	            // 커서를 상세주소 필드로 이동한다.
	            $('#addr2').focus();
	        }
	       
	    }).open({
	        left: (window.screen.width / 2) - (width / 2),
	        top: (window.screen.height / 2) - (height / 2)
	    });
	});
	
	// 배송 방법 체크 시 배송비 계산 기능
	$('.delivery').on('change', function() {

		chkTotal = parseInt($('#priceTotal').text().replace(",", ""));
		
		if (bookTotal > 30000) {
			
			if ($(this).val() == 'foreign') {
				
				$('#deliveryTotal').text("3,000");
				$('#priceTotal').text((chkTotal + 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#payTotal').text((chkTotal + 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				keyTotal = chkTotal + 3000;
				
			} else {
				
				$('#deliveryTotal').text("0");
				if (chkTotal == (bookTotal + 3000)) {
					
					$('#priceTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#payTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					keyTotal = chkTotal - 3000;
					
				} else if (chkTotal == (bookTotal - allPoint + 3000)) {
					
					$('#priceTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#payTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					keyTotal = chkTotal - 3000;
					
				} else {
					
					$('#priceTotal').text(chkTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#payTotal').text(chkTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					keyTotal = chkTotal;
				
				}
				
			}
			
		} else {
			
			if ($(this).val() == 'foreign') {
				
				$('#deliveryTotal').text("5,500");
				$('#priceTotal').text((chkTotal + 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#payTotal').text((chkTotal + 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				keyTotal = chkTotal + 3000;
				
			} else {
				
				$('#deliveryTotal').text("2,500");
				if (chkTotal == (bookTotal + 5500)) {
					
					$('#priceTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#payTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					keyTotal = chkTotal - 3000;
					
				} else if (chkTotal == (bookTotal - allPoint + 5500)) {
					
					$('#priceTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#payTotal').text((chkTotal - 3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					keyTotal = chkTotal - 3000;
					
				} else {
					
					$('#priceTotal').text(chkTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$('#payTotal').text(chkTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					keyTotal = chkTotal;
				
				}
				
			}
			
		}
		
	});
	
	// 배송지 선택 시 테이블 변화 기능
	$('.addr').on("change", function() {

		if ($(this).val() == "basicUser") {
			
			$('.basicUserTB').css("display", "table-row-group");
			$('.newUserTB').css("display", "none");
			$('#memD').prop("checked", true);
			
		} else {
			
			$('.newUserTB').css("display", "table-row-group");
			$('.basicUserTB').css("display", "none");
			$('#newD_new').prop("checked", true);
			
		}
		
	});
	
	// 포인트 사용 -> 모두 사용 체크 시 기능
	$('#pointAll').on('click', function() {
		
		chkTotal = parseInt($('#priceTotal').text().replace(",", ""));
		
		if ($(this).prop("checked") == true) {
			
			if ($('#pointT').val() == "") {

				$('#pointT').val(allPoint);
				$('#discount').text(allPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#priceTotal').text((chkTotal - allPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#payTotal').text((chkTotal - allPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				
			} else {

				$('#pointT').val(allPoint);
				$('#discount').text(allPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#priceTotal').text((keyTotal - allPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#payTotal').text((keyTotal - allPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				
			}
		} else {
			
			$('#pointT').val("");
			$('#discount').text("0");
			$('#priceTotal').text((chkTotal + allPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$('#payTotal').text((chkTotal + allPoint).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			
		}
		
	});
	
	// 사용 포인트 직접 입력 기능
	$('#pointT').on('keyup', function() {
		
		var point = parseInt($('#pointT').val());
		
		if (point < allPoint) {		// 보유 포인트보다 큰 포인트를 사용하지 못하게 막는 부분

			if ($('#pointT').val() != "") {

				$('#priceTotal').text((keyTotal - point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('#discount').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				
			} else {

				$('#discount').text("0");
				$('#priceTotal').text(keyTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				
			}
			
		} else {
			
			alert("보유 포인트보다 많이 사용할 수 없습니다.");
			$('#pointT').val(allPoint);
			$('#pointAll').prop("checked", true);
			
		}
		
		$('#payTotal').text($('#priceTotal').text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
	});
	
	// 결제 완료 기능 (order table에 담을 데이터 전달 기능)
	$('#payBtn').on('click', function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp16979355'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// 주문 결제 기능
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
	        pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '반디책방',
		    amount : $('#payTotal').text().replace(",", ""),
//		    amount : 200,
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : tel,
		    buyer_addr : address,
	        buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        changePage();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}); 
	
	function changePage() {
		var userData = "";
		var usePoint = $('#discount').text().replace(",", "");
		var deliveryPay = $('#deliveryTotal').text().replace(",", "");
		var orderTotal = $("#orderTotal").text().replace(",", "");
		var priceTotal = $("#priceTotal").text().replace(",", "");
				
		if ($('#newD').prop("checked") == true || $('#newD_new').prop("checked") == true) {
			
			userData += ($('#nameText').val()
					+ "," + $('#userPh1').val() + "-" + $('#userPh2').val() + "-" + $('#userPh3').val()
					+ "," + $('#stamp').val() + " " + $('#addr1').val() + " " + $('#addr2').val());
			
		} else {
			
			userData = "0";
			
		}
		
		location.href = "/BANDI/complete.ct?bookList=" + bookList + "&quanList=" + quanList + "&userData=" + userData + "&usePoint=" + usePoint
						+ "&deliveryPay=" + deliveryPay + "&orderTotal=" + orderTotal + "&priceTotal=" + priceTotal;
	}
	
});
