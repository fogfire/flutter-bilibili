import 'package:dio/dio.dart';

class HTTPConfig {
  static const baseURL = "https://httpbin.org";
  static const timeout = 5000;
}

class HttpRequest {
  static final BaseOptions options = BaseOptions(
    baseUrl: HTTPConfig.baseURL,
    connectTimeout: HTTPConfig.timeout,
  );
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = 'get',
      Map<String, dynamic> params,
      Interceptor inter}) async {
    // 1.请求的单独配置
    final options = Options(method: method);

    // 2.添加第一个拦截器
    Interceptor dInter =
        InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("拦截了请求");
      return options;
    }, onResponse: (Response response) {
      print("拦截了响应");
      return response;
    }, onError: (DioError error) {
      print("拦截了错误");
      return error;
    });
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
