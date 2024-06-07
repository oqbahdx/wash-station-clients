import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

class RecordTestView extends StatefulWidget {
  const RecordTestView({super.key});

  @override
  State<RecordTestView> createState() => _RecordTestViewState();
}

class _RecordTestViewState extends State<RecordTestView> {
  bool isRecording = false;
  final audioRecorder = AudioRecorder();
  late AudioPlayer audioPlayer;
  String audioPath = '';
  var duration;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  Future<void> playRecord() async {
    duration = await audioPlayer.setUrl('/storage/emulated/0/Music/file.m4a');
    audioPlayer.play();
  }

  Future<void> stopRecord() async {}
  Future<void> startRecording() async {
    try {
      if (await audioRecorder.hasPermission() &&
          await Permission.storage.isGranted) {
        await audioRecorder.start(RecordConfig(),
            path: '/storage/emulated/0/Music/file.m4a');
        // setState(() {
        //   isRecording = true;
        // });
      } else {
        await Permission.microphone.request();
      }
    } catch (e) {
      print("Error when start recording $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecorder.stop();
      // setState(() {
      //   isRecording = false;
      //   audioPath = path!;
      // });
    } catch (e) {
      print("Error when stopping recording $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Record Test",
            style: getSemiBoldStyle(
                color: ColorManager.white, fontSize: FontSize.s20.sp),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: startRecording,
                child: Text(
                  "Start",
                  style: getBoldStyle(color: ColorManager.white),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              // StreamBuilder<PositionDa>(stream: stream, builder: builder)
              ElevatedButton(
                onPressed: stopRecording,
                child: Text(
                  "Stop",
                  style: getBoldStyle(color: ColorManager.white),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    audioRecorder.dispose();
    super.dispose();
  }
}
