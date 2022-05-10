import 'package:flutter/material.dart';

class RowolumnScreen extends StatelessWidget {
  const RowolumnScreen({Key? key}) : super(key: key);

  final items1 = const <FlutterLogo>[
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
  ];

  final items2 = const <FlutterLogo>[
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
    FlutterLogo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RowolumnScreen'),
      ),
      body: Center(
        child: Expanded(
          child: SizedBox(
            width: 192,
            height: 192,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: items1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: items2),
                    Column(children: items2),
                  ],
                ),
                Row(children: items1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
ffffffff
f      f
f      f
f      f
f      f
f      f
ffffffff
*/