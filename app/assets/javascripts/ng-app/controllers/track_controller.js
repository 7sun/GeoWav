angular
	.module("GloboApp")
	.controller("trackController", trackController);

	function trackController($scope, $http, $resource){
		// var self = this;
		$scope.getTracks = getTracks;
		$scope.loadTrack = loadTrack;
		$scope.nextTrack = nextTrack;
		$scope.prevTrack = prevTrack;
		$scope.playTrack = playTrack;
		$scope.pauseTrack = pauseTrack;
		$scope.currentTrack = "";

		var widgetIframe = document.getElementById('sc-widget'),
    widget       = SC.Widget(widgetIframe);

    $(document).on('click', '[data-city-name]', function(e){
    	console.log($(e.currentTarget).data('city-name'));

    	city = $(e.currentTarget).data('city-name');

    	getTracks(city);
    })

		function getTracks(city){
			console.log("clicked");
			$http.get('playlist/' + city)
			.success(function(data){
				$scope.tracks = data;
				console.log(data);
			})
		}

		function loadTrack(index) {
		    $scope.currentTrack = index;
		    var track = $scope.tracks[index].uri
		    console.log(track);
				widget.load(track, { auto_play:true });
				console.log(currentTrack);
		}

		function nextTrack(){
			var track = $scope.tracks[$scope.currentTrack + 1].uri;
			widget.load(track, { auto_play:true });
			$scope.currentTrack = $scope.currentTrack + 1;
		}

		function playTrack() {
		    widget.play();
		}

		function pauseTrack() {
			widget.pause();
		}

		function prevTrack() {
			var track = $scope.tracks[$scope.currentTrack - 1].uri;
			widget.load(track, { auto_play:true });
			$scope.currentTrack = $scope.currentTrack - 1;
		}

}