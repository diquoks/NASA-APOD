import "package:nasa_apod/data/models/astronomy_picture_model.dart";
import "package:nasa_apod/data/repository/client.dart";
import "package:nasa_apod/domain/services/query_helper.dart";

class QueryUseCase {
  final Function() startLoading;
  final Function() endLoading;
  final QueryHelper helper;
  final Client client = Client();

  QueryUseCase({required this.startLoading, required this.endLoading})
    : helper = QueryHelper(startLoading: startLoading, endLoading: endLoading);

  Future<void> getApod({
    String? date,
    String? startDate,
    String? endDate,
    int? count,
    bool? thumbs,
    required Function(AstronomyPictureModel) onResponse,
    required Function((String, String)) onError,
  }) async {
    await helper.request(
      request: () => client.getApod(
        date: date,
        startDate: startDate,
        endDate: endDate,
        count: count,
        thumbs: thumbs,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
