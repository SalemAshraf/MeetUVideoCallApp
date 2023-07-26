// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meetu/Resources/GoogleAuth.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class MettingPage extends StatefulWidget {
  final String roomId;

  MettingPage({required this.roomId});

  @override
  State<MettingPage> createState() => _MettingPageState();
}

class _MettingPageState extends State<MettingPage> {
  final int appId = int.parse(dotenv.get('ZEGO_APP_ID'));

  final String appSign = dotenv.get('ZEGO_APP_SIGN');

  final GoogleAuth googleAuth = GoogleAuth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID:
            appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: googleAuth.user.uid,
        userName: googleAuth.user.displayName ?? '',
        conferenceID: widget.roomId,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
            turnOnCameraWhenJoining: false,
            turnOnMicrophoneWhenJoining: false,
            topMenuBarConfig: ZegoTopMenuBarConfig(
              style: ZegoMenuBarStyle.light,
              title: 'MeetU is here',
            )),
      ),
    );
  }
}
