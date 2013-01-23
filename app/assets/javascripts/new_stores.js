$(document).ready(function() {

	var sectionOne = '#section-one';
	var sectionTwo = '#section-two';
	var sectionThree = '#section-three';
	var sectionFour = '#section-four';
	var sectionFive = '#section-five';
	var progress = '.progress .bar';

	/* paddings must be set before hiding because hide removes the containers height */
	function setPaddings() {
		var windowHeight = $(window).height();

		var sectionOnePad = (windowHeight - $(sectionOne).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
		$(sectionOne).css({'padding-top':sectionOnePad,'padding-bottom':sectionOnePad})

		var sectionTwoPad = (windowHeight - $(sectionTwo).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
		$(sectionTwo).css({'padding-top':sectionTwoPad,'padding-bottom':sectionTwoPad})

		var sectionThreePad = (windowHeight - $(sectionThree).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
		$(sectionThree).css({'padding-top':sectionThreePad,'padding-bottom':sectionThreePad})

		var sectionFourPad = (windowHeight - $(sectionFour).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
		$(sectionFour).css({'padding-top':sectionFourPad,'padding-bottom':sectionFourPad})

		var sectionFivePad = (windowHeight - $(sectionFive).find('.container').css('height').replace(/[^-\d\.]/g, ''))  / 2;
		$(sectionFive).css({'padding-top':sectionFivePad,'padding-bottom':sectionFivePad})
	}

	setPaddings();
	$(window).resize(function() {
		setPaddings();
	});

	function showSectionOne() {
		$(sectionOne).show();
		$(sectionTwo).hide();
		$(sectionThree).hide();
		$(sectionFour).hide();
		$(sectionFive).hide();
	}

	function showSectionTwo() {
		$(sectionOne).hide();
		$(sectionTwo).show();
		$(sectionThree).hide();
		$(sectionFour).hide();
		$(sectionFive).hide();
	}

	function showSectionThree() {
		$(sectionOne).hide();
		$(sectionTwo).hide();
		$(sectionThree).show();
		$(sectionFour).hide();
		$(sectionFive).hide();
	}

	function showSectionFour() {
		$(sectionOne).hide();
		$(sectionTwo).hide();
		$(sectionThree).hide();
		$(sectionFour).show();
		$(sectionFive).hide();

	}

	function showSectionFive() {
		$(sectionOne).hide();
		$(sectionTwo).hide();
		$(sectionThree).hide();
		$(sectionFour).hide();
		$(sectionFive).show();
	}


	showSectionOne();

	/* reset the hash when page loads. */
	// window.location.hash = '';
	$(window).hashchange(function() {
		if(!window.location.hash || window.location.hash == '#sectionOne') {
			showSectionOne();
			$(progress).css('width', "0%");
		} else if (window.location.hash == '#sectionTwo') {
			showSectionTwo();
			$(progress).css('width', "25%");
		} else if (window.location.hash == '#sectionThree') {
			showSectionThree();
			$(progress).css('width', "50%");

		} else if (window.location.hash == '#sectionFour') {
			showSectionFour();
			$(progress).css('width', "75%");
		} else if (window.location.hash == '#sectionFive') {
			showSectionFive();
			$(progress).css('width', "100%");
		}
	});
	$(window).hashchange();


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