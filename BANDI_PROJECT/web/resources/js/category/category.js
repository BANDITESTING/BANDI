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
                  items: 3
                }, 
              }
            }); 

            
          });