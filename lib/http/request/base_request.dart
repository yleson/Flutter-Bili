/// 请求方法
enum HttpMethod {
  Get,
  Post,
  Delete
}


/// 基础请求
abstract class BaseRequest {
  /// 域名
  String domain() {
    return "api.devio.org";
  }
  /// 请求方法
  HttpMethod httpMethod();
  /// 短路径
  String path();
  /// 参数
  Map<String, dynamic> params = Map();
  /// 头部参数
  Map<String, dynamic> headers = Map();
  /// 是否需要拦截登录
  bool needLogin();

  /// 添加请求体参数
  BaseRequest add(String key, Object value) {
    params[key] = value.toString();
    return this;
  }
  /// 添加请求头参数
  BaseRequest addHeaders(String key, Object value) {
    headers[key] = value.toString();
    return this;
  }


  /// 是否使用https
  var useHttps = true;

  String url() {
    Uri uri;
    if (useHttps) {
      uri = Uri.https(domain(), path(), params);
    } else {
      uri = Uri.http(domain(), path(), params);
    }
    return uri.toString();
  }
}