import 'package:amplitude_flutter/identify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplitude_demo/analytics_config.dart';
import 'package:flutter_amplitude_demo/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Analytics_config().init();

  final Identify identify = Identify()
    ..set('노래 저장 수', 5)
    ..set('최고음', "2옥타브 시");
  Analytics_config.analytics.identify(identify);

  Analytics_config.analytics.logEvent("suhwanc");

  Analytics_config.analytics
      .logEvent("곡 추가", eventProperties: {"노래명": "오래된 노래", "가수": "스탠딩 에그"});

  identify.add('추가 이벤트 빈도', 1);
  Analytics_config.analytics.identify(identify);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Amplitude Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
