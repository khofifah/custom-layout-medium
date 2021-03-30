import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewScreen extends StatefulWidget {
  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Pdf View'),
      ),
      body: PDF(
        // fitEachPage: true
        // enableSwipe: true,
        // swipeHorizontal: true,
        // autoSpacing: true,
        pageFling: true,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onPageChanged: (int page, int total) {
          print('page change: $page/$total');
        },
        defaultPage: 1,
      ).cachedFromUrl('http://africau.edu/images/default/sample.pdf'),
    );
// PDF(
//   enableSwipe: true,
//   swipeHorizontal: true,
//   autoSpacing: false,
//   pageFling: false,
//   onError: (error) {
//     print(error.toString());
//   },
//   onPageError: (page, error) {
//     print('$page: ${error.toString()}');
//   },
//   onPageChanged: (int page, int total) {
//     print('page change: $page/$total');
//   },
// ).fromAsset('assets/sample.pdf'),
  }
}
