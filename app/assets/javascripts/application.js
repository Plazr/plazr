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


	$(sectionTwo).hide();
	$(sectionThree).hide();
	$(sectionFour).hide();

	$(sectionOne).find('button').click(function() {
		$(sectionOne).fadeOut();
		$(sectionTwo).fadeIn();
		$(progress).width('60%');
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