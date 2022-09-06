import 'dart:convert';

import 'package:dogs_app/response_image_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../dog_model.dart';

class DataService {
  Future<List<DogSearchResponse>> getbreed(String breedname) async {
    final uri = Uri.parse(
      'https://api.thedogapi.com/v1/breeds/search?q=$breedname',
    );
    Response response = await http.get(uri, headers: {
      "x-api-key":
          "live_y5w2bn4ED89r4g0ZEN2GXmCOogpEjlrkyrIMCJBgqawD3Jy7DCB20lJX33UYWUak"
    });

    print(response.body);
    var Decodedjson = (jsonDecode(response.body) as List)
        .map<DogSearchResponse>((e) => DogSearchResponse.fromJson(e))
        .toList();
    // print(Decodedjson);
    return Decodedjson;
    // return (response.body as List)
    //     .map((e) => DogSearchResponse.fromJson(e))
    //     .toList();
    //  return DogSearchResponse.fromJson(json);
  }

//get image urls
  List<String> imgurl = [];
  ImageResponse? _imageresponse;
  Future<List<String>> imageidlist(List<String> imageidlist) async {
    imgurl = [];
    for (var i in imageidlist) {
      print('service class');
      print(i);

      final _imageresponse = await getImage(i);
      print(_imageresponse.url);

      imgurl.add(_imageresponse.url);
    }
    print(imgurl.length);
    // print(imgurl);
    return imgurl;
  }

  Future<ImageResponse> getImage(String refimageid) async {
    final uri = Uri.parse('https://api.thedogapi.com/v1/images/$refimageid');
    // 'https://api.thedogapi.com/v1/images/search?breed_id=$refimageid'
    Response response = await http.get(uri, headers: {
      "x-api-key":
          "live_y5w2bn4ED89r4g0ZEN2GXmCOogpEjlrkyrIMCJBgqawD3Jy7DCB20lJX33UYWUak"
    });
    var Decodedjson = jsonDecode(response.body);
    // print(response.body);
    // var Decodedjson = (jsonDecode(response.body) as List)
    //     .map<ImageResponse>((e) => ImageResponse.fromJson(e))
    //     .toList();
    // print(Decodedjson);
    return ImageResponse.fromJson(Decodedjson);
  }
}
