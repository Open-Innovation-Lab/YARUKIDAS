// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $( "input:submit", "#container" ).button();
});

$(function() {
	// run the currently selected effect
	function runEffect() {
		// get effect type from 
		var selectedEffect = "blind";

		// most effect types need no options passed by default
		var options = {};
		// some effects have required parameters
		if ( selectedEffect === "scale" ) {
			options = { percent: 0 };
		} else if ( selectedEffect === "size" ) {
			options = { to: { width: 200, height: 60 } };
		}

		// run the effect
		$( "#effect" ).hide( selectedEffect, options, 1000, null );
	};
	
	// set effect from select menu value
	$(document).ready(function() {
		var t = setTimeout(runEffect,2000);
		return false;
	});
  $(function() {
    jmp = new Array(
      "http://www.katsumaweb.com/modules/katsumadiary/",
      "http://www.katsumaweb.com/modules/case/",
      "http://www.katsumaweb.com/modules/logical/");
    img = new Array("/images/bnr01.jpg","/images/bnr02.jpg","/images/bnr03.jpg");
    n = Math.floor(Math.random()*jmp.length);
    $( "#trainer_contents" ).attr("href",jmp[n]).attr("target","_blank");
    $( "#trainer_contents_image" ).attr("src",img[n]);
  });
});
