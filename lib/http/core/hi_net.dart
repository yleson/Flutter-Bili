import 'package:bili_demo/http/request/base_request.dart';

class HiNet {
  HiNet._();
  static HiNet? _instance;

  static HiNet? getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async {
    var response = await send(request);
    var result = response["data"];
    print("HiNet -- result: ${result}");
    return result;
  }
  
  Future<dynamic> send<T>(BaseRequest request) async {
    print("HiNet -- url: ${request.url()}");
    print("HiNet -- method: ${request.httpMethod()}");

    request.addHeaders("token", "FM2mkfaKRkrkam4");
    print("HiNet -- headers: ${request.headers}");

    return Future.value({"statusCode": 200, "data": {"code": 0, "message": "success"}});
  }
}