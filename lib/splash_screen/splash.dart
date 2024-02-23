import 'package:flutter/material.dart';
import 'package:gym/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// / [AnimationController]s can be created with `vsync: this` because of
// / [TickerProviderStateMixin].
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true,period: const Duration(seconds: 2));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  void init(){
    super.initState();
    _controller.forward();
    _animation.addStatusListener((status) { 
      if(status ==AnimationStatus.completed){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/logo.png",
              width: 150,
              height: 150,
            )),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
