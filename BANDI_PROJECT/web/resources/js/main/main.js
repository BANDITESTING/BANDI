
	  $(document).ready(function(){
	      // Activate Carousel
	      $("#myCarousel").carousel();
	      
	      // Enable Carousel Indicators
	      $(".item1").click(function(){
	          $("#myCarousel").carousel(0);
	      });
	      $(".item2").click(function(){
	          $("#myCarousel").carousel(1);
	      });
	      $(".item3").click(function(){
	          $("#myCarousel").carousel(2);
	      });
	      $(".item4").click(function(){
	          $("#myCarousel").carousel(3);
	      });
	      
	      // Enable Carousel Controls
	      $(".left").click(function(){
	          $("#myCarousel").carousel("prev");
	      });
	      $(".right").click(function(){
	          $("#myCarousel").carousel("next");
	      });
	  });

  	
	
  		$('.TAGbutton').click(function(e){
  			console.log(e);
  		});

  	

    jQuery(document).ready(function($) {
      $('.loop').owlCarousel({
        center: false,
        items: 2,
        loop: true,
        margin: 40,
        autoplay:true,
        autoplayTimeout: 2000,
        autoplayHoverPause:true,
        responsive:{
          
          100 : {
            items : 1
          },

          400 : {
            items : 2
          },

          600: {
            items : 3
          },
          
          1100: {
            items: 5
          }, 
        }
      }); 

       $('.loop1').owlCarousel({
        center: false,
        items: 1,
        loop: true,
        margin: 40,
        autoplay:true,
        autoplayTimeout: 5000,
        autoplayHoverPause:true,
        responsive: {
          600: {
            items: 1
          }, 
        }
      });   
    });
    
    var owl = $('#bandirecommend');

    owl.on('mousewheel', '.owl-stage', function (e) {
        if (e.deltaY>0) {
            owl.trigger('next.owl');
        } else {
            owl.trigger('prev.owl');
        }
        e.preventDefault();
    });
    
    
    // Move to Here All Main Js
    
    var CONTEXTPATH = "/BANDI";
    
    $(function(){
		$('#urLiterary').addClass('thick1Ck');
		$('#bsLiterary').addClass('thick1Ck');
	});
	
	// Best Seller Menu Button [bestSellBtn(id)]
	function bestSellBtn(id)
	{
		var getUserTag;

		switch(id)
		{
			case "bsLiterary": getUserTag = 'A'; break;
			case "bsEdu": getUserTag = 'E'; break;
			case "bsHobby": getUserTag = 'D'; break;
			case "bsHuman": getUserTag = 'B'; break;
			case "bsSociety": getUserTag = 'F'; break;
			case "bsScience": getUserTag = 'C'; break;
			default :
				getUserTag ='A';
		}
		
		bestSellerClickedStateBtn(getUserTag);
		
		$.ajax({
			url: CONTEXTPATH+"/bestSeller.get",
			type : "POST",
			data:{"category" : getUserTag},
			datatype:"json",
			success: function(data) 
			{
				changeBestSellData(data);
			},
			error: function(request,status,error)
			{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function changeBestSellData(data)
	{	
		/* Half Array 1 ~ 4 Before  */	
		$('.sellerDiv1').each(function(inx){
			// Image
			var ins = CONTEXTPATH+'/resources/bookimage/' +
			data[inx].mImagePath;
			$(this).find('img').attr('src', ins);
			
			// Title
			var subStitle = data[inx].mTitle;
			if(subStitle.length > 15)
				subStitle =  subStitle.substr(0, 9)+"..";
			$(this).find('.TypeOf_Span').text(subStitle);
			
			// Price
			$(this).find('.TAG_SPAN_PRICE_TEXT').text(data[inx].mPrice +  "원");
			
			// href
			var location = CONTEXTPATH+'/detail.show?ISBN='+data[inx].mISBN;
			$(this).find('a').attr('href', location);
		});
		
		/* Half Array 5 ~ 8 After  */	
		$('.sellerDiv2').each(function(inx){
			// Image CONTEXTPATH+"/resources/bookimage/" "?${RANDOM_STRING}"
			var ins = CONTEXTPATH+"/resources/bookimage/" +
			data[inx + 4].mImagePath;
			$(this).find('img').attr('src', ins);
			
			// Title
			var subStitle = data[inx + 4].mTitle;
			if(subStitle.length > 15)
				subStitle =  subStitle.substr(0, 9)+"..";
			$(this).find('.TypeOf_Span').text(subStitle);
			
			// Price
			$(this).find('.TAG_SPAN_PRICE_TEXT').text(data[inx + 4].mPrice +  "원");
			
			// href
			var location = CONTEXTPATH+'/detail.show?ISBN='+data[inx+4].mISBN;
			$(this).find('a').attr('href', location);
		});
		
		
	}

	// User Recommend Menu Button [userRecBtn(id)]
	function userRecBtn(id)
	{
		var getUserTag;
		switch(id)
		{
			case "urLiterary": getUserTag = 'A'; break;
			case "urEdu": getUserTag = 'E'; break;
			case "urHobby": getUserTag = 'D'; break;
			case "urHuman": getUserTag = 'B'; break;
			case "urSociety": getUserTag = 'F'; break;
			case "urScience": getUserTag = 'C'; break;
			default :
				getUserTag ='A';
		}
		/* Remeber Clicked User Recommended Button */
		userClickedStateBtn(getUserTag);
		
		$.ajax({
			url: CONTEXTPATH+"/UserRecommend.get",
			type : "POST",
			data:{"category" : getUserTag},
			datatype:"json",
			success: function(data) 
			{
				changeUserData(data);
			},
			error: function(request,status,error)
			{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	/* Save State clicked Button */
	function userClickedStateBtn(tag)
	{
		$urLiterary = $('#urLiterary');
		$urEdu      = $('#urEdu');
		$urHobby    = $('#urHobby');
		$urHuman    = $('#urHuman');
		$urSociety  = $('#urSociety');
		$urScience  = $('#urScience');
		
		if($urLiterary.hasClass('thick1Ck') == true) $urLiterary.removeClass('thick1Ck');
		if($urHuman.hasClass('thick4Ck') == true) $urHuman.removeClass('thick4Ck');
		if($urScience.hasClass('thick6Ck') == true) $urScience.removeClass('thick6Ck');
		if($urEdu.hasClass('thick2Ck') == true) $urEdu.removeClass('thick2Ck');
		if($urHobby.hasClass('thick3Ck') == true) $urHobby.removeClass('thick3Ck');
		if($urSociety.hasClass('thick5Ck') == true) $urSociety.removeClass('thick5Ck');
		
		switch(tag)
		{
			case 'A': $urLiterary.addClass('thick1Ck'); break;
			case 'B': $urHuman.addClass('thick4Ck'); break;
			case 'C': $urScience.addClass('thick6Ck'); break;
			case 'D': $urHobby.addClass('thick3Ck'); break;
			case 'E': $urEdu.addClass('thick2Ck'); break;
			case 'F': $urSociety.addClass('thick5Ck'); break;
		}
	}
	
	/* Save State clicked Button */
	function bestSellerClickedStateBtn(tag)
	{
		$urLiterary = $('#bsLiterary');
		$urEdu      = $('#bsEdu');
		$urHobby    = $('#bsHobby');
		$urHuman    = $('#bsHuman');
		$urSociety  = $('#bsSociety');
		$urScience  = $('#bsScience');
		
		if($urLiterary.hasClass('thick1Ck') == true) $urLiterary.removeClass('thick1Ck');
		if($urHuman.hasClass('thick4Ck') == true) $urHuman.removeClass('thick4Ck');
		if($urScience.hasClass('thick6Ck') == true) $urScience.removeClass('thick6Ck');
		if($urEdu.hasClass('thick2Ck') == true) $urEdu.removeClass('thick2Ck');
		if($urHobby.hasClass('thick3Ck') == true) $urHobby.removeClass('thick3Ck');
		if($urSociety.hasClass('thick5Ck') == true) $urSociety.removeClass('thick5Ck');
		
		switch(tag)
		{
			case 'A': $urLiterary.addClass('thick1Ck'); break;
			case 'B': $urHuman.addClass('thick4Ck'); break;
			case 'C': $urScience.addClass('thick6Ck'); break;
			case 'D': $urHobby.addClass('thick3Ck'); break;
			case 'E': $urEdu.addClass('thick2Ck'); break;
			case 'F': $urSociety.addClass('thick5Ck'); break;
		}
	}

	function changeUserData(data)
	{
		/* Setting User Item. */
		var imgPath = CONTEXTPATH+"/resources/bookimage/" + data[0].mImagePath;
		$('#recUserImg').attr('src', imgPath);
		$('#recUserImg').attr('name',data[0].mISBN);
		
		var userTitle = data[0].mTitle;
		if(userTitle.length > 23) userTitle = userTitle.substr(0.20)+ "...";
		$('#recUserTitle').text(userTitle);
		
		$('#recUserWriter').text("["+data[0].writerName+"]");
		$('#recUserPrice').text(data[0].mPrice + "원");

		$('#recAvgPoint').text(data[0].avgPoint);
		$('.starRate').remove();

		for(var i = 0; i < 10 - data[0].avgPoint; i = i+2)
			$('#startDiv').prepend('<span class="fa fa-star unchecked starRate"></span>');

		for(var i = 0; i < data[0].avgPoint; i= i+2)
			$('#startDiv').prepend('<span class="fa fa-star checked starRate"></span>');
			
		var commentMaxLength = 29;
		$('.comment_id').each(function(index){
			var email = data[1][index].eMail;
			email = email.split('@');
			// Email Min Length 3 and Max 20.
			var dot= "";
			for(var j = 1; j < email[0].length/2; j++) dot += "*";
			
			email[0] = email[0].substr(0, email[0].length/2 + 1) + dot;
			
			var comment = data[1][index].comment_Content;
			if(comment.length > commentMaxLength) comment = comment.substr(0,commentMaxLength-3) + "...";
			$(this).text(email[0] + ": " + comment);
		});

		$('.comment_comment_date').each(function(index){
			$(this).text(data[1][index].writedDate);
		});
		
	}
	
	
	// Carousel Book Image, When you click Image, Move to Detail View.
	function imageEvent(e)
	{
		window.location.href = CONTEXTPATH+"/detail.show?ISBN="+$(e).attr('id');
	}
