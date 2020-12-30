import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXDemo/pages/home/controller/home_controller.dart';
import 'package:getXDemo/pages/home/widget/home_carouse_widget.dart';
import 'package:getXDemo/pages/home/widget/home_data_widget.dart';
import 'package:getXDemo/pages/home/widget/home_menu_widget.dart';
import 'package:getXDemo/widget/loading_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(children: [
                homeController.isLoading.value ? LoadingWidget() : buildBody()
              ]));
        });
  }

  Widget buildBody() => Column(children: [
      HomeCarouseSliderWidget(),
      Expanded(child: Row(children: [HomeMenuWidget(), HomeCovidDataWidget()]))
    ]);
}
