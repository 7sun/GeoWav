//= require sc-api





var widgetIframe = document.getElementById('sc-widget'),
    widget       = SC.Widget(widgetIframe);

var currentTrack = "";

function nextTrack(){
    document.getElementById("track-" + (currentTrack + 1)).onclick();
}

function playTrack() {
    widget.play();
}

function pauseTrack() {
	widget.pause();
}

function prevTrack() {
	document.getElementById("track-" + (currentTrack - 1)).onclick();
}

function loadTrack(track, index) {
    currentTrack = index;
    document.getElementById("player").currentTrack = index;
	widget.load(track, { auto_play:true });
}

  // (function(){
  //   var widgetIframe = document.getElementById('sc-widget'),
  //       widget       = SC.Widget(widgetIframe);

    // widget.bind(SC.Widget.Events.READY, function() {
    //   widget.bind(SC.Widget.Events.PLAY, function() {
    //     // get information about currently playing sound
    //     widget.getCurrentSound(function(currentSound) {
    //       console.log('sound ' + currentSound.get('') + 'began to play');
    //     });
    //   });
    //   // get current level of volume
    //   widget.getVolume(function(volume) {
    //     console.log('current volume value is ' + volume);
    //   });
    //   // set new volume level
    //   widget.setVolume(50);
    //   // get the value of the current position
    // });

  // }());