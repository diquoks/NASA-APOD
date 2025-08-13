import 'package:dio/dio.dart';

class QueryHelper {
  final Function() startLoading;
  final Function() endLoading;

  QueryHelper({required this.startLoading, required this.endLoading});

  Future<void> request<ResponseT>({
    required Future<ResponseT> Function() request,
    required void Function(ResponseT) onResponse,
    required void Function(String) onError,
  }) async {
    try {
      startLoading();
      ResponseT response = await request();
      endLoading();
      onResponse(response);
    } on Exception catch (e) {
      endLoading();
      onError(castError(e));
    }
  }

  String castError(Exception e) {
    if (e is DioException) {
      if (e.response != null) {
        if (e.response!.statusCode! == 403) {
          return "API NASA может нестабильно работать в России,\nпопробуйте использовать VPN!";
        }
      }
    }
    return e.toString();
  }
}
