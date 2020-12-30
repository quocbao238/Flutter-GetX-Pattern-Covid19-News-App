import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:getXDemo/setting/setting.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Container(
        //   height: MediaQuery.of(context).padding.top,
        //   child: Container(
        //     color: Colors.black12,
        //   ),
        // ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.05,
            top: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.only(bottom: 16.0),
                //       child: Text(AppSetting.title,
                //           style: GoogleFonts.volkhov(
                //             fontSize: 34.0,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w500,
                //           )),
                //     ),
                //     // Expanded(
                //     //   child: Container(
                //     //     padding: EdgeInsets.all(24.0),
                //     //     child: SvgPicture.asset(AppSetting.iconLoadCovid),
                //     //   ),
                //     // )
                //   ],
                // ),
              ),
              Container(
                height: 120,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FlareActor("assets/flare/loading.flr",
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: 'Alarm'),
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: AppSetting.backgroundColor3,
                      highlightColor: AppSetting.backgroundColor1,
                      child: Text(
                        AppSetting.txtLoading,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
