$(document).ready(function() {

	progress = '.progress .bar';

	var Section = function(elem, progress, elem_progress) {
		this.elem = elem;
		this.elem_progress = elem_progress;
		this.progress = progress;
		this.updatePadding = function() {
			console.log("UPDATING PADDING");
			var windowHeight = $(window).height();
			var section_padding = (windowHeight - $(this.elem).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
			$(this.elem).css({'padding-top':section_padding,'padding-bottom':section_padding});
		}
		this.updateProgress = function() {
			$(this.elem_progress).css('width', this.progress);
		}
		this.hide = function() {
			$(this.elem).hide();
		}
		this.show = function() {
			$(this.elem).show();
			this.updatePadding();
			this.updateProgress();
		}
	}

	sectionOne = new Section("#section-one", '0%', progress);
	sectionTwo = new Section('#section-two', '25%', progress);
	sectionThree = new Section('#section-three', '50%', progress);
	sectionFour = new Section('#section-four', '75%', progress);
	sectionFive = new Section('#section-five', '100%', progress);

	$(window).resize(function() {
		$.each([sectionOne, sectionTwo, sectionThree, sectionFour, sectionFive], function()  {
			this.updatePadding();
		});
	});
	$(window).resize();


	function showSectionOne() {
		sectionOne.show();
		sectionTwo.hide();
		sectionThree.hide();
		sectionFour.hide();
		sectionFive.hide();
	}

	function showSectionTwo() {
		sectionOne.hide();
		sectionTwo.show();
		sectionThree.hide();
		sectionFour.hide();
		sectionFive.hide();
	}

	function showSectionThree() {
		sectionOne.hide();
		sectionTwo.hide();
		sectionThree.show();
		sectionFour.hide();
		sectionFive.hide();
	}

	function showSectionFour() {
		sectionOne.hide();
		sectionTwo.hide();
		sectionThree.hide();
		sectionFour.show();
		sectionFive.hide();
	}

	function showSectionFive() {
		sectionOne.hide();
		sectionTwo.hide();
		sectionThree.hide();
		sectionFour.hide();
		sectionFive.show();
	}

	window.onpopstate = function() {
		if(!window.location.hash || window.location.hash == '#sectionOne') {
			showSectionOne();
		} else if (window.location.hash == '#sectionTwo') {
			showSectionTwo();
		} else if (window.location.hash == '#sectionThree') {
			showSectionThree();
		} else if (window.location.hash == '#sectionFour') {
			showSectionFour();
		} else if (window.location.hash == '#sectionFive') {
			showSectionFive();
		}
	};


	/* last section validation. */

	var name = $('#section-five').find('.name');
	var email = $('#section-five').find('.email');
	var tel = $('#section-five').find('.tel');

	$('#section-one input').change(function() {
		name.replaceWith($(this).val());
	});

	$('#section-three #store_email').change(function() {
		email.replaceWith($(this).val());
	});

	$('#section-three #store_phone').change(function() {
		tel.replaceWith($(this).val());
	});

});