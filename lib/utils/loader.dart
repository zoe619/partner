import 'package:flutter/material.dart';
import 'package:simpleprogressdialog/builders/cupertino_dialog_builder.dart';
import 'package:simpleprogressdialog/builders/material_dialog_builder.dart';
import 'package:simpleprogressdialog/simpleprogressdialog.dart';

class Loader {
  ProgressDialog dialog;

  show(context, message) {
    dialog = ProgressDialog(context: context, barrierDismissible: false, elevation: 10.0);
    dialog.showAdaptive(
      backgroundColor: Theme.of(context).backgroundColor,
      message: message,
      centerTitle: true,
      layoutForIOS: CupertinoProgressDialogLayout.columnReveredWithCircularActivityIndicator,
      layoutForAndroid: MaterialProgressDialogLayout.columnReveredWithCircularProgressIndicator,
      messageStyle: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
    );
  }

  hide(context) {
    dialog.dismiss();
  }
}
