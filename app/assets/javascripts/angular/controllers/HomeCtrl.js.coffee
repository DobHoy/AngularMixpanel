
#   $scope.viewRestaurant = (id) ->
#     $location.url "/restaurants/#{id}" 
# ]

# @restauranteur.controller 'RestaurantShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
#   $http.get("./restaurants/#{$routeParams.id}.json").success((data) ->
#     $scope.restaurant = data
#   )
# ]
@mixpanelApp.controller 'HomeCtrl', ['$scope','$http','$location', ($scope, $http, $location) ->
  $scope.foo = 'bar'
  console.log 'ji'
  $scope.pictures = []
  console.log 'yoG'
  $http.get('./products.json').success((data) ->
    $scope.pictures = data
  )
  # $scope.viewPic = (id) ->
  #   $location.url "/pictures/#{id}" 
  console.log $scope.pictures

]

# @mixpanelApp.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
#   console.log 'kk'
#   $scope.foo = 'bar'
#   $scope.pictures = []
#   console.log 'yoG'
#   $http.get('./products.json').success((data) ->
#     $scope.pictures = data
#   )
#   console.log $scope.pictures

#   $scope.viewPicture = (id) ->
#     $location.url "/products/#{id}" 
# ]

# @mixpanelApp.controller 'HomeCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
#   $http.get("./products/#{$routeParams.id}.json").success((data) ->
#     $scope.picture = data
#     console.log $scope.picture
#   )
# ]