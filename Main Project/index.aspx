<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
<link href="User/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="User/css/bootstrap.min.css" rel="stylesheet"/>
<!--start slider -->
    <link rel="stylesheet" href="User/css/fwslider.css" media="all">
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script>
    <script src="js/bootsrap.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/classie.js"></script>
<!--end slider -->
<script type="text/javascript" src="js/jquery-hover-effect.js"></script>
<script type="text/javascript">
    //Image Hover
    jQuery(document).ready(function () {
        jQuery(function () {
            jQuery('ul.da-thumbs > li').hoverdir();
        });
    });
</script>
<script>
    function init() {
        window.addEventListener('scroll', function (e) {
            var distanceY = window.pageYOffset || document.documentElement.scrollTop,
                shrinkOn = 200,
                header = document.querySelector("header");
            if (distanceY > shrinkOn) {
                classie.add(header, "smaller");
            } else {
                if (classie.has(header, "smaller")) {
                    classie.remove(header, "smaller");
                }
            }
        });
    }
    window.onload = init();
</script>
<!-- Add fancyBox main JS and CSS files -->
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<link href="User/css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
		    $(document).ready(function () {
		        $('.popup-with-zoom-anim').magnificPopup({
		            type: 'inline',
		            fixedContentPos: false,
		            fixedBgPos: true,
		            overflowY: 'auto',
		            closeBtnInside: true,
		            preloader: false,
		            midClick: true,
		            removalDelay: 300,
		            mainClass: 'my-mfp-zoom-in'
		        });
		    });
		</script>
<!--nav-->
<script>
    $(function () {
        var pull = $('#pull');
        menu = $('nav ul');
        menuHeight = menu.height();

        $(pull).on('click', function (e) {
            e.preventDefault();
            menu.slideToggle();
        });

        $(window).resize(function () {
            var w = $(window).width();
            if (w > 320 && menu.is(':hidden')) {
                menu.removeAttr('style');
            }
        });
    });
</script>

<!-- start top_js_button -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
   <script type="text/javascript">
       jQuery(document).ready(function ($) {
           $(".scroll").click(function (event) {
               event.preventDefault();
               $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
           });
       });
	</script>
    
  
  
</head>
<body>
    <header>
<div class="header_bg navbar-fixed-top">
<div class="wrap">
		<div class="logo" style="width:auto; padding-left:10px">
			<a href="index.html"><img src="images/logo.png" alt="" style="width:20%; height:10%; min-height:25px; min-width:65px"/></a>
			
	<div class="cssmenu" style="padding-right:10px">
		<ul>
		   <li class="active"><a class="scroll" href="#home">Home</a></li>
		   <li><a class="scroll" href="#about">About Us</a></li>
		    <li><a class="scroll" href="#services">Services</a></li>
		   <li><a class="scroll" href="reg1.aspx">Join Us</a></li>
            <li><a class="scroll" href="login.aspx">Login</a></li> 
		   <li><a class="scroll" href="#contact">Contact Us</a></li>   
		   
	      <div class="clear"></div>
	    </ul>
         
	</div>
	<div class="clear"></div>
		<div class="top-nav">
		<nav class="clearfix">
			<ul>
		   <li class="active"><a class="scroll" href="#home">Home</a></li>
		   <li><a class="scroll" href="#about">About Us</a></li>
		    <li><a class="scroll" href="#services">Services</a></li>
		   <li><a class="scroll" href="#join">Join Us</a></li>
		   <li><a class="scroll" href="#contact">Contact Us</a></li>   
		   
	      <div class="clear"></div>
	    </ul>
				<a href="#" id="pull" style="text-align:center; width:90%; font-size:12px">Menu</a>
                 
                 
                 
                 			
		</div>
       
 
	<div class="clear"></div>
	
</div>
</div>
</div>
</header>
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide"> 
                <!-- Slide image -->
                    <img src="images/slider1.jpg">
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">i want to feel What you wanted!</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
                        <p class="description">A super clean and easy to use Modern templates Lorem ipsum dolor sit amet</p>
                        <!-- /Text description -->
                    </div>
                </div>
                 <!-- /Texts container -->
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
                <img src="images/slider2.jpg">
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <h4 class="title">Lorem ipsum dolor sit amet</h4>
                        <p class="description">Pellentesque non neque egestas libero. Nam sed porta est. Vestibulum id massa eu odio rhoncus eleifend.</p>
                    </div>
                </div>
            </div>
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
    </div>
    <div class="wrap">
<div class="main_bg" id="home">
<div class="wrap">
	<div class="grids_1_of_3">
		<div class="grid_1_of_3 images_1_of_3">
			 <img src="images/icon1.png" alt="" />
			 <a href="#"><h3>services</h3></a>
			 <p>The main feature is to be remote accessing of system in online or offline mode. Different types of controlling mechanism is to be used in Live ScreenZ. Feel the difference now with us.</p>
		</div>
		<div class="grid_1_of_3 images_1_of_3">
			<img src="images/icon2.png" alt="" />
			<a href="#"><h3>user profiles</h3></a>
			<p>Registered users can be controll more the one mechine throught with using internet. Users can be chat to registered users if the are in online mode. Also request for assistance.</p>
		</div>
		<div class="grid_1_of_3 images_1_of_3">
			<img src="images/sms21.png" alt="" />
			<a href="#"><h3>get in touch</h3></a>
			<p>In offline mode user can control the mechine using sms fecility. All main security can only be communicated through phone number or email.</p>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<!-- start top_grid -->
<div class="top_grid_bg" id="services">
<div class="wrap">
	<div class="top_grid">
		<div class="top_grid_text">
			<h2>Main Features</h2>
		</div>
		<div class="clear"></div>
		<div class="top_grid_gallery">
			<div class="image_grid portfolio_4col top_grid_portfoli">
				<ul id="list" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery1.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>SHUTDOWN</h3>
							
                              <div id="small-dialog3" class="mfp-hide">
                                 <div class="pop_up">
                                  <h2>Aenean fringilla elementum</h2>
                                    <p>There are many variations of passages of Lorem </p>
                                       </div></div>
                          
                                    <div id="small-dialog4" class="mfp-hide">
                                      <div class="pop_up">
                                        <h2>A Sample Portfolio</h2>
                                        <img src="images/gallery1_zoom.jpg" alt=""/>
                                          </div></div>  
						</article>
					</li>
				</ul>
			</div>
			<div class="image_grid portfolio_4col top_grid_portfoli">
				<ul style="" id="Ul1" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery2.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>RESTART</h3>
							
						</article>
					</li>
				</ul>
			</div>
			<div class="image_grid portfolio_4col top_grid_portfoli">
				<ul style="" id="Ul2" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery3.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>LOGG OFF</h3>
							
						</article>
					</li>
				</ul>
			</div>
			<div class="image_grid portfolio_4col ">
				<ul style="" id="Ul3" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery4.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>LOCK</h3>
							
						</article>
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<div class="top_grid_gallery">
			<div class="image_grid portfolio_4col top_grid_portfoli">
				<ul style="" id="Ul4" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery2.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>FILE SHARING</h3>
							
						</article>
					</li>
				</ul>
			</div>
			<div class="image_grid portfolio_4col top_grid_portfoli">
				<ul style="" id="Ul5" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery5.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>CHAT</h3>
							
						</article>
					</li>
				</ul>
			</div>
			<div class="image_grid portfolio_4col top_grid_portfoli">
				<ul style="" id="Ul6" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery6.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>SMS</h3>
							
						</article>
					</li>
				</ul>
			</div>
			<div class="image_grid portfolio_4col ">
				<ul style="" id="Ul7" class="portfolio_list da-thumbs">
					<li>
						<img src="images/gallery3.jpg" alt="img">
						<article class="da-animate da-slideFromLeft" style="display: block;">
							<h3>SCREEN SHOOTS</h3>
							
						</article>
					</li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>	
</div>
</div>
</div>
<!-- start mid_grid -->
<div class="mid_grid_bg" id="about">
<div class="wrap">
	<div class="mid_grid">
		<div class="mid_grid_left">
			<h2>what about the LiveScreenz?</h2>
			<h4>We developed this site for attaining complete control to your individual or group (lab) of computer systems  lets you quickly shutdown, reboot, log off and also to  retrieve screen shots after a certain period of interval (user defined) by logging into our website. So by this website a person who is having an account can download the recommended software and install for attaining the screen shots. So that the user can attain the knowledge about the system and can be controlled from anywhere in this world. </h4>
		  
		</div>
		<div class="mid_grid_right">
			<img src="images/banner.jpg" alt=""/>
		</div>
		<div class="clear"></div>	
	</div>
</div>
</div>
<!-- start mid_grid -->

<!-- start testimonial  -->

		<!-- end magnific-->
		
<!-- start testimonial  -->
<div class="clients_bg">
<div class="wrap">
	
			
		 <div class="clear"></div>
		</div>
		<div class="tool_tip">
			
		<div class="products_bg">
<div class="wrap">
	<div class="products">
		<div class="products_of_3">
			<div class="product1_of_3" >
				<div class="thumbnail thumbnail-1 tt-sample" style="height:347px">
                <h3>Monitoring</h3>
                <img  src="images/page1-img1.jpg" alt="">
                <section> <strong>Your screen is always under our control</strong>
                <p>so stay tuned to watch your own screenzzzz....</p>
                   <span>Sample</span>  
              </div>
				
			</div>
			<div class="product1_of_3">
				 <div class="thumbnail thumbnail-1" style="height:347px">
                <h3>Access <p> Any Where</h3>
                <img  src="images/page1-img2.jpg" alt="">
                <section> <strong>Dont worry about the place</strong>
                      <p>The choice of getting the control of your system is at your fingertip...</p>
                      
              </div>
			</div>
            <div class="product1_of_3">
				 <div class="thumbnail thumbnail-1" style="height:347px">
                <h3>Control <p> Through Sms</h3>
                <img  src="images/page1-img3.jpg" alt="">
                <section> <strong>Dont worry about your handset model</strong>
                      <p>You can simply attain your goal via sms.... </p>
                      
              </div>
			</div>
			<div class="product1_of_3">
				  <div class="thumbnail thumbnail-1" style="height:347px">
                <h3 class="title-1 extra">Caughted</h3>
                <img  src="images/page1-img4.jpg" alt="">
                <section> <strong>You can lock the hackerzz..</strong>
                      <p>Identify the persons by checking out the screenshots timings or block them by sending sms... </p>
                     
              </div>
			</div>		
			<div class="clear"></div>
		</div>		
	</div>
</div>
</div>
	 </div>
</div>
</div>
    	<div class="clear"></div>
<!-- start testimonial  -->

<!-- start footer_top  -->
<!-- start footer  -->
<div class="footer_bg" id="contact">
<div class="wrap">

		
       
        
		<div class="footer_btm">
   
			<div class="social-icons">
			     <ul>
			        <li><a href="#" target="_blank"> </a></li>
			        <li><a  href="#" target="_blank"></a></li>
			        <li><a  href="#" target="_blank"></a></li>
			        <li><a href="#" target="_blank"></a></li>
			        <li><a href="#" target="_blank"></a></li>
			        <li><a href="#" target="_blank"></a></li>
			        <li><a href="#" target="_blank"> </a></li>
			        <li><a  href="#" target="_blank"></a></li>
			        <li><a  href="#" target="_blank"></a></li>
			        <li><a href="#" target="_blank"></a></li>
			        <li><a href="#" target="_blank"></a></li>
			    	<li><a href="#" target="_blank"></a></li>
				</ul>
			</div>
           
                  <!--scroll_top_btn -->
         <script type="text/javascript">
             $(document).ready(function () {

                 var defaults = {
                     containerID: 'toTop', // fading element id
                     containerHoverID: 'toTopHover', // fading element hover id
                     scrollSpeed: 1200,
                     easingType: 'linear'
                 };


                 $().UItoTop({ easingType: 'easeOutQuart' });

             });
		</script>
		 <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
		<!--end scroll_top_btn -->
            
		<div class="copy">
         <div style="color:#CCCCCC">
        LiveScreenz <br />
        Karimpatta Cross Road, Kochin<br />
        E-mail : Livescreenz@yahoo.in<br />
        Phone : 9539041343<br />
        </div>
			<p class="w3-link">Copyright 2013 LiveScreenz All Right Reserved</a></p>
		</div>
		<div class="clear"></div>
	</div>
	
</div>
</div>


<!---FUNCTIONS--->
 
              
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
