import "dart:io";
import "package:flutter_test/flutter_test.dart";
import "package:nasa_apod/data/models/astronomy_picture_model.dart";

import "package:nasa_apod/domain/use_cases/query_use_case.dart";

QueryUseCase useCase = QueryUseCase(startLoading: () {}, endLoading: () {});

onResponse(Object? obj, Type testType) {
  stdout.writeln(obj.toString());
  assert(obj.runtimeType == testType);
}

void onError(Object e) {
  fail(e.toString());
}

void main() {
  group("Query", () {
    test("getApod", () async {
      await useCase.getApod(
        onResponse: (obj) => onResponse(obj, AstronomyPictureModel),
        onError: onError,
      );
    });
  });
}
