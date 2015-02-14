angular
  .module("GloboApp", ['ngResource', 'ui.bootstrap'])
  .config(function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      $('meta[name=csrf-token]').attr('content');
  })
