import 'package:belajar_flutter/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlScreen extends StatefulWidget {
  @override
  _HtmlScreenState createState() => _HtmlScreenState();
}

class _HtmlScreenState extends State<HtmlScreen> {
  var dataHtml = """
      <div>
        <h1>Kelas Mobile Malang</h1>
        <a href="https://www.qries.com/">
          <img alt="Qries" src="https://cdn-images-1.medium.com/max/166/1*8fKXA-WmjDwn1GznAyi9Zg@2x.png"
          width=150" height="70">
        </a>
        <h2>Kelas Flutter</h2>
        <p>Kelas Flutter merupakan salah satu kelas yang diselanggarakan oleh Kelas Mobile Malang dengan mentor berpengalaman dalam bidangnya</p>
        <h3>Features</h3>
        <ul>
          <li>Khofifah</li>
          <li>Mega</li>
          <li>Murfuyani</li>
        </ul>
        <a href="https://www.instagram.com/kelasmobilemalang/?hl=id">klik disini</a>
        <!--dan lain lain!-->
      </div>
    """;

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      AlertDialog(
        content: Text('Tidak bisa membuka halaman sponsor'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Html Preview'),
      ),
      body: Html(
        data: dataHtml,
        onLinkTap: (url) {
          launchURL(url);
        },
        style: {
          "div": Style(
            // backgroundColor: Colors.yellow,
            color: Colors.red,
            fontStyle: FontStyle.italic,
            // before: 'lalala',
            width: Sizes.s200,
            // height: Sizes.s100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            border: Border.all(width: 1),
            fontSize: FontSize.xxSmall,
          ),
        },
        onImageTap: (src) {
          // Display the image in large form.
        },
      ),
    );
  }
}
