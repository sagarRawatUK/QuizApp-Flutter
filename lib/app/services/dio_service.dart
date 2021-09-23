import 'package:dio/dio.dart';

class DioService {
  Dio _dio = Dio();
  DioService() {
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          handler.next(e);
        },
        onRequest: (r, handler) {
          print(r.method);
          print(r.path);
          handler.next(r);
        },
        onResponse: (r, handler) {
          print(r.data);
          handler.next(r);
        },
      ),
    );
  }

  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
      // print(response.toString());
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
    return response;
  }
}
