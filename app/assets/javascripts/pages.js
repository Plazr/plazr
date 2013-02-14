$(document).ready(function() {

	var Section = function(elem) {
		this.elem = elem;
		this.updatePadding = function() {
			var windowHeight = $(window).height();
			var section_padding = (windowHeight - $(this.elem).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
			$(this.elem).css({'padding-top':section_padding,'padding-bottom':section_padding});
		}
	}

	if($('.wrap-center-container').length) {
		sectionOne = new Section('.wrap-center-container');
		$(window).resize(function() {
			$.each([sectionOne], function()  {
				this.updatePadding();
			});
		});
		$(window).resize();
	}


});