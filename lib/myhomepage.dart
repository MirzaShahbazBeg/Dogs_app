import 'package:dogs_app/response_image_model.dart';
import 'package:dogs_app/services/http_service.dart';
import 'package:flutter/material.dart';

import './dog_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dataService = DataService();
  ImageResponse? _imageresponse;
  List<DogSearchResponse>? _response;
  List<String> imageId = [];
  List<String> responseimgurl = [];
  final _dogController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Dog Breed',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        imageId = [];
                        responseimgurl = [];

                        if (_dogController.text.length > 3) {
                          getData(_dogController.text.toString());
                        }
                      });
                    },
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ),
                controller: _dogController,
                // onChanged: ((value) {
                //   setState(() {
                //     imageId = [];
                //     responseimgurl = [];
                //   });
                //   if (value.length > 3) {
                //     getData(_dogController.text.toString());
                //   }
                // }),
              ),
            ),
            // const ImageList(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: responseimgurl.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    elevation: 10,
                    color: Colors.black,
                    child: Column(
                      children: [Image.network(responseimgurl[index])],
                    ),
                  ),
                );
              },
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     if (_dogController.text == null) {}
            //     // getData();
            //   },
            //   child: Text('Get Data'),
            // ),
          ],
        ),
      ),
    ));
  }

//get breed
  void getData(String breedname) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    final response = await _dataService.getbreed(breedname);
    setState(() {
      imageId = [];
      _response = response;
    });
    for (var i in _response!) {
      if (i.referenceImageId != null) {
        imageId.add(i.referenceImageId.toString());
      }
    }

    print(imageId);
    print('image id length');
    print(imageId.length);

    getImage(imageId);
    Navigator.of(context).pop();
  }

//get image list
  void getImage(List<String> refImgaeid) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    // responseimgurl = [];
    final imgresponse = await _dataService.imageidlist(refImgaeid);
    print(imgresponse.length);
    setState(() {
      responseimgurl = [];
      responseimgurl = imgresponse;
      // _imageresponse = imgresponse;
    });
    // print(_imageresponse?.url);
    print('response image url: $responseimgurl');
    Navigator.of(context).pop();
  }
}
