import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/new_post_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:video_player/video_player.dart';

class ChooseVideo extends StatefulWidget {
  final File videoFile;

  const ChooseVideo({Key key, this.videoFile}) : super(key: key);
  @override
  _ChooseVideoState createState() => _ChooseVideoState();
}

class _ChooseVideoState extends State<ChooseVideo> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  var length = 0;
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        print("videoDuration ${_videoPlayerController.value.duration}");
      });
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        showControls: true,
        aspectRatio: _videoPlayerController.value.aspectRatio);
  }

  @override
  dispose() {
    super.dispose();
    _chewieController.dispose();
    _videoPlayerController.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            _chewieController.videoPlayerController.pause();
            Get.back();
          },
        ),
        title: Text(
          "Choose Video",
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                elevation: 0,
              ),
              child: isLoading == true
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
                setState(() {
                  isLoading = true;
                });
                sendAllPost(_messageController.text.trim().toString(), null, widget.videoFile)
                    .then((value) {
                  setState(() {
                    isLoading = false;
                    // newPostMadeList.insert(0, NewPostModel(data: value.data));
                  });
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.snackbar(
                    "Success",
                    "Post created successfully",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                });
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                ),
              ),
              YMargin(20),

              widget.videoFile != null
                  ? Container(
                      margin: EdgeInsets.only(top: 8),
                      // height: 300,
                      // width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: _chewieController.aspectRatio,
                        child: _chewieController != null &&
                                _chewieController.videoPlayerController.value.isInitialized
                            ? Chewie(
                                controller: _chewieController,
                              )
                            : Container(),
                      ),
                    )
                  : Text(
                      "Click on Pick Video to select video",
                      style: TextStyle(fontSize: 18.0),
                    ),
              widget.videoFile != null
                  ? SizedBox()
                  : ElevatedButton(
                      onPressed: () {
                        // _pickVideo();
                      },
                      child: Text("Pick Video"),
                    ),
              // Spacer(),
              // Container()
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<NewPostModel> sendAllPost(body, image, video) async {
    var uri = Api.$BASE_URL + Endpoints.addNewPost;
    var token = await storage.read(key: "token");
    var dio = Dio();
    isLoading = true;
    try {
      FormData formData = FormData.fromMap({
        "message": body == null ? "" : "$body",
        "images": image == null
            ? "".trim()
            : await MultipartFile.fromFile(image.path, filename: 'postimage'),
        "video": video == null
            ? "".trim()
            : await MultipartFile.fromFile(video.path, filename: 'postvideo'),
      });
      print(formData.fields.toString());
      var response = await dio.post(
        uri,
        data: formData,
        options: Options(
          followRedirects: true,
          contentType: 'multipart/form-data',
          headers: {
            'Authorization': 'Bearer $token',
            "Accept": "application/json",
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading = false;

        return NewPostModel.fromJson(response.data);
      } else {
        isLoading = false;

        print(response.statusCode);
        print(response.statusMessage);
      }
    } on DioError catch (e) {
      isLoading = false;
      print(e);
    }
  }
}
