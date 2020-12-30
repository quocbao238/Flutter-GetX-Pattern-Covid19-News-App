import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getXDemo/pages/home/controller/home_controller.dart';

class HomeCarouseSliderWidget extends StatelessWidget {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return homeController.lstNews.length > 0
        ? Container(
            width: Get.width,
            child: CarouselSlider.builder(
                itemCount: homeController.lstNews.length,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayInterval: Duration(milliseconds: 6000),
                  autoPlayCurve: Curves.easeInOut,
                  viewportFraction: 1.0,
                ),
                itemBuilder: (BuildContext context, int itemIndex) =>
                    // Container(
                    //   color: Colors.red,
                    // )
                    _carouseSliderItem(itemIndex)),
          )
        : const SizedBox();
  }

  Widget _carouseSliderItem(int itemIndex) {
    return Container(
      padding: EdgeInsets.only(bottom: 2),
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
        ),
        child: InkWell(
          onTap: () {
            homeController.onTapCarouse(itemIndex);
          },
          child: Container(
              height: Get.height * 0.4,
              child: Stack(
                children: <Widget>[
                  __carouseSliderItemImage(itemIndex),
                  __carouseSliderItemTitle(itemIndex),
                ],
              )),
        ),
      ),
    );
  }

  Widget __carouseSliderItemTitle(int itemIndex) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
          width: Get.width,
          color: Colors.black.withOpacity(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(homeController.lstNews[itemIndex].title,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Text(homeController.lstNews[itemIndex].pubDate,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          )),
    );
  }

  Widget __carouseSliderItemImage(int itemIndex) {
    return CachedNetworkImage(
        imageUrl: homeController.lstNews[itemIndex].image,
        fit: BoxFit.cover,
        width: Get.width,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)));
  }
}
