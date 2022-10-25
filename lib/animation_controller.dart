import 'package:flutter/material.dart';

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({super.key});

  @override
  State<AnimationControllerExample> createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 16).animate(controller)
      ..addStatusListener((status) => print('$status'))
      ..addListener(() {
        setState(() {
           print('value: ${animation.value}');
        });
       
      });
    controller.forward();
  }
 @override
  void dispose() {
	      controller.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Center(child: Transform(
      origin: const Offset(150,-150),
                alignment: Alignment.bottomLeft,
                transform: Matrix4.rotationZ(3.14*animation.value),
                //.skewY(animation.value),
                  // ..rotateZ(3.14 / 20)
                  // ..scale(1.2),
                child: Container(
                  width: 300,
                  height: 300,
                  padding: const EdgeInsets.all(8.0),
                  color: const Color.fromARGB(255, 247, 181, 152),
                  // ignore: unnecessary_const
                  child:  const Center(
                    child: Text('Animation', style: TextStyle(
                    color: Color.fromARGB(255, 72, 3, 249),
                    decorationColor: Color.fromARGB(255, 239, 187, 118),
                    decoration: TextDecoration.none),),
                  ),
                ),
              )
            )
    ;
  }
}
