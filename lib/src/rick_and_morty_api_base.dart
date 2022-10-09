import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

enum Methods { character, location, episode }

abstract class ApiManager {
  final Dio _dio = Dio();
  final String _url = "https://rickandmortyapi.com/api/";
  Future<Response<T>?> get<T>({
    String? params,
    void Function(
      DioError error,
      StackTrace trace,
    )?
        error,
    Methods? method,
  }) async {
    try {
      String methodUrl = "";
      switch (method) {
        case Methods.character:
          {
            methodUrl = "character";
            break;
          }
        case Methods.episode:
          {
            methodUrl = "episode";
            break;
          }
        case Methods.location:
          {
            methodUrl = "location";
            break;
          }
        default:
          {
            break;
          }
      }

      return (await _dio.get<T>(_url + methodUrl + (params ?? "")));
    } catch (e, trace) {
      Logger().d((e as DioError).message);
      error == null ? null : error(e, trace);
      return null;
    }
  }
}

mixin ApiNetworking on ApiManager {
  Future<bool> get testApi async {
    try {
      var res = await get();
      Logger().d(res!.statusCode);
      return true;
    } catch (e) {
      Logger().e(e);
    }
    return false;
  }
}
