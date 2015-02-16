	angular
	.module("GloboApp")
	.controller("trackController", trackController);

	function trackController($scope, $http, $resource){
		$scope.getTracks = getTracks;
		$scope.loadTrack = loadTrack;
		$scope.nextTrack = nextTrack;
		$scope.prevTrack = prevTrack;
		$scope.playTrack = playTrack;
		$scope.pauseTrack = pauseTrack;
		$scope.getTweets = getTweets;
		$scope.currentTrackIndex = "";
		$scope.currentTrack = "";
		$scope.showTwitterFeed = false;

		var widgetIframe = document.getElementById('sc-widget'),
    widget       = SC.Widget(widgetIframe);

    $(document).on('click', '[data-city-name]', function(e){
    	city = $(e.currentTarget).attr('data-city-name')
    	console.log(city);
    	getTracks(city);
    })

		function getTracks(city){
			console.log("getting tracks!");
			$http.get('playlist/' + city)
			.success(function(data){
				$scope.tracks = data.slice(0,7);
			})
			console.log($scope.tracks);
		}

		function loadTrack(index) {
		    $scope.currentTrackIndex = index;
		    $scope.currentTrack = $scope.tracks[index]
		    var trackUri = $scope.tracks[index].uri
		    $scope.artworkUrl = $scope.currentTrack.artwork_url
		    // .replace("large", "t300x300");
				widget.load(trackUri, { auto_play: true });
		}

		function nextTrack(){
			$scope.currentTrack = $scope.tracks[$scope.currentTrackIndex + 1]
			var trackUri = $scope.tracks[$scope.currentTrackIndex + 1].uri;
			widget.load(trackUri, { auto_play: true });
			$scope.currentTrackIndex = $scope.currentTrackIndex + 1;
			$scope.artworkUrl = $scope.currentTrack.artwork_url
			// .replace("large", "t300x300");
		}

		function prevTrack() {
			$scope.currentTrack = $scope.tracks[$scope.currentTrackIndex - 1]
			var trackUri = $scope.tracks[$scope.currentTrackIndex - 1].uri;
			widget.load(trackUri, { auto_play: true });
			$scope.currentTrackIndex = $scope.currentTrackIndex - 1;
			$scope.artworkUrl = $scope.currentTrack.artwork_url
			// .replace("large", "t300x300");
		}

		function playTrack() {
		    widget.play();
		}

		function pauseTrack() {
			widget.pause();
		}

		function getTweets(artist){
			console.log("getting tweets!");
			$scope.showTwitterFeed = true;
			$http.get('/tweets/' + artist)
			.success(function(data){
				$scope.tweets = data;
			})
			console.log($scope.tweets);
		}

}

trackController.$inject = ['$scope', '$http'];

