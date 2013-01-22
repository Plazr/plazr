// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require jquery.scrollTo-min
//= require jquery.ba-hashchange.min
//= require_tree .


$(document).ready(function() {

	var sectionOne = '#section-one';
	var sectionTwo = '#section-two';
	var sectionThree = '#section-three';
	var sectionFour = '#section-four';
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
	}

	function showSectionTwo() {
		$(sectionOne).hide();
		$(sectionTwo).show();
		$(sectionThree).hide();
		$(sectionFour).hide();
	}

	function showSectionThree() {
		$(sectionOne).hide();
		$(sectionTwo).hide();
		$(sectionThree).show();
		$(sectionFour).hide();
	}

	function showSectionFour() {
		$(sectionOne).hide();
		$(sectionTwo).hide();
		$(sectionThree).hide();
		$(sectionFour).show();
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
			$(progress).css('width', "33%");
		} else if (window.location.hash == '#sectionThree') {
			showSectionThree();
			$(progress).css('width', "66%");

		} else if (window.location.hash == '#sectionFour') {
			showSectionFour();
			$(progress).css('width', "100%");
		}
	});
	$(window).hashchange();


	var name = $('#section-four').find('.name');
	var email = $('#section-four').find('.email');
	var tel = $('#section-four').find('.tel');

	$('#section-one input').change(function() {
		name.replaceWith($(this).val());
	});

	$('#section-three #store_email').change(function() {
		email.replaceWith($(this).val());
	});

	$('#section-three #store_phone').change(function() {
		tel.replaceWith($(this).val());
	});



	/* Remove the html scroll and create scroll events. */
	// $('div.about-container').removeAttr('id');
	// $('a[href="#headerAboutPlazr"]').click(function() {
	// 	$.scrollTo($('div.about-container'), 500);
	// });
	// $('div.we-container').removeAttr('id');
	// $('a[href="#headerAboutUs"]').click(function() {
	// 	$.scrollTo($('div.we-container'), 500);
	// });
	// $('div.announcement-container').removeAttr('id');
	// $('a[href="#headerAnn"]').click(function() {
	// 	$.scrollTo($('div.announcement-container'), 500);
	// });
});