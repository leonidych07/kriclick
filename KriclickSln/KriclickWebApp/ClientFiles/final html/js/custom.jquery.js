/*======>>> Jquery categoryFilters Show Hide Box <<======*/
$(document).ready(function() {
	$("#categoryFilters").addClass("in");
});
if (matchMedia('only screen and (max-width: 767px)').matches) {
$(document).ready(function() {
	$("#categoryFilters").removeClass("in");
});
}

/*======>>> Jquery Message Show Hide Box <<======*/
jQuery(document).ready(function(){
	$('#mail_body').addClass('hide-in-mobile');
	$('.user_chat').click(function(){
		$('#mail_titles').addClass('hide-in-mobile');
		$('#mail_body').removeClass('hide-in-mobile');
	});
	$('.go_to_mail').click(function(){
		$('#mail_titles').removeClass('hide-in-mobile');
		$('#mail_body').addClass('hide-in-mobile');
	});
});

/*======>>> Jquery Product Select Box <<======*/
jQuery(window).load(function(){
	jQuery('.selectpicker').selectpicker({
		style: 'btn-info',
		// size: 4
	});
});

/*======>>> Jquery SVG Checkbox <<======*/
(function() {

	function SVGInput( el, options ) {
		this.el = el;
		this.inputEl = this.el.querySelector( 'input' );
		this.init();
	}

	SVGInput.prototype.init = function() {
		this.shapeEl = this.el.querySelector( 'span.morph-shape' );

		var s = Snap( this.shapeEl.querySelector( 'svg' ) );
		this.pathEl = s.select( 'path' );
		this.paths = {
			reset : this.pathEl.attr( 'd' ),
			active : this.shapeEl.getAttribute( 'data-morph-active' )
		};

		this.initEvents();
	};

	SVGInput.prototype.initEvents = function() {
		if( this.inputEl.type === 'checkbox' || this.inputEl.type === 'radio' ) {
			this.el.addEventListener( 'mousedown', this.down.bind(this) );
			this.el.addEventListener( 'touchstart', this.down.bind(this) );

			this.el.addEventListener( 'mouseup', this.up.bind(this) );
			this.el.addEventListener( 'touchend', this.up.bind(this) );

			this.el.addEventListener( 'mouseout', this.up.bind(this) );
		}
		else {
			this.el.addEventListener( 'click', this.toggle.bind(this) );
		}
	};

	SVGInput.prototype.down = function() {
		this.pathEl.stop().animate( { 'path' : this.paths.active }, 150, mina.easein );
	};

	SVGInput.prototype.up = function() {
		this.pathEl.stop().animate( { 'path' : this.paths.reset }, 1000, mina.elastic );
	};

	SVGInput.prototype.toggle = function() {
		var self = this;

		this.pathEl.stop().animate( { 'path' : this.paths.active }, 200, mina.easein, function() {
			self.pathEl.stop().animate( { 'path' : self.paths.reset }, 600, mina.elastic );
		} );
	};

	[].slice.call( document.querySelectorAll( '.input-wrap' ) ).forEach( function( el ) {
		new SVGInput( el );
	} );

})();

/*======>>> Jquery Scroll bar <<======*/
jQuery(document).ready(function(){  
    jQuery('#mail-body-list').rollbar({
    	scroll: 'both',             // add 'vertical', 'horizontal' scrolling or 'both'  
        autoHide: true,             // automatically hide scrollbars if not needed   
        autoHideTime: 'fast',       // time to hide scrollbars  
        lazyCheckScroll: 1000,      // check content size every NN milliseconds  
        blockGlobalScroll: false,   // always prevent global page scroll on mouse wheel  
        contentFilter: '*',         // selector to filter elements that should be added to RollBar  
        sliderSize: '30%',          // % or pixel value for slider size  
        sliderOpacity: 0.5,         // initial opacity for sliders  
        sliderOpacityTime: 200,     // sliders mouse hover time in ms  
        sliderOpacityDelay: 1000,   // delay before opacity change during mouse wheel  
        wheelSpeed: 20,             // content scroll speed on mouse wheel (0 to 100)  
        touchSpeed: 0.3,            // Android/iOS speed multiplier  
        pathPadding: '20px',        // scrollbar path padding   
        keyScroll: 100,             // amount of pixels to scroll when key is pressed  
        scrollTime: 500,            // scroll time (keypress, touch, "rollbar" ) in ms  
        scrollInterval: 15,         // scroll easing interval in ms (~fps)    
        scrollEasing: 'swing',      // any valid easing (default linear)  
        zIndex: 100,                // scrollbars css z-index  
        onscroll: function(){}      // onscroll callback function (DOM,vscroll,hscroll
    });  
});

jQuery(document).ready(function(){  
    jQuery('#chat-body ').rollbar({
    	scroll: 'both',             // add 'vertical', 'horizontal' scrolling or 'both'  
        autoHide: true,             // automatically hide scrollbars if not needed   
        autoHideTime: 'fast',       // time to hide scrollbars  
        lazyCheckScroll: 1000,      // check content size every NN milliseconds  
        blockGlobalScroll: false,   // always prevent global page scroll on mouse wheel  
        contentFilter: '*',         // selector to filter elements that should be added to RollBar  
        sliderSize: '30%',          // % or pixel value for slider size  
        sliderOpacity: 0.5,         // initial opacity for sliders  
        sliderOpacityTime: 200,     // sliders mouse hover time in ms  
        sliderOpacityDelay: 1000,   // delay before opacity change during mouse wheel  
        wheelSpeed: 20,             // content scroll speed on mouse wheel (0 to 100)  
        touchSpeed: 0.3,            // Android/iOS speed multiplier  
        pathPadding: '20px',        // scrollbar path padding   
        keyScroll: 100,             // amount of pixels to scroll when key is pressed  
        scrollTime: 500,            // scroll time (keypress, touch, "rollbar" ) in ms  
        scrollInterval: 15,         // scroll easing interval in ms (~fps)    
        scrollEasing: 'swing',      // any valid easing (default linear)  
        zIndex: 100,                // scrollbars css z-index  
        onscroll: function(){}      // onscroll callback function (DOM,vscroll,hscroll
    });  
});

jQuery(document).ready(function(){  
    jQuery('#pan-holder-left-scroll').rollbar({
    	scroll: 'both',             // add 'vertical', 'horizontal' scrolling or 'both'  
        autoHide: true,             // automatically hide scrollbars if not needed   
        autoHideTime: 'fast',       // time to hide scrollbars  
        lazyCheckScroll: 1000,      // check content size every NN milliseconds  
        blockGlobalScroll: false,   // always prevent global page scroll on mouse wheel  
        contentFilter: '*',         // selector to filter elements that should be added to RollBar  
        sliderSize: '30%',          // % or pixel value for slider size  
        sliderOpacity: 0.5,         // initial opacity for sliders  
        sliderOpacityTime: 200,     // sliders mouse hover time in ms  
        sliderOpacityDelay: 1000,   // delay before opacity change during mouse wheel  
        wheelSpeed: 20,             // content scroll speed on mouse wheel (0 to 100)  
        touchSpeed: 0.3,            // Android/iOS speed multiplier  
        pathPadding: '20px',        // scrollbar path padding   
        keyScroll: 100,             // amount of pixels to scroll when key is pressed  
        scrollTime: 500,            // scroll time (keypress, touch, "rollbar" ) in ms  
        scrollInterval: 15,         // scroll easing interval in ms (~fps)    
        scrollEasing: 'swing',      // any valid easing (default linear)  
        zIndex: 100,                // scrollbars css z-index  
        onscroll: function(){}      // onscroll callback function (DOM,vscroll,hscroll
    });  
});

jQuery(document).ready(function(){  
    jQuery('#scroll-box').rollbar({
    	scroll: 'both',             // add 'vertical', 'horizontal' scrolling or 'both'  
        autoHide: true,             // automatically hide scrollbars if not needed   
        autoHideTime: 'fast',       // time to hide scrollbars  
        lazyCheckScroll: 1,      // check content size every NN milliseconds  
        blockGlobalScroll: false,   // always prevent global page scroll on mouse wheel  
        contentFilter: '*',         // selector to filter elements that should be added to RollBar  
        sliderSize: '40%',          // % or pixel value for slider size  
        sliderOpacity: 0.5,         // initial opacity for sliders  
        sliderOpacityTime: 200,     // sliders mouse hover time in ms  
        sliderOpacityDelay: 1000,   // delay before opacity change during mouse wheel  
        wheelSpeed: 20,             // content scroll speed on mouse wheel (0 to 100)  
        touchSpeed: 0.3,            // Android/iOS speed multiplier  
        pathPadding: '7px',        // scrollbar path padding   
        keyScroll: 100,             // amount of pixels to scroll when key is pressed  
        scrollTime: 500,            // scroll time (keypress, touch, "rollbar" ) in ms  
        scrollInterval: 15,         // scroll easing interval in ms (~fps)    
        scrollEasing: 'swing',      // any valid easing (default linear)  
        zIndex: 100,                // scrollbars css z-index  
        onscroll: function(){}      // onscroll callback function (DOM,vscroll,hscroll
    });  
});

/*======>>> Jquery Window Div heigh with window height for class of .mail-body-list <<======*/
jQuery(window).resize(function() {
    //jQuery('.mail-body-list').height(jQuery(window).height() - 470);
});

jQuery(window).trigger('resize');


/*======>>> Jquery Window Div heigh with window height for class of .chat-body <<======*/
jQuery(window).resize(function() {
    //jQuery('.chat-body').height(jQuery(window).height() - 600);
});

jQuery(window).trigger('resize');

/*======>>> Jquery Window Div heigh with window height for class of .mypost-table-scroll <<======*/
jQuery(window).resize(function() {
    //jQuery('.mypost-table-scroll').height(jQuery(window).height() - 480);
});

jQuery(window).trigger('resize');


/*======>>> Jquery Window Div heigh with window height for class of .mypost-table-scroll <<======*/
jQuery(window).resize(function() {
    //jQuery('.mybiling-table-scroll').height(jQuery(window).height() - 420);
});

jQuery(window).trigger('resize');

/*======>>> Jquery Tooltip <<======*/
jQuery(document).ready(function(){
    jQuery('[data-toggle="tooltip"]').tooltip(); 
});

/*======>>> Jquery Display Jquery Product Gallery  <<======*/
/* -------- standard-listing.html & real-estate.html -------- */
jQuery(document).ready(function($) {
	if (jQuery("#body-panel").hasClass("page-one")) {
		jQuery('.slider_loading').show();
		jQuery('#carousel').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			itemWidth: 145,
			itemMargin: 5,
			asNavFor: '#slider'
		});
	 
		jQuery('#slider').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			sync: "#carousel",
			start: function(){
				jQuery('.slider_loading').hide();
				jQuery('.listing-gallery-holder').removeClass("loading"); 
			},
		});
	}else{
		return false;
	}
});

/* -------- coupon-detail.html -------- */
jQuery(document).ready(function($) {
	if (jQuery("#body-panel").hasClass("coupon-detail")) {
		jQuery('.slider_loading').show();
		jQuery('#carousel').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			itemWidth: 101,
			itemMargin: 5,
			asNavFor: '#slider'
		});
	 
		jQuery('#slider').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			sync: "#carousel",
			start: function(){
				jQuery('.slider_loading').hide();
				jQuery('.listing-gallery-holder').removeClass("loading"); 
			},
		});
	}else{
		return false;
	}
});

/*======>>> Jquery Datetimepicker <<======*/
jQuery(function () {
    jQuery('.flexslider').flexslider({
	  start: function(slider) {
	    jQuery.flexloader(slider, { 'picturefill': true });
	  },
	  after: function(slider) {
	    jQuery.flexloader(slider, { 'picturefill': true });
	  }
	});
});

/*======>>> Jquery Datetimepicker <<======*/
jQuery(function () {
    jQuery('#datetimepicker').datetimepicker({
        icons: {
            time: "fa fa-clock-o",
            date: "fa fa-calendar",
            up: "fa fa-arrow-up",
            down: "fa fa-arrow-down"
        }
    });
});

/*======>>> Jquery Product Comment Slider <<======*/
jQuery(window).load(function(){
	jQuery("table.mypost-table  tbody tr td span.option-cog").click(function(){
		var handler = jQuery(this);
		var target = handler.next(".option-toggle");
		if (target.hasClass("opened")) {
			target.addClass("opened").animate({height: "toggle"},200);
		}else{
			target.removeClass("opened").animate({height: "toggle"},200);
		}
		return false;
	});
});

jQuery(document).ready(function(){  
    jQuery('#mypost-table-scroll').rollbar({
    	scroll: 'both',             // add 'vertical', 'horizontal' scrolling or 'both'  
        autoHide: true,             // automatically hide scrollbars if not needed   
        autoHideTime: 'fast',       // time to hide scrollbars  
        lazyCheckScroll: 1000,      // check content size every NN milliseconds  
        blockGlobalScroll: false,   // always prevent global page scroll on mouse wheel  
        contentFilter: '*',         // selector to filter elements that should be added to RollBar  
        sliderSize: '30%',          // % or pixel value for slider size  
        sliderOpacity: 0.5,         // initial opacity for sliders  
        sliderOpacityTime: 200,     // sliders mouse hover time in ms  
        sliderOpacityDelay: 1000,   // delay before opacity change during mouse wheel  
        wheelSpeed: 20,             // content scroll speed on mouse wheel (0 to 100)  
        touchSpeed: 0.3,            // Android/iOS speed multiplier  
        pathPadding: '20px',        // scrollbar path padding   
        keyScroll: 100,             // amount of pixels to scroll when key is pressed  
        scrollTime: 500,            // scroll time (keypress, touch, "rollbar" ) in ms  
        scrollInterval: 15,         // scroll easing interval in ms (~fps)    
        scrollEasing: 'swing',      // any valid easing (default linear)  
        zIndex: 100,                // scrollbars css z-index  
        onscroll: function(){}      // onscroll callback function (DOM,vscroll,hscroll
    });  
});

/*======>>> Jquery Product Comment Slider <<======*/
jQuery(window).load(function(){
	jQuery("table.coupon-table  tbody tr td span.option-cog").click(function(){
		var handler = jQuery(this);
		var target = handler.next(".option-toggle");
		if (target.hasClass("opened")) {
			target.addClass("opened").animate({height: "toggle"},200);
		}else{
			target.removeClass("opened").animate({height: "toggle"},200);
		}
		return false;
	});
});

/*======>>> posted by angle-down ▼ menu <<======*/
jQuery(window).load(function(){
	jQuery(".posted-by-menu span.option-cog").click(function(){
		var handler = jQuery(this);
		var target = handler.next(".option-toggle");
		if (target.hasClass("opened")) {
			target.addClass("opened").animate({height: "toggle"},200);
		}else{
			target.removeClass("opened").animate({height: "toggle"},200);
		}
		return false;
	});
	
	jQuery(".body-panel").click(function(){
		jQuery(".option-toggle").removeClass("opened").animate({height: "hide"},200);
	});
	
	$('.info-btn a').on('click',function(){
		if ($('#collapseExampleMd, #collapseExampleSm').hasClass('in')){
			$('.info-btn a').text('Show Info');
		}else{
			$('.info-btn a').text('Hide Info');
		}
	});
});

/*======>>> Jquery Search products view <<======*/
jQuery(document).ready(function(){
	jQuery("#list-view").css("opacity","0.3");
	jQuery("#list-view").click(function(e){
		e.preventDefault();
		var allResultItems = jQuery(".search-result-box #s-result-list");
		if (allResultItems.hasClass("col-sm-8")) {
			allResultItems.removeClass("col-sm-8");
			allResultItems.addClass("col-sm-24 search-result-list clearfix");
			allResultItems.children("a").find("span.rate-info").css("display","none");
			allResultItems.children("div.slide-info").find("span.rate-info").css("display","inline-block");
			jQuery("#thumbnail-view").css("opacity","0.3");
			jQuery("#list-view").css("opacity","1");
		}else{
			return false;
		}
	});

	jQuery("#thumbnail-view").click(function(e){
		e.preventDefault();
		var allResultItems = jQuery(".search-result-box #s-result-list");
		if (allResultItems.hasClass("col-sm-24 search-result-list clearfix")) {
			allResultItems.removeClass("col-sm-24 search-result-list clearfix");
			allResultItems.addClass("col-sm-8");
			allResultItems.children("a").find("span.rate-info").css("display","block");
			allResultItems.children("div.slide-info").find("span.rate-info").css("display","none");
			jQuery("#thumbnail-view").css("opacity","1");
			jQuery("#list-view").css("opacity","0.3");
		}else{
			return false;
		}
	});
});

/*======>>> Jquery Search products view <<======*/
jQuery(document).ready(function(){
	jQuery("a#widget-toggle").click(function(e){
		e.preventDefault();
		jQuery(this).next("div.widget-toggle-box").slideToggle("fast");
	});
});

/*======>>> Jquery Product Comment Slider <<======*/
jQuery(window).load(function(){
	if (jQuery('body').hasClass('home')) {
		jQuery('.home-page-slider ul.carousel-slider').slick({
			dots: false,
			infinite: true,
			slidesToShow: 4,
			arrows: true,
			slidesToScroll: 1,
			autoplay: true,
			autoplaySpeed: 5000,
			responsive: [
				{
					breakpoint: 767,
					settings: {
					slidesToShow: 1,
					dots: true,
					arrows: false,
					}
				}
			]
		});
		
	}else{
		return false;
	}
});

/*======>>> Jquery Stiky On Scroll <<======*/
// Initialize editor with custom theme and modules
var fullEditor = new Quill('#full-editor', {
  modules: {
    'authorship': { authorId: 'galadriel', enabled: true },
    'multi-cursor': true,
    'toolbar': { container: '#full-toolbar' },
    'link-tooltip': true
  },
  theme: 'snow'
});

// Add basic editor's author
var authorship = fullEditor.getModule('authorship');
authorship.addAuthor('gandalf', 'rgba(255,153,51,0.4)');

// Add a cursor to represent basic editor's cursor
var cursorManager = fullEditor.getModule('multi-cursor');
//cursorManager.setCursor('gandalf', fullEditor.getLength()-1, 'Gandalf', 'rgba(255,153,51,0.9)');

// Sync basic editor's cursor location
basicEditor.on('selection-change', function(range) {
  if (range) {
    cursorManager.moveCursor('gandalf', range.end);
  }
});

// Update basic editor's content with ours
fullEditor.on('text-change', function(delta, source) {
  if (source === 'user') {
    basicEditor.updateContents(delta);
  }
});

// basicEditor needs authorship module to accept changes from fullEditor's authorship module
basicEditor.addModule('authorship', {
  authorId: 'gandalf',
  color: 'rgba(255,153,51,0.4)'
});

// Update our content with basic editor's
basicEditor.on('text-change', function(delta, source) {
  if (source === 'user') {
    fullEditor.updateContents(delta);
  }
});

/*======>>> Jquery Lightbox <<======*/
jQuery(document).ready(function() {
	jQuery(".various").fancybox({
		maxWidth	: 500,
		maxHeight	: 450,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
});
