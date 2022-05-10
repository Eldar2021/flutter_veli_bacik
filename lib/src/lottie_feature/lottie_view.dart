import 'package:flutter/material.dart';
import 'package:flutter_300_400/src/constants/durations/durations.dart';
import 'package:flutter_300_400/src/constants/images/images.dart';
import 'package:flutter_300_400/src/constants/lotties/lotties.dart';
import 'package:flutter_300_400/src/extansion/context_extansion.dart';
import 'package:flutter_300_400/src/settings/settings_controller.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatefulWidget {
  const LottieView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final SettingsController controller;

  static const routeName = '/';

  @override
  State<LottieView> createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;
  bool isPhoto = false;
  bool isStatic = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: AppDuration.durationNormal(),
    );
    controller.animateTo(isLight ? 0.5 : 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('--------- runned build method -----------');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Example'),
        actions: [
          GestureDetector(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              Future.microtask(() {
                widget.controller.updateThemeMode(
                  isLight ? ThemeMode.light : ThemeMode.dark,
                );
                isLight = !isLight;
              });
            },
            child: Lottie.asset(
              Lotties.lottieTheme,
              repeat: false,
              controller: controller,
              width: context.width(0.4),
              height: double.infinity,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Lottie.asset(Lotties.lottieLoading)),
            Text(
              'Edliiar',
              style: context.headline6(),
            ),
            Center(
              child: Wrap(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoto = !isPhoto;
                        });
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.colorScheme().error,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: AnimatedCrossFade(
                          firstChild: SizedBox(
                            width: context.height() / 3,
                            height: context.height() / 3,
                          ),
                          secondChild: Image.asset(
                            AppImages.eldiiar,
                            width: context.height() / 3,
                            height: context.height() / 3,
                          ),
                          duration: const Duration(seconds: 1),
                          crossFadeState: isPhoto
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: context.height() / 3),
                      MyAnimatedContainer(
                        color: Colors.amberAccent,
                        height: isStatic
                            ? context.height() * 0.12
                            : context.height() * 0.01,
                      ),
                      MyAnimatedContainer(
                        color: Colors.blue,
                        height: isStatic
                            ? context.height() * 0.11
                            : context.height() * 0.01,
                      ),
                      MyAnimatedContainer(
                        color: Colors.brown,
                        height: isStatic
                            ? context.height() * 0.27
                            : context.height() * 0.01,
                      ),
                      MyAnimatedContainer(
                        color: Colors.tealAccent,
                        height: isStatic
                            ? context.height() * 0.3
                            : context.height() * 0.01,
                      ),
                      MyAnimatedContainer(
                        color: Colors.red,
                        height: isStatic
                            ? context.height() * 0.28
                            : context.height() * 0.01,
                      ),
                      MyAnimatedContainer(
                        color: Colors.orange,
                        height: isStatic
                            ? context.height() * 0.19
                            : context.height() * 0.01,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Lottie.asset(Lotties.lottieDrop)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isStatic = !isStatic;
          });
        },
        child: const Icon(Icons.upcoming_rounded),
      ),
    );
  }
}

class MyAnimatedContainer extends StatelessWidget {
  const MyAnimatedContainer({
    Key? key,
    required this.height,
    required this.color,
  }) : super(key: key);

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: context.width(0.25)),
      duration: const Duration(seconds: 1),
      width: context.width(0.10),
      height: height,
      color: color,
    );
  }
}
