import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class ApiService extends http.BaseClient {
  http.Client _httpClient;

  String _baseApiUrl;
  String get baseApiUrl => _baseApiUrl;

  Map<String, dynamic> defaultHeaders;

  ApiService({
    @required String baseApiUrl,
    @required http.Client httpClient,
    this.defaultHeaders = const {},
  })  : _baseApiUrl = baseApiUrl,
        _httpClient = httpClient;

  @override
  void close() => _httpClient.close();

  @override
  Future<http.Response> delete(url, {Map<String, String> headers}) => _httpClient.delete(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
      );

  @override
  Future<http.Response> get(url, {Map<String, String> headers}) => _httpClient.get(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
      );

  @override
  Future<http.Response> head(url, {Map<String, String> headers}) =>
      _httpClient.head('$baseApiUrl$url', headers: _mergeHeaders(headers));

  @override
  Future<http.Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) => _httpClient.patch(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
        body: body,
        encoding: encoding,
      );

  @override
  Future<http.Response> post(url, {Map<String, String> headers, body, Encoding encoding}) => _httpClient.post(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
        body: body,
        encoding: encoding,
      );

  @override
  Future<http.Response> put(url, {Map<String, String> headers, body, Encoding encoding}) => _httpClient.put(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
        body: body,
        encoding: encoding,
      );

  @override
  Future<String> read(url, {Map<String, String> headers}) => _httpClient.read(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
      );

  @override
  Future<Uint8List> readBytes(url, {Map<String, String> headers}) => _httpClient.readBytes(
        '$baseApiUrl$url',
        headers: _mergeHeaders(headers),
      );

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) => _httpClient.send(request);

  Map<String, String> _mergeHeaders(Map<String, String> headers) => {...?defaultHeaders, ...?headers};
}
