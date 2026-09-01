import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';


class SuccessLottieWidget extends ConsumerStatefulWidget {
  const SuccessLottieWidget({super.key});

  @override
  ConsumerState<SuccessLottieWidget> createState() =>
      _SuccessLottieWidgetState();
}

class _SuccessLottieWidgetState extends ConsumerState<SuccessLottieWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }
    @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
  //  final appTheme = ref.watch(appThemeProvider);
    return SizedBox(
      height: 80,
      child: Center(
        child: Lottie.asset(
          'assets/gifs/light.json',
          // appTheme.isDark
          //     ? 'assets/gifs/easyflip_dark_sucess.json'
          //     : 'assets/gifs/light.json',
          controller: _controller,
          repeat: true,
          onLoaded: (composition) {
     
            _controller
              ..duration = composition.duration
              ..repeat();
          },
        ),
      ),
    );
  }
}


class ErrorLottieWidget extends ConsumerStatefulWidget {
  const ErrorLottieWidget({super.key});

  @override
  ConsumerState<ErrorLottieWidget> createState() =>
      _ErrorLottieWidgetState();
}

class _ErrorLottieWidgetState extends ConsumerState<ErrorLottieWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }
  
    @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 //   final appTheme = ref.watch(appThemeProvider);
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: SizedBox(
        height: 80,
        child: Center(
          child: Lottie.asset(
            'assets/gifs/error_dark Mode.json',
            controller: _controller,
            repeat: true,
            onLoaded: (composition) {
       
              _controller
                ..duration = composition.duration
                ..repeat();
            },
          ),
        ),
      ),
    );
  }
}
