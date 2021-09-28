import 'package:http/http.dart' as http;

class CurrentRequest {
  final http.Client client;

  static CurrentRequest? _instance;

  factory CurrentRequest.createObject() =>
      _instance ??= CurrentRequest.createObject();

  CurrentRequest(this.client);

  http.MultipartRequest _request(Uri uri, RMethod method) {
    return http.MultipartRequest(
        (method == RMethod.GET)
            ? 'GET'
            : (method == RMethod.POST)
                ? 'POST'
                : 'DELETE',
        uri);
  }

  Future<http.Response> postRequest(
    String url, {

    /// requested data
    Map<String, String>? data,

    /// requested headers
    Map<String, String>? headers,

    /// requested file {"key":"path of image"}
    Map<String, String>? file,
  }) async {
    final req = _request(Uri.parse(url), RMethod.POST);
    req.fields.addAll(data!);

    if (file!.isNotEmpty) {
      file.forEach((key, value) async {
        req.files.add(await http.MultipartFile.fromPath(key, value));
      });
    }

    if (headers!.isNotEmpty) {
      req.headers.addAll(headers);
    }

    return http.Response.fromStream(await req.send());
  }

  Future<http.Response> getRequest(
    String url, {

    /// requested data
    Map<String, String>? data,

    /// requested headers
    Map<String, String>? headers,

    /// requested file {"key":"path of image"}
    Map<String, String>? file,
  }) async {
    final req = _request(Uri.parse(url), RMethod.GET);

    print(headers);

    req.headers.addAll(headers!);

    return http.Response.fromStream(await req.send());
  }

  Future<http.Response> deleteRequest(
    String url, {

    /// requested data
    Map<String, String>? data,

    /// requested headers
    Map<String, String>? headers,

    /// requested file {"key":"path of image"}
    Map<String, String>? file,
  }) async {
    final req = _request(Uri.parse(url), RMethod.DELETE);

    req.headers.addAll(headers!);

    return http.Response.fromStream(await req.send());
  }
}

enum RMethod { POST, GET, DELETE }
