import "dart:io";
import "package:flutter_test/flutter_test.dart";

import "package:nasa_apod/domain/use_cases/query_use_case.dart";

QueryUseCase useCase = QueryUseCase(startLoading: () {}, endLoading: () {});

void onResponse(Object? obj) {
  stdout.writeln(obj.toString());
  assert(true);
}

void onError(Exception e) {
  fail(e.toString());
}

void main() {
  group("Query", () {
    test("getApod", () async {
      await useCase.getApod(onResponse: onResponse, onError: onError);
    });
  });
}
