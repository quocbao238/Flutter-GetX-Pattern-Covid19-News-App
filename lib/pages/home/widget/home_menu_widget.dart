import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getXDemo/pages/home/controller/home_controller.dart';
import 'package:getXDemo/setting/setting.dart';

class HomeMenuWidget extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0, top: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        child: Column(
          children: <Widget>[
            Expanded(
              child: _menuItem(
                image: AppSetting.iconCountry,
                isTop: true,
                name: AppSetting.txtVn,
                value: homeController.isGlobal.value,
              ),
            ),
            Container(height: 1, color: Colors.black12),
            Expanded(
              child: _menuItem(
                image: AppSetting.icondGlobal,
                isTop: false,
                name: homeController.txtGlobal.value,
                value: !homeController.isGlobal.value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({bool isTop, String image, String name, bool value}) {
    return GestureDetector(
      onTap: () {
        homeController.onTapMenu(
            changeGlobal: isTop ? false : true, nameCountry: name);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: value ? Colors.black12 : Colors.redAccent,
          borderRadius: isTop
              ? BorderRadius.only(
                  topRight: Radius.circular(25),
                )
              : BorderRadius.only(
                  bottomRight: Radius.circular(25),
                ),
        ),
        child: Center(
          child: Container(
            width: double.maxFinite,
            child: RotatedBox(
                quarterTurns: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 16.0),
                        width: 35.0,
                        child: SvgPicture.asset(image)),
                    SizedBox(width: 8.0),
                    Container(
                      margin: EdgeInsets.only(right: 16.0),
                      child: Text(
                          name.length <= 10
                              ? name
                              : name.substring(0, 7) + "...",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: !value ? Colors.white : Colors.black54,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
