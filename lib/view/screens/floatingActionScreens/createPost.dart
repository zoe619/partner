import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:order_tracker/networking/core/services/post_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/floatingActionScreens/innerScreens/choose_video.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

List<MultipartFile> newList = <MultipartFile>[];
List<File> fileImageArray = [];
List f = [];
List<Asset> resultList = <Asset>[];
List<Asset> images = <Asset>[];

class _CreatePostState extends State<CreatePost> {
  File _video;
  File _cameraVideo;
  bool _isLoading = false;
  final picker = ImagePicker();
  bool _isButtonEnabled = false;
  final _messageController = TextEditingController();
  NewsFeedServices _newsFeedServices = Get.put(NewsFeedServices());

  getImageFileFromAsset(String path) async {
    final file = File(path);
    return file;
  }

  @override
  void dispose() {
    f.clear();
    newList.clear();
    fileImageArray.clear();
    resultList.clear();
    images.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: redColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Create post",
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                elevation: 0,
                primary: _isButtonEnabled == true ? redColor : Colors.grey,
              ),
              child: _isLoading == true
                  ? SizedBox(
                      height: 15,
                      width: 15,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    )
                  : Text(
                      "Post",
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                      ),
                    ),
              onPressed: () async {
                var video;
                if (_messageController.text.isEmpty && images.isEmpty && video == null) {
                  Get.snackbar("Error", "All Fields cannot be empty",
                      backgroundColor: Colors.red, colorText: Colors.white);
                  return;
                } else {
                  setState(() {
                    _isLoading = true;
                  });
                  if (images.isNotEmpty) {
                    _newsFeedServices
                        .multiImagePostAPI(
                            _messageController.text.isEmpty ? "." : _messageController.text, video)
                        .then((value) {
                      setState(() {
                        _isLoading = false;
                        // newPostMadeList.insert(
                        //     0, NewPostModel(data: value.data));
                      });
                    });
                  } else {
                    _newsFeedServices
                        .createPost(_messageController.text.trim().toString(), images, video)
                        .then(
                      (value) {
                        setState(
                          () {
                            _isLoading = false;
                            // newPostMadeList.insert(
                            //     0, NewPostModel(data: value.data));
                          },
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            // height: MediaQuery.of(context).size.height / 1.2,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(20),
                    Container(
                      child: TextFormField(
                        controller: _messageController,
                        maxLines: 2,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "What's on your mind foodie?",
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                          hintMaxLines: 1,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: (v) {
                          if (v != "") {
                            setState(() {
                              _isButtonEnabled = true;
                            });
                          }
                        },
                      ),
                    ),
                    buildGridView(),
                    YMargin(30),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Add To Your Post",
                                style: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(
                                  Icons.image,
                                  color: Colors.green,
                                  size: 30,
                                ),
                                onPressed: loadAssets,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.video_call,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Get.bottomSheet(
                                    Container(
                                      color: Colors.grey[600],
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16)),
                                        ),
                                        height: MediaQuery.of(context).size.height / 4,
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Choose an option',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              height: 3,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            TextButton(
                                              child: Text(
                                                'Take a Video',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, color: redColor),
                                              ),
                                              onPressed: () {
                                                _pickVideoFromCamera();
                                                // _getImage(context, ImageSource.camera);
                                              },
                                            ),
                                            TextButton(
                                              child: Text(
                                                'Pick Video from Gallery',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, color: redColor),
                                              ),
                                              onPressed: () {
                                                _pickVideo();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "TravelTube",
          allViewTitle: "All Photos",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    if (!mounted) return;

    for (int i = 0; i < resultList.length; i++) {
      var path = await FlutterAbsolutePath.getAbsolutePath(resultList[i].identifier);
      print(path);
      f.add(File(path));
    }

    setState(() {
      images = resultList;
    });

    // return fileImageArray;
  }

  Widget buildGridView() {
    if (images.isNotEmpty) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(images.length, (index) {
          Asset asset = images[index];

          return Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AssetThumb(
                asset: asset,
                width: 200,
                height: 200,
              ),
            ),
          );
        }),
      );
    } else {
      return Container();
    }
  }

  _pickVideo() async {
    var video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    _video = File(video.path);
    Get.off(
      () => ChooseVideo(
        videoFile: _video,
      ),
    );
  }

  _pickVideoFromCamera() async {
    var video = await ImagePicker.pickVideo(source: ImageSource.camera);
    _cameraVideo = File(video.path);
    Get.off(
      () => ChooseVideo(
        videoFile: _cameraVideo,
      ),
    );
  }
}
