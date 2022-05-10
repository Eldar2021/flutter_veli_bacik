import 'package:flutter/material.dart';
import 'package:flutter_300_400/src/extansion/context_extansion.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet learning'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showSearch(context: context, delegate: MySearchDelegate());
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(height: context.width(1));
            },
          );
        },
        child: const Icon(Icons.share_arrival_time),
      ),
    );
  }
}
