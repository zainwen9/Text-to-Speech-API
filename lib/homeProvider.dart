// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:talking/api_sevices.dart';

class VideoProvider extends ChangeNotifier {
  String? videoCreatedID;
  String? videoUrl;
  bool isloaded = false;
  bool isVideoLoading = false;
  String apiKey = "ZGV2QGdhaW56LmFp:Vh6Wilj6XvCiKX1adYnwa";

  Future<bool> generateVideo(
      {required String usertext, required BuildContext ctx}) async {
    isloaded = false;
    isVideoLoading = true;
    notifyListeners();
    // ------------- sample image --------------

    const String avatarImageUrl =
        "https://firebasestorage.googleapis.com/v0/b/portofolio-d4821.appspot.com/o/ddddsf.JPG?alt=media&token=6e2f4bb0-5398-4a01-bc75-5b4797f9a2c3";
    //------------------ data ---------------------
    Map<String, dynamic> requestData = {
      "source_url": avatarImageUrl,
      "script": {"type": "text", "input": usertext.toString()},
      "config": {"stitch": true}
    };
    const url = 'https://api.d-id.com/talks';

    final responceData = await sendApiRequest(
        url: url,
        requestType: RequestType.POST,
        data: requestData,
        token: apiKey,
        ctx: ctx);

    if (responceData != null) {
      videoCreatedID = responceData['id'];
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
      getVideoLink(ctx: ctx);

      return true;
    } else {
      isVideoLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> getVideoLink({required BuildContext ctx}) async {
    final url = 'https://api.d-id.com/talks/${videoCreatedID!}';

    final responceData = await sendApiRequest(
        url: url, requestType: RequestType.GET, token: apiKey, ctx: ctx);

    if (responceData != null) {
      videoUrl = responceData['result_url'];
      if (videoUrl == null) {
        getVideoLink(ctx: ctx);
      } else {
        isloaded = true;
        isVideoLoading = false;
        notifyListeners();
      }

      return true;
    } else {
      isVideoLoading = false;
      notifyListeners();
      return false;
    }
  }
}
