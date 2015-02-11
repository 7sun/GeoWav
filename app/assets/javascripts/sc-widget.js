//= require sc-api





var widgetIframe = document.getElementById('sc-widget'),
    widget       = SC.Widget(widgetIframe);

var playlist = []

function buildPlaylist(track){
    playlist.push(track);
}


// var next_track = "";
// var prev_track = "";

// function getTrack(current, next, prev) {
//     var current_track = "'" + current + "'";
//     next_track = "'" + next + "'";
//     prev_track = "'" + prev + "'";

//     loadTrack(current_track);
}

function nextTrack(){
    if (next_track != ""){
        loadTrack(next_track);
    }
}

function playTrack() {
    widget.play();
}

function pauseTrack() {
	widget.pause();
}

function prevTrack() {
	widget.prev();
}


function loadTrack(track) {

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