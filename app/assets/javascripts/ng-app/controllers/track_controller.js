angular
	.module("GloboApp")
	.controller("trackController", trackController);

	function trackController($scope, $http, $resource){
		// var self = this;
		$scope.getTracks = getTracks;
		$scope.loadTrack = loadTrack;

		$scope.currentTrack = "";
		var widgetIframe = document.getElementById('sc-widget'),
    widget       = SC.Widget(widgetIframe);

		function getTracks(city){
			console.log("clicked");
			$http.get('playlist/' + city)
			.success(function(data){
				$scope.tracks = data;
				console.log(data);
			})
		}

		function loadTrack(track, index) {
		    currentTrack = index;
				widget.load(track, { auto_play:true });
				console.log(currentTrack);
		}

		function nextTrack(){
			var track = $scope.tracks[currentTrack + 1];
			widget.load(track, { auto_play:true });
		}

		function playTrack() {
		    widget.play();
		}

		function pauseTrack() {
			widget.pause();
		}

		// function prevTrack() {
		// 	document.getElementById("track-" + (currentTrack - 1)).onclick();
		// }

// function loadTrack(track, index) {
//     currentTrack = index;
//     document.getElementById("player").currentTrack = index;
// 	widget.load(track, { auto_play:true });
// }

}