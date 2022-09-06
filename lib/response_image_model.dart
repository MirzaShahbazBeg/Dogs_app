// [
//   {
//
//     "id": "B1uW7l5VX",
//     "url": "https://cdn2.thedogapi.com/images/B1uW7l5VX_1280.jpg",
//
//   }
// ]

// To parse this JSON data, do
//
//     final imageResponse = imageResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// List<ImageResponse> imageResponseFromJson(String str) =>
//     List<ImageResponse>.from(
//         json.decode(str).map((x) => ImageResponse.fromJson(x)));

// String imageResponseToJson(List<ImageResponse> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageResponse {
  ImageResponse({
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
      );
}
