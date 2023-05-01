
//var app = angular
//          .module("myModule", [])
//          .controller("myController", function ($scope, $http) {
//              $http.post('OrdersDetailService.asmx/GetAllOrdersDetail')
//              .then(function (response) {
//                  alert(response);
//                  alert('test');
//                  $scope.ordersDetailed = response.Data;
//                  alert(response.Data.FactoryRate);
//              });
//          });

var app = angular
       .module("myModule", [])
       .controller("myController", function ($scope, $http) {

           $http.get("OrdersDetailService.asmx/GetAllOrders")
                .then(function (response) {
                    $scope.Orders = response.data;
                });
       });