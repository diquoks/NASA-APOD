import "package:dio/dio.dart";

class QueryHelper {
  final void Function() startLoading;
  final void Function() endLoading;

  QueryHelper({required this.startLoading, required this.endLoading});

  Future<void> request<ResponseT>({
    required Future<ResponseT> Function() request,
    required void Function(ResponseT) onResponse,
    required void Function((String, String)) onError,
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

  (String, String) castError(Exception e) {
    String? castedError;
    if (e is DioException) {
      if (e.response != null) {
        if (e.response!.statusCode! ~/ 100 == 4) {
          castedError =
              "API NASA может нестабильно работать в России,\nпопробуйте использовать VPN! (${e.response!.statusCode})";
        } else if (e.response!.statusCode! ~/ 100 == 5) {
          castedError =
              "API NASA APOD временно недоступен,\nпопробуйте позже ещё раз! (${e.response!.statusCode})";
        }
      }
    }
    if (castedError != null) {
      return ("Возникла ошибка!", castedError);
    } else {
      return (
        "Возникла непредвиденная ошибка!",
        "${e.toString()}\n\nЕсли ошибка повторится - сообщите о ней разработчику!",
      );
    }
  }
}
