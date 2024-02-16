import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talking/app_text_field.dart';
import 'package:talking/homeProvider.dart';
import 'package:talking/videos/videoplayer2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController queryCont = TextEditingController();

  String sampleVideo =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    final w = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Talking AI",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              videoProvider.isloaded
                  ? SizedBox(
                      width: w,
                      height: w * 1.5,
                      child: VieoPlayerWidget(
                          url: videoProvider.videoUrl ?? sampleVideo),
                    )
                  : SizedBox(
                      width: w,
                      height: w * 1.5,
                      child: const Center(child: Text("Generate video")),
                    ),
              SizedBox(
                  width: w * 0.9,
                  child: customTextField(
                      mYhintText: "Add Text",
                      keyBordType: TextInputType.text,
                      maxLiness: 5,
                      fieldvalivator: (value) => null,
                      myControler: queryCont)),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await videoProvider.generateVideo(
                        usertext: queryCont.text, ctx: context);
                    // queryCont.clear();
                  },
                  child: videoProvider.isVideoLoading
                      ? const SizedBox(
                          height: 20,
                          width: 60,
                          child: Center(child: CircularProgressIndicator()))
                      : const Text("Generate"))
            ],
          ),
        ),
      ),
    );
  }
}
