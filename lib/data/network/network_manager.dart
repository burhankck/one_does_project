import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_does_project/data/model/reflectable_model.dart';
import 'package:one_does_project/data/network/abstract_api_service.dart';
import 'package:one_does_project/data/network/error_handler.dart';
import 'package:one_does_project/data/network/failure.dart';
import 'package:one_does_project/data/network/general_model.dart';
import 'package:reflectable/reflectable.dart';

class NetworkManager extends ApiServices {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;
  NetworkManager._init();
  dynamic responseJson;

  dynamic jsonSerialize(dynamic jsonResponse) => json.decode(jsonResponse);
  //HTTP[GET]
  @override
  Future getApiResponse<T extends GeneralTypeModel>(
    String baseAdress,
    String path, {
    bool isList = false,
  }) async {
    dynamic responseJson;
    var classMirror = reflector.reflectType(T) as ClassMirror;

    String url = baseAdress + path;

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 120));
      responseJson = checkStatus<T>(
        body: response.body,
        statusCode: response.statusCode,
        classMirror: classMirror,
        isList: isList,
      );
    } on SocketException {
      throw Failure(
        ResponseCode.NO_INTERNET_CONNECTION,
        ResponseMessage.NO_INTERNET_CONNECTION,
      );
    } on TimeoutException catch (e) {
      throw Failure("Zaman aşımı hatası", e.toString());
    } on Error catch (e) {
      debugPrint("getApiResponse() method error: $e");
      throw Failure(ResponseCode.UNKNOWN, e.toString());
    }

    return responseJson;
  }

  dynamic checkStatus<T>({
    required int statusCode,
    required String body,
    required bool isList,
    required ClassMirror classMirror,
  }) {
    switch (statusCode) {
      case HttpStatus.ok:
        return isList
            ? jsonToObjectList<T>(classMirror: classMirror, body: body)
            : jsonToObject<T>(classMirror: classMirror, body: body);
      case HttpStatus.created:
        throw DataSource.NO_CONTENT.getFailure();
      case HttpStatus.notFound:
        throw DataSource.NOT_FOUND.getFailure();
      case HttpStatus.badRequest:
        throw DataSource.BAD_REQUEST.getFailure();
      case HttpStatus.unauthorized:
        throw DataSource.UNAUTHORISED.getFailure();
      case HttpStatus.forbidden:
        throw DataSource.FORBIDDEN.getFailure();
      case HttpStatus.internalServerError:
        throw DataSource.INTERNAL_SERVER_ERROR.getFailure();

      default:
        throw DataSource.UNKNOWN.getFailure();
    }
  }

  List<T>? jsonToObjectList<T>({required var classMirror, var body}) {
    body = jsonSerialize(body);
    if (body == null) {
      return null;
    } else {
      var listResponse = <T>[];
      debugPrint(body.runtimeType.toString());
      if (body is List) {
        for (var item in body) {
          _jsonToModel<T>(classMirror, item, listResponse);
        }
      } else {
        while (body is! List) {
          body = jsonSerialize(body);
          if (body is List) {
            body.forEach((item) {
              _jsonToModel<T>(classMirror, item, listResponse);
            });
          }
        }
      }
      return listResponse;
    }
  }

  void _jsonToModel<T>(classMirror, item, List<dynamic> listResponse) {
    T responsChildValue;
    responsChildValue = classMirror.newInstance(_JsonHelper.FROM_JSON, [item]);
    listResponse.add(responsChildValue);
  }

  /// return Model
  T? jsonToObject<T>({required var classMirror, var body}) {
    final Type stringType = String;
    do {
      body = jsonSerialize(body);
    } while (body.runtimeType == stringType);
    if (body == null) {
      return null;
    } else {
      T responsChildValue = classMirror.newInstance(_JsonHelper.FROM_JSON, [
        body,
      ]);
      return responsChildValue;
    }
  }
}

class _JsonHelper {
  // ignore: constant_identifier_names
  static const FROM_JSON = "fromJson";
}
