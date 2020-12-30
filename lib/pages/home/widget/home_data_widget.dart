import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:getXDemo/setting/setting.dart';

import '../controller/home_controller.dart';

class HomeCovidDataWidget extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        children: <Widget>[_gridCovidData(), _slideBottomWorldData()],
      ),
    );
  }

  Widget _slideBottomWorldData() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(2),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3) // changes position of shadow
                    ),
              ],
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.black12),
              color: homeController.txtGlobal.value != AppSetting.global
                  ? AppSetting.backgroundColor4
                  : AppSetting.backgroundColor3,
            ),
            child: (homeController.txtGlobal.value != AppSetting.global)
                ? InkWell(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      homeController.onTapMenu(
                          changeGlobal: true, nameCountry: AppSetting.global);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Back to Select Country',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                : CarouselSlider.builder(
                    itemCount: homeController.lstWorldCovid.length ?? 0,
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 6000),
                        autoPlayInterval: Duration(milliseconds: 8000),
                        scrollDirection: Axis.horizontal,
                        aspectRatio: 2.0,
                        autoPlay: true),
                    itemBuilder: (BuildContext context, int itemIndex) =>
                        Container(
                      margin: EdgeInsets.all(4.0),
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      Offset(0, 3) // changes position of shadow
                                  ),
                            ],
                            color: AppSetting.backgroundColor4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              width: 35.0,
                              child: SvgPicture.asset(homeController
                                  .lstWorldCovid[itemIndex].iconUrl),
                            ),
                            SizedBox(width: 8.0),
                            Text(homeController.lstWorldCovid[itemIndex].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0)),
                            SizedBox(width: 4.0),
                            Text(
                              homeController.lstWorldCovid[itemIndex].value,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                fontSize: 16.0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _gridCovidData() {
    Widget __searchCountry() => Expanded(
        flex: 9,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3) // changes position of shadow
                      ),
                ],
                borderRadius: BorderRadius.circular(15.0),
                color: AppSetting.backgroundColor3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 6, right: 6, top: 8, bottom: 8),
                    child: FocusedMenuHolder(
                        onPressed: () {},
                        blurSize: 8.0,
                        menuItemExtent: 45,
                        menuBoxDecoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        duration: Duration(milliseconds: 100),
                        animateMenuItems: true,
                        blurBackgroundColor: Colors.black26,
                        openWithTap:
                            true, // Open Focused-Menu on Tap rather than Long Press
                        menuOffset: 15,
                        bottomOffsetHeight: 15,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          // margin: EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: AppSetting.backgroundColor4,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.sort,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8.0),
                              Text('Filter by ${homeController.filterType}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              SizedBox(width: 8.0),
                            ],
                          ),
                        ),
                        menuItems: [
                          customFocusedMenuItem(
                              text: AppSetting.filterName,
                              iconUrl: AppSetting.iconLoadCovid),
                          customFocusedMenuItem(
                              text: AppSetting.totalCase,
                              iconUrl: AppSetting.iconTotalCase),
                          customFocusedMenuItem(
                              text: AppSetting.totalDeath,
                              iconUrl: AppSetting.iconTotalDeath),
                          customFocusedMenuItem(
                              text: AppSetting.totalRecovered,
                              iconUrl: AppSetting.icontotalRecovered),
                        ]),
                  ),
                  Expanded(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        padding: EdgeInsets.all(6.0),
                        itemCount: homeController.lstCovidTotal.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (index != 0 &&
                                  homeController
                                          .lstCovidTotal[index].countryText !=
                                      null &&
                                  homeController
                                      .lstCovidTotal[index].countryText
                                      .compareTo(AppSetting.global) != 0)
                              ? AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.redAccent
                                                .withOpacity(0.2)),
                                        height: 50,
                                        margin: EdgeInsets.only(bottom: 10.0),
                                        child: InkWell(
                                          onTap: () {
                                            homeController.onTapCountry(index);
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Text(homeController
                                                      .lstCovidTotal[index]
                                                      .countryText ??
                                                  ""),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

    Widget __covidData() => Expanded(
          flex: 9,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(2),
              child: Container(
                padding: EdgeInsets.only(top: 4.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3) // changes position of shadow
                        ),
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppSetting.backgroundColor3,
                ),
                child: AnimationLimiter(
                  child: GridView.builder(
                      padding: EdgeInsets.all(8.0),
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: Get.width / (Get.height / 1.58)),
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredGrid(
                              columnCount: 4,
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 500.0,
                                child: Container(
                                  padding: EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            Colors.blueAccent.withOpacity(0.8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3) // changes position of shadow
                                              ),
                                        ]),
                                    // height: 50,
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    child: Container(
                                      padding: EdgeInsets.all(2.0),
                                      child: Column(
                                        children: <Widget>[
                                          // Expanded(flex: 1, child: SizedBox()),
                                          Expanded(
                                            child: Container(
                                              child: Center(
                                                child: SvgPicture.asset(
                                                    homeController
                                                        .lstWorldCovid[index]
                                                        .iconUrl),
                                              ),
                                            ),
                                          ),
                                          Text(
                                              homeController
                                                          .lstGridViewCovidData[
                                                              index]
                                                          .title ==
                                                      AppSetting.totalCase
                                                  ? homeController
                                                      .lstGridViewCovidData[
                                                          index]
                                                      .title
                                                  : homeController
                                                      .lstGridViewCovidData[
                                                          index]
                                                      .title
                                                      .replaceAll(":", "")
                                                      .replaceAll("Total", ""),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.0,
                                                  color: Colors.white60)),
                                          SizedBox(height: 8.0),

                                          Text(
                                              homeController
                                                  .lstGridViewCovidData[index]
                                                  .value
                                                  .replaceAll(":", ""),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.0,
                                                  color: Colors.white)),
                                          SizedBox(height: 8.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))),
                ),
              ),
            ),
          ),
        );

    if (homeController.isGlobal.value) {
      if (homeController.txtGlobal.value == AppSetting.global) {
        return __searchCountry();
      } else {
        return __covidData();
      }
    } else {
      return __covidData();
    }
  }

  FocusedMenuItem customFocusedMenuItem({String iconUrl, String text}) {
    return FocusedMenuItem(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              child: SvgPicture.asset(iconUrl),
            ),
            SizedBox(width: 8.0),
            Text(text,
                style: TextStyle(
                    color: homeController.filterType.value == text
                        ? Colors.red
                        : Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
        onPressed: () {
          homeController.filterListSearch(text);
        });
  }
}
