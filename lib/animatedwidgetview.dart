import 'package:flutter/material.dart';

class AnimatedWidgetView extends StatefulWidget {
  const AnimatedWidgetView({super.key});

  @override
  State<AnimatedWidgetView> createState() => _AnimatedWidgetViewState();
}
late AnimationController controller;



class _AnimatedWidgetViewState extends State<AnimatedWidgetView> with TickerProviderStateMixin {
  @override
  void initState() {
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 3));
    controller.forward();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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

