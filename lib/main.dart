import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getXDemo/pages/home/view/home.dart';
import 'package:getXDemo/setting/setting.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(GetMaterialApp(
    title: AppSetting.title,
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
