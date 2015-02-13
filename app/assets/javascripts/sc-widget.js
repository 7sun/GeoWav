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
