import 'package:aqua_culture_app/features/common_role_features/welcome/views/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController = VideoPlayerController.asset(
      'assets/videos/splash.mp4',
    )..initialize().then((value) => setState(() {}));
    videoPlayerController?.play();
    videoPlayerController?.setLooping(true);
    gotoToLogin();
    super.initState();
  }

  Future<void> gotoToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: videoPlayerController?.value.isInitialized ?? false
            ? VideoPlayer(videoPlayerController!)
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/splash.png', fit: .cover),
              ),
      ),
    );
  }
}
