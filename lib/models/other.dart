// import 'package:orel_test/models/common%20_model.dart';
//
// class ApiResponses<CommonModel> {
//   Status? status;
//   CommonModel? data;
//   String? message;
//
//   ApiResponses(this.status,this.data,this.message, {required bool success});
//
//   ApiResponses.loading(this.message) : status = Status.LOADING;
//   ApiResponses.completed(this.data) : status = Status.COMPLETED;
//   ApiResponses.error(this.message) : status = Status.ERROR;
//
//   ApiResponses.fromJson(x);
//
//   @override
//   String toString() {
//     return "Status : $status \n Message : $message \n Data : $data";
//   }
// }
//
// class ResponseList<T> {
//   Status? status;
//   List<T>? data;
//   String? message;
//
//   ResponseList.loading(this.message) : status = Status.LOADING;
//   ResponseList.completed(this.data) : status = Status.COMPLETED;
//   ResponseList.error(this.message) : status = Status.ERROR;
//
//   ResponseList.fromJson(x);
//
//   @override
//   String toString() {
//     return "Status : $status \n Message : $message \n Data : $data";
//   }
// }
//
// class ResponseNestedList<T> {
//   Status? status;
//   List<List<T>>? data;
//   String? message;
//
//   ResponseNestedList.loading(this.message) : status = Status.LOADING;
//   ResponseNestedList.completed(this.data) : status = Status.COMPLETED;
//   ResponseNestedList.error(this.message) : status = Status.ERROR;
//
//   ResponseNestedList.fromJson(x);
//
//   @override
//   String toString() {
//     return "Status : $status \n Message : $message \n Data : $data";
//   }
// }
//
// enum Status { LOADING, COMPLETED, ERROR }
//
//
