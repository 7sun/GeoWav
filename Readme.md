#Geomancy

[geowav.herokuapp.com](https://geowav.herokuapp.com/)

A music discovery platform for finding popular new music around the globe.

Built with HTML5, CSS3, AngularJS, Ruby on Rails, Soundcloud API, Twitter API, WebGL API, Rspec, and Icomoon.

###Versions
* Ruby 2.2.0
* Rails 4.2.0

###Database
* PostgreSQL

###Details

Users can choose a city to explore by selecting a marker on the globe. When the city is selected, the application builds a playlist with the top 7 artists based in that city.

Two queries are made to the Soundcloud API. First, the application requests the most popular artists in the location by number of followers. The second query requests the most recent track by each of the top artists.

These results are stored in our database to speed up subsequent requests and the Soundcloud API is only hit again after a specific time interval to ensure the latest results are provided.

When an track is selected from the playlist, the audio will begin playing and a request will be made to the Twitter API to find the most recent tweets made that include a hashtag of the artist. This list is presented on the right side column.

Tweets are also stored in the database to speed up performance and the Twitter API is only called after a spe







