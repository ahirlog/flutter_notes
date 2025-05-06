// import 'package:flutter_notes/data/network/base_api_service.dart';
// import 'package:flutter_notes/data/network/network_api_service.dart';
// import 'package:flutter_notes/res/app_url.dart';
//
// class AuthRepository {
//   final BaseApiServices _apiServices = NetworkApiService();
//
//   Future<dynamic> loginApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   Future<dynamic> registerApi(dynamic data) async {
//     try {
//       dynamic response = await _apiServices.getPostApiResponse(
//           AppUrl.registerApiEndPoint, data);
//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }
// }
