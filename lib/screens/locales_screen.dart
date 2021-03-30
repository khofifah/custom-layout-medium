import 'package:belajar_flutter/widgets/text_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalesScreen extends StatefulWidget {
  @override
  _LocalesScreenState createState() => _LocalesScreenState();
}

class _LocalesScreenState extends State<LocalesScreen> {
  bool isID = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locales'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextItem(value: 'name'),
            TextItem(value: 'gender'),
            TextItem(value: 'age'),
            TextItem(value: 'favorite'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(isID == true ? 'English' : 'Indonesia'),
              onPressed: () {
                context.locale =
                    isID == true ? Locale('en', 'US') : Locale('id', 'ID');
                setState(() {
                  isID = !isID;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
