import "package:dio/dio.dart";
import "package:nasa_apod/data/models/astronomy_picture_model.dart";

abstract class Repository {
  final Dio dio = Dio();
  abstract final String apiUrl;

  Future<AstronomyPictureModel> getApod({
    String? date = "today",
    String? startDate,
    String? endDate = "today",
    int? count,
    bool? thumbs = false,
  });
}
