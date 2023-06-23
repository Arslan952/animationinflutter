import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Hook_Animation extends HookWidget {

  @override
  Widget build(BuildContext context) {
    var controller=useAnimationController(duration: const Duration(seconds: 3));
    controller.forward();
    return Scaffold(
      body: Center(
          child:GrowingCon(controller: controller,)
      ),
    );
  }
}

class GrowingCon extends AnimatedWidget {
  GrowingCon({required AnimationController controller})
      :super(listenable:Tween<double>(begin: 0,end:250).animate(controller));
  @override
  Widget build(BuildContext context) {
    Animation<double> animation=listenable as Animation<double>;
    return Container(
      height:animation.value ,
      width:animation.value ,
      color: Colors.orange,
    );
  }
}

