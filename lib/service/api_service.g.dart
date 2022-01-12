// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.greetingsworld.uk/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginUser> login(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginUser>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/login.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Category> getCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Category>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/cat.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Category.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
