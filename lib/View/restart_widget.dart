import 'package:flutter/material.dart';
import 'package:flutter_project/Controller/controller.dart';

class RestartWidget extends StatelessWidget {
  VoidCallback resetCallBack;

  RestartWidget(this.resetCallBack, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        TextButton(onPressed: resetCallBack, child: Text("Recommencer")),
      ],
    );
  }
}
