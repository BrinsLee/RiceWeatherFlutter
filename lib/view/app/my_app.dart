import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_weather/view/common/loading_dialog.dart';
import 'package:rice_weather/view/pages/home/home_page.dart';

GlobalKey globalKey = GlobalKey();
EventBus eventBus = EventBus();
LoadingDialog loading;

void showAppDialog({String loadingMsg = "正在加载中..."}) {
  loading = new LoadingDialog(
    text: loadingMsg,
  );
  showDialog<LoadingDialog>(
      context: globalKey.currentContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return loading;
      });
}

void hideAppDialog() {
  loading.dismiss();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '米粒天气',
      color: Colors.blue,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          child: HomePage(
            key: globalKey,
          ),
          value: SystemUiOverlayStyle.light),
    );
  }
}
