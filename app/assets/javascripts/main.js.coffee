@mixpanelApp = angular.module('mixpanelApp', ['ngRoute'])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
console.log("hello")
@mixpanelApp.config(['$routeProvider', ($routeProvider) ->
  console.log("hellod")
  $routeProvider.
    otherwise({
      templateUrl: '../templates/products/index.html',
      controller: 'HomeCtrl'
    })
])