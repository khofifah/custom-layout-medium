import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextItem extends StatelessWidget {
  String value;

  TextItem({this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        value.tr(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
