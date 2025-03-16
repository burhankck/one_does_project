import 'package:easy_localization/easy_localization.dart';
import 'package:one_does_project/data/network/failure.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  UNKNOWN,
  NO_INTERNET_CONNECTION,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION,
        );
      default:
        return Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
    }
  }
}

class ResponseCode {
  //Api status code
  static const int SUCCESS = 200; // Başarılı veri ile
  static const int NO_CONTENT = 201; // Başarılı içerik yok
  static const int BAD_REQUEST = 400; // Hatalı istek, API isteği reddetti
  static const int FORBIDDEN = 403; // Yasaklı, API isteği reddetti
  static const int UNAUTHORISED = 401; // Yetkisiz, kullanıcı yetkilendirilmedi
  static const int NOT_FOUND = 404; // Bulunamadı, API URL'si yanlış
  static const int INTERNAL_SERVER_ERROR = 500; // Sunucu tarafında hata oluştu
  //local status code
  static String UNKNOWN = LocaleKeys.responseCode_unknown.tr();
  static String NO_INTERNET_CONNECTION =
      LocaleKeys.responseCode_noInternetConnection.tr();
}

class ResponseMessage {
  //Api status code
  static String SUCCESS =
      LocaleKeys.responseMessage_success.tr(); // Başarılı veri ile (200)
  static String NO_CONTENT =
      LocaleKeys.responseMessage_noContent.tr(); // Başarılı içerik yok (201)
  static String BAD_REQUEST =
      LocaleKeys.responseMessage_badRequest
          .tr(); // Hatalı istek, API isteği reddetti (400)
  static String FORBIDDEN =
      LocaleKeys.responseMessage_forbidden
          .tr(); // Yasaklı, API isteği reddetti (403)
  static String UNAUTHORISED =
      LocaleKeys.responseMessage_unauthorised
          .tr(); // Yetkisiz, kullanıcı yetkilendirilmedi (401)
  static String NOT_FOUND =
      LocaleKeys.responseMessage_notFound
          .tr(); // Bulunamadı, API URL'si yanlış (404)
  static String INTERNAL_SERVER_ERROR =
      LocaleKeys.responseMessage_internalServerError
          .tr(); // Sunucu tarafında hata oluştu (500)
  //local status code
  static String UNKNOWN = LocaleKeys.responseCode_unknown.tr();
  static String NO_INTERNET_CONNECTION = LocaleKeys.responseCode_noInternetConnection.tr();
}
