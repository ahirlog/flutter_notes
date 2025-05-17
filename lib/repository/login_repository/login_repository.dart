import 'package:flutter_notes/data/network/network_api_service.dart';
import 'package:flutter_notes/res/url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    dynamic response =
        await _apiService.getPostApiResponse(AppUrl.loginEndPoint, data);
    return response;
  }
}
