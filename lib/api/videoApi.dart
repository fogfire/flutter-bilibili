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
       print(error);
      },
      tag: "getHomeList",
    );
  }
  static getChannels(Function success, Function error) {
    HttpManager().get(
      url: "/home/channel",
      successCallback: success,
      errorCallback: error,
      tag: "getChannel",
    );
  }
}