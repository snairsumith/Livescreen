$(document).ready(function() {
	//Sidebar Accordion Menu:
		
		$('#main-nav li').has('ul').find('>a').prepend('<i class="icon-chevron-down"></i>');
		$("#main-nav li ul, #main-nav li ul ul").hide(); // Hide all sub menus
		$("#main-nav li a.nav-top-item.current").parent().find(">ul").slideToggle("slow", function(){
			$("#main-nav li a.nav-top-item.current").siblings("ul").find("li a.current").parent().find("ul").slideToggle("slow");
		}); // Slide down the current menu item's sub menu
		
		$("#main-nav li a.nav-top-item, #main-nav li li a").mouseover( // When a top menu item is clicked...
			function () {
				$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
				$(this).next().slideDown("normal"); // Slide down the clicked sub menu
				return false;
			}
		);
		
		$("#main-nav li a.no-submenu").click( // When a menu item with no sub menu is clicked...
			function () {
				window.location.href=(this.href); // Just open the link instead of a sub menu
				return false;
			}
		); 	
});

$(window).load(function() {

});
