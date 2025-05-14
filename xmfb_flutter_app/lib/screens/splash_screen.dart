import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  int _step = 0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/splash.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {}); // Trigger build with video
      });

    _controller.setLooping(false);

    _startTextSequence();
  }

  void _startTextSequence() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _step = 1);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _step = 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🔊 Background Video
          if (_controller.value.isInitialized)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),

          // ✨ Text Overlay
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _step < 1 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    'XMFB',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 8,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _step == 1 || _step == 2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    'the power of together',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  opacity: _step == 2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    'press any key to begin',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
