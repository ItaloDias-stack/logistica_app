import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void loading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            color: Colors.blue[100],
            height: 200,
            width: 200,
            child: Center(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitPouringHourGlassRefined(
                      color: Colors.cyan.shade700, size: 50.0),
                  Text("Carregando")
                ],
              ),
            ),
          ),
        );
      });
}
