import 'package:belajar_flutter/screens/add_photo.dart';
import 'package:belajar_flutter/screens/calendar_screen.dart';
import 'package:belajar_flutter/screens/download_file_screen.dart';
import 'package:belajar_flutter/screens/embed_camera.dart';
import 'package:belajar_flutter/screens/html_screen.dart';
import 'package:belajar_flutter/screens/locales_screen.dart';
import 'package:belajar_flutter/screens/pdf_view_screen.dart';
import 'package:belajar_flutter/screens/webview_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    EasyLocalization(
      path: 'assets/locales',
      supportedLocales: [Locale('id', 'ID'), Locale('en', 'US')],
      startLocale: Locale('id', 'ID'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: DownloadFileScreen(),
    );
  }
}
