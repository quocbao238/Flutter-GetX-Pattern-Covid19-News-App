import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CustomWebView extends StatelessWidget {
  final ScrollController scrollController;
  final bool reverse;
  final String url;

  const CustomWebView({this.scrollController, this.reverse = false, this.url});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: CupertinoPageScaffold(
          navigationBar: _navigationBar(context),
          child: _body(context),
        ));
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: WebviewScaffold(hidden: true, url: url),
    );
  }

  Widget _navigationBar(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      padding: EdgeInsetsDirectional.zero,
      leading: IconButton(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(right: 64.0),
        icon: Icon(Icons.clear),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      trailing: IconButton(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.only(right: 64.0),
        icon: Icon(
          Icons.more_horiz,
          size: 20,
        ),
        onPressed: () {},
      ),
      middle: Container(
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.lock, color: Colors.green, size: 16.0),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text(
                      url,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                          fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
      // backgroundColor: Colors.red,
    );
  }
}