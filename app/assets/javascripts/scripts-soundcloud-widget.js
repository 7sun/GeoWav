//= require soundcloud-widget-api


var widgetIframe = document.getElementById('sc-widget'),
    widget       = SC.Widget(widgetIframe);

var track = "http://api.soundcloud.com/tracks/33427584?client_id=15356ad1b6d2b2a0b14b715797d57550";

function playSound() {
    widget.play();
}

function pauseSound() {
	widget.pause();
}

function prevSound() {
	widget.prev();
}

function nextSound() {
	widget.next();
}

function loadSound(track) {
	widget.load(track);
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