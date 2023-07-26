// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meetu/Resources/GoogleAuth.dart';
import 'package:meetu/main.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  VideoConferencePage({super.key, required this.conferenceID});

  // Read AppID and AppSign from .env file
  // Make sure you replace with your own
  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get('ZEGO_APP_SIGN');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appDesignSize: Size(double.infinity, double.infinity) ,
        appID:
            appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: GoogleAuth().user.displayName ?? 'No Name',
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          turnOnCameraWhenJoining: false,
          turnOnMicrophoneWhenJoining: false,
          topMenuBarConfig: ZegoTopMenuBarConfig(
            title: conferenceID,
            extendButtons: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_rounded),
            )
          ]),
          leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
            title: "Leave the conference",
            message: "Are you sure to leave the conference?",
            cancelButtonName: "Cancel",
            confirmButtonName: "Confirm",
          ),
        ),
      ),
    );
  }
}
