import "package:dio/dio.dart";

import "package:nasa_apod/data/models/astronomy_picture_model.dart";
import "package:nasa_apod/data/storage/storage.dart";

abstract interface class Repository {
  abstract final Dio dio;
  abstract final Storage storage;
  abstract final String apiUrl;

  Future<AstronomyPictureModel> getApod({
    String? date = "today",
    String? startDate,
    String? endDate = "today",
    int? count,
    bool? thumbs = false,
  });
}
