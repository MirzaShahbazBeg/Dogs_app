// To parse this JSON data, do
//
//     final dogSearchResponse = dogSearchResponseFromJson(jsonString);

import 'dart:convert';

// List<DogSearchResponse> dogSearchResponseFromJson(String str) =>
//     List<DogSearchResponse>.from(
//         json.decode(str).map((x) => DogSearchResponse.fromJson(x)));

// String dogSearchResponseToJson(List<DogSearchResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogSearchResponse {
  DogSearchResponse({
    required this.id,
    required this.name,
    required this.referenceImageId,
  });

  final int? id;
  final String? name;

  final String? referenceImageId;

  factory DogSearchResponse.fromJson(Map<String, dynamic> json) =>
      DogSearchResponse(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        referenceImageId: json["reference_image_id"] == null
            ? null
            : json["reference_image_id"],
      );
}
