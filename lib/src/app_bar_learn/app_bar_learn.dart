import 'dart:math';

import 'package:flutter/material.dart';
import '../extansion/context_extansion.dart';

class AppBarLearnScreen extends StatefulWidget {
  const AppBarLearnScreen({Key? key}) : super(key: key);

  @override
  State<AppBarLearnScreen> createState() => _AppBarLearnScreenState();
}

class _AppBarLearnScreenState extends State<AppBarLearnScreen> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _color = Color(Random().nextInt(max(0xff000000, 0xffFFFFFF)));
          });
        },
      ),
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left_outlined),
        title: const Text('AppBarLearnScreen'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Center(
              child: SizedBox(
                width: context.width(index * 0.1),
                child: AppButton(title: 'Click', color: _color),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          fixedSize: const Size(100, 40),
          shape: const StadiumBorder(), 
        ),
        onPressed: () {},
        child: Text(title),
      ),
    );
  }
}
