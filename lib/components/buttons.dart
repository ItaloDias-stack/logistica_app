import 'package:flutter/material.dart';

class SimpleRoundButton extends StatelessWidget {
  final Color? cor;
  final Text? texto;
  final Function? onPressed;

  SimpleRoundButton({this.cor, this.texto, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
                overlayColor: MaterialStateProperty.all(this.cor),
                backgroundColor: MaterialStateProperty.all(this.cor),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: texto,
                  ),
                ],
              ),
              onPressed: () => onPressed!(),
            ),
          ),
        ],
      ),
    );
  }
}
