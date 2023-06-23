import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class SequenceAnimationView extends StatefulWidget {
  const SequenceAnimationView({super.key});

  @override
  State<SequenceAnimationView> createState() => _SequenceAnimationViewState();
}

class _SequenceAnimationViewState extends State<SequenceAnimationView> with TickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;
  @override
  void initState() {
    controller=AnimationController(vsync: this);
    sequenceAnimation=SequenceAnimationBuilder()
    .addAnimatable(
        animatable:Tween<double>(begin: 0,end: 200),
        from: const Duration(milliseconds: 0),
        to: const Duration(milliseconds: 300), tag: 'grow')
    .addAnimatable(
        animatable:Tween<double>(begin: 0,end: 1),
        from: const Duration(milliseconds: 0),
        to: const Duration(milliseconds: 400), tag: 'fad_in')
    .addAnimatable(
        animatable:Tween<double>(begin:100,end: 0),
        from: const Duration(milliseconds:300),
        to: const Duration(milliseconds: 800), tag: 'margin-slides').animate(controller);
    controller.forward();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: sequenceAnimation['fad_in'].value,
              child: Container(
                margin: EdgeInsets.only(left: sequenceAnimation['margin-slides'].value),
                height: sequenceAnimation['grow'].value,
                width: sequenceAnimation['grow'].value,
                color: Colors.purple,
              ),
            );
          },
        ),
      ),
    );
  }
}
