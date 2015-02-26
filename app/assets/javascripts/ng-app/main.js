angular
  .module("GloboApp", ['ngResource'])
  .config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      $('meta[name=csrf-token]').attr('content');
  }])
  .controller("trackController", ['$scope', '$http', '$resource', function($scope, $http, $resource){
	$scope.getTracks = getTracks;
	$scope.loadTrack = loadTrack;
	$scope.nextTrack = nextTrack;
	$scope.prevTrack = prevTrack;
	$scope.playTrack = playTrack;
	$scope.pauseTrack = pauseTrack;
	$scope.getTweets = getTweets;
	$scope.currentTrackIndex = "";
	$scope.currentTrack = "";
	$scope.showPlayer = false;
	$scope.showPlaylist = false;
	$scope.show = true;
	// $scope.showTwitterFeed = false;

// Sets variables for Soundcloud Iframe Player
	var widgetIframe = document.getElementById('sc-widget'),
  widget       = SC.Widget(widgetIframe);

  $(document).on('click', '[data-city-name]', function(e){
  	city = $(e.currentTarget).attr('data-city-name')

  	getTracks(city);
  	showPlaylist();
  })

// Shows the city playlist
  function showPlaylist(){
  	$('#playlist').removeClass('hidden')
	}

// Gets tracks to populate playlist
	function getTracks(city){
		$http.get('playlist/' + city)
		.success(function(data){
			$scope.tracks = data.slice(0,7);
		})
	}

// Loads the track that is clicked in the playlist into the music player
	function loadTrack(index){
	    $scope.currentTrackIndex = index;
	    $scope.currentTrack = $scope.tracks[index]
	    var trackUri = $scope.tracks[index].uri
	    $scope.artworkUrl = $scope.currentTrack.artwork_url
	    // .replace("large", "t300x300");
			widget.load(trackUri, { auto_play: true });
	}

// Loads the next track in the playlist with the next track icon is clicked
	function nextTrack(){
		$scope.currentTrack = $scope.tracks[$scope.currentTrackIndex + 1]
		var trackUri = $scope.tracks[$scope.currentTrackIndex + 1].uri;
		widget.load(trackUri, { auto_play: true });
		$scope.currentTrackIndex = $scope.currentTrackIndex + 1;
		$scope.artworkUrl = $scope.currentTrack.artwork_url
		// .replace("large", "t300x300");
	}

// Loads the previous track in the playlist with the next track icon is clicked
	function prevTrack(){
		$scope.currentTrack = $scope.tracks[$scope.currentTrackIndex - 1]
		var trackUri = $scope.tracks[$scope.currentTrackIndex - 1].uri;
		widget.load(trackUri, { auto_play: true });
		$scope.currentTrackIndex = $scope.currentTrackIndex - 1;
		$scope.artworkUrl = $scope.currentTrack.artwork_url
		// .replace("large", "t300x300");
	}

	function playTrack(){
	    widget.play();
	}

	function pauseTrack(){
		widget.pause();
	}

// Plays next track in the playlist once current track finishes
	widget.bind(SC.Widget.Events.FINISH, function(eventData){
		console.log("Track finished! Playing next track.");
		nextTrack();
   });

// Gets tweets about the artist of the current track that is playing
	function getTweets(artist){
		console.log("getting tweets!");
		// $scope.showTwitterFeed = true;
		$http.get('/tweets/' + artist)
		.success(function(data){
			$scope.tweets = data;
		})
	}
}]);

