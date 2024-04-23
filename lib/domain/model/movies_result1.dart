// To parse this JSON data, do
//
//     final movieResult1Model = movieResult1ModelFromJson(jsonString);

import 'dart:convert';
import 'package:movies/domain/model/movie_result.dart';


MovieResult1Model movieResult1ModelFromJson(dynamic str) => MovieResult1Model.fromJson(str);

String movieResult1ModelToJson(MovieResult1Model data) => json.encode(data.toJson());

class MovieResult1Model {

    final int page;

    final List<Result> results;

    final int totalPages;

    final int totalResults;

    MovieResult1Model({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieResult1Model.fromJson(Map<String, dynamic> json) => MovieResult1Model(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}
