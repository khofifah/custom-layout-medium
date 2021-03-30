import 'package:belajar_flutter/services/remote/main_api.dart';
import 'package:belajar_flutter/widgets/loading.dart';
import 'package:belajar_flutter/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class DownloadFileScreen extends StatefulWidget {
  @override
  _DownloadFileScreenState createState() => _DownloadFileScreenState();
}

class _DownloadFileScreenState extends State<DownloadFileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Html Preview'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Download File'),
          onPressed: () async {
            showLoading(context);
            await MainApi()
                .downloadFile(
              'http://belajar.landa.co.id/flutter_api/assets/file/flutter/employee/27022021100549_KelasMobileMalang.pdf',
              'KelasMobileMalang',
            )
                .then((value) {
              if (value != null) {
                hideLoading(context);
                Popup.showFlushbar(context, 1, 'File berhasil di download');
                OpenFile.open(value);
              } else {
                hideLoading(context);
                Popup.showFlushbar(
                  context,
                  0,
                  'Data gagal di download, silahkan coba lagi..',
                );
              }
            });
          },
        ),
      ),
    );
  }
}
