import '../utils/http/http_manager.dart';
import '../utils/http/http_error.dart';

class VideoApi {
  static getHomeList(){
    HttpManager().get(
      url: "/app/info",
      params: { "test": "test" },
      successCallback: (data) {
        print('成功');
      },
      errorCallback: (HttpError error) {
       print('失败');
      },
      tag: "tag",
    );
  }
}