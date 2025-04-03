import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
// import 'package:media_kit_video/media_kit_video.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../screens/base_screen.dart';
import 'animated_splash.dart';
import 'flare_splash_screen.dart';
import 'lottie_splashscreen.dart';
import 'rive_splashscreen.dart';
import 'static_splashscreen.dart';

class SplashScreenIndex extends StatefulWidget {
  final Function actionDone;
  final String splashScreenType;
  final String imageUrl;
  final int duration;

  /// The manager and delivery apps do not load appConfig, so it cannot listen to the event `EventLoadedAppConfig` to navigate to the next screen
  final bool isLoadAppConfig;

  const SplashScreenIndex({
    super.key,
    required this.actionDone,
    required this.imageUrl,
    this.splashScreenType = SplashScreenTypeConstants.static,
    this.duration = 2000,
    this.isLoadAppConfig = true,
  });

  @override
  State<SplashScreenIndex> createState() => _SplashScreenIndexState();
}

class _SplashScreenIndexState extends State<SplashScreenIndex> {
  // late final player = Player();
  // late final controller = VideoController(player);
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // player.open(Media(
    //     "https://rawcdn.githack.com/EmpAsh938/FluxStore/0d06800dd707b1837c507d2232df9cc6e06e1d5c/assets/splash.mp4"));
    // 'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'));
    // 'assets/splash.mp4'));
    // Add onCompletion callback to navigate when the video ends
    // _controller. onCompletion(() {
    //   widget.actionDone(); // Trigger the action when video completes
    // });

    // player.stream.error.listen((_) {
    //   widget.actionDone();
    // });

    // player.stream.completed.listen((completed) {
    //   if (completed) {
    //     widget.actionDone();
    //   }
    // });

    _controller = VideoPlayerController.asset(
        'assets/splash.mp4') // Use network or file if needed
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        widget.actionDone(); // Navigate when video ends
      }
    });
  }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Transform.scale(
            alignment: Alignment.center,
            scale: 1.1,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      ),
    );

    if (kSplashScreen.enable) {
      final boxFit = ImageTools.boxFit(
        kSplashScreen.boxFit,
        defaultValue: BoxFit.contain,
      );
      final backgroundColor = HexColor(kSplashScreen.backgroundColor);
      final paddingTop = kSplashScreen.paddingTop;
      final paddingBottom = kSplashScreen.paddingBottom;
      final paddingLeft = kSplashScreen.paddingLeft;
      final paddingRight = kSplashScreen.paddingRight;
      switch (widget.splashScreenType) {
        case SplashScreenTypeConstants.rive:
          var animationName = kSplashScreen.animationName;
          return RiveSplashScreen(
            onSuccess: widget.actionDone,
            imageUrl: widget.imageUrl,
            animationName: animationName ?? 'fluxstore',
            duration: widget.duration,
            backgroundColor: backgroundColor,
            boxFit: boxFit,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            paddingLeft: paddingLeft,
            paddingRight: paddingRight,
          );
        case SplashScreenTypeConstants.flare:
          return SplashScreen.navigate(
            name: widget.imageUrl,
            startAnimation: kSplashScreen.animationName,
            backgroundColor: backgroundColor,
            boxFit: boxFit,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            paddingLeft: paddingLeft,
            paddingRight: paddingRight,
            next: widget.actionDone,
            until: () =>
                Future.delayed(Duration(milliseconds: widget.duration)),
          );
        case SplashScreenTypeConstants.lottie:
          return LottieSplashScreen(
            imageUrl: widget.imageUrl,
            onSuccess: widget.actionDone,
            duration: widget.duration,
            backgroundColor: backgroundColor,
            boxFit: boxFit,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            paddingLeft: paddingLeft,
            paddingRight: paddingRight,
          );
        case SplashScreenTypeConstants.fadeIn:
        case SplashScreenTypeConstants.topDown:
        case SplashScreenTypeConstants.zoomIn:
        case SplashScreenTypeConstants.zoomOut:
          return AnimatedSplash(
            imagePath: widget.imageUrl,
            animationEffect: widget.splashScreenType,
            next: widget.actionDone,
            duration: widget.duration,
            backgroundColor: backgroundColor,
            boxFit: boxFit,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            paddingLeft: paddingLeft,
            paddingRight: paddingRight,
          );
        case SplashScreenTypeConstants.static:
        default:
          return StaticSplashScreen(
            imagePath: widget.imageUrl,
            onNextScreen: widget.actionDone,
            duration: widget.duration,
            backgroundColor: backgroundColor,
            boxFit: boxFit,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            paddingLeft: paddingLeft,
            paddingRight: paddingRight,
          );
      }
    } else {
      return _EmptySplashScreen(
        onNextScreen: widget.actionDone,
        isLoadAppConfig: widget.isLoadAppConfig,
      );
    }
  }
}

class _EmptySplashScreen extends StatefulWidget {
  final Function? onNextScreen;
  final bool? isLoadAppConfig;

  const _EmptySplashScreen({
    this.onNextScreen,
    this.isLoadAppConfig,
  });

  @override
  _EmptySplashScreenState createState() => _EmptySplashScreenState();
}

class _EmptySplashScreenState extends BaseScreen<_EmptySplashScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    if (widget.isLoadAppConfig == true) {
      _subscription = eventBus.on<EventLoadedAppConfig>().listen(listener);
    } else {
      WidgetsBinding.instance.endOfFrame.then(listener);
    }
    super.initState();
  }

  void listener(_) {
    if (mounted) {
      widget.onNextScreen?.call();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: kLoadingWidget(context),
    );
  }
}
