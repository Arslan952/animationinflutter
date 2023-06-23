import 'package:flutter/material.dart';

class GrowingAnimation extends StatefulWidget {
  const GrowingAnimation({super.key});

  @override
  State<GrowingAnimation> createState() => _GrowingAnimationState();
}
late AnimationController controller;
late Animation growinganimation;


class _GrowingAnimationState extends State<GrowingAnimation> with TickerProviderStateMixin {
  @override
  void initState() {
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 3))
    ..addListener(() { setState(() {

    });});
    growinganimation=Tween<double>(begin: 0,end: 200).animate(controller);
    controller.forward();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height:growinganimation.value ,
          width:growinganimation.value ,
          color: Colors.orange,
        ),
      ),
    );
  }
}
