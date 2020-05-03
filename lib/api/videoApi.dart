import 'request.dart';

class VideoApi {
  static getHomeList(){
    return HttpRequest.request("/get", params: {"name": "why", 'age': 18}).then((res) {
      print(res);
      return res;
    }).catchError(() {
      print('request error');
      return null;
    });
  }
}