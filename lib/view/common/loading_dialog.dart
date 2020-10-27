import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final String text;

  LoadingDialog({this.text});
  Function dismiss;
  @override
  Widget build(BuildContext context) {
    dismiss = () => Navigator.of(context).pop();
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: Container(
            decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(text),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
