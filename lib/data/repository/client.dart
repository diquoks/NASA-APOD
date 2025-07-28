import 'package:dio/dio.dart';

import 'package:nasa_apod/data/models/astronomy_picture_model.dart';
import 'package:nasa_apod/data/repository/repository.dart';
import 'package:nasa_apod/data/storage/storage.dart';

class Client extends Repository {
  final Storage storage = mainStorage;

  @override
  String get apiUrl => "https://api.nasa.gov/planetary/apod";

  @override
  Future<AstronomyPictureModel> getApod({
    String? date = "today",
    String? startDate,
    String? endDate = "today",
    int? count,
    bool? thumbs = false,
  }) async {
    Response response = await dio.get(
      apiUrl,
      queryParameters: {
        "date": date,
        "start_date": startDate,
        "end_date": endDate,
        "count": count,
        "thumbs": thumbs,
        "api_key": storage.apiKey,
      },
    );
    return AstronomyPictureModel.fromJson(response.data);
  }
}
