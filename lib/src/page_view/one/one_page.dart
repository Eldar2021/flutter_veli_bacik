import 'package:flutter/material.dart';
import 'package:flutter_300_400/src/page_view/one/cubit/one_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'one_screen.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint('build istadi OnePage');
    super.build(context);
    return BlocProvider(
      create: (context) => OneCubit()..fetch(),
      child: const OneScreen(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
