import 'package:flutter/material.dart';

class TransformExample extends StatelessWidget {
  const TransformExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Creates a widget that transforms its child using a rotation around the center.
            //https://api.flutter.dev/flutter/widgets/Transform/Transform.rotate.html
            Container(
              width: 100,
              height: 100,
              color: Colors.amber,
              child: Transform.rotate(
                origin: const Offset(50.0,-50.0),
                angle: 3.14 / 10,
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  color: Color.fromARGB(255, 245, 178, 149),
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // start transform
            Container(
              color: Colors.black,
              width: 100,
              height: 100,
              child: Transform(
                alignment: Alignment.bottomLeft,
                transform: Matrix4.skewY(0.3)
                  ..rotateZ(3.14 / 20)
                  ..scale(1.2),
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  color: Color.fromARGB(255, 247, 181, 152),
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // https://api.flutter.dev/flutter/widgets/Transform/Transform.scale.html
            //Creates a widget that scales its child along the 2D plane.
            Transform.scale(
              scale: 0.5,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color.fromARGB(255, 30, 11, 4),
                child: const Text('Ali Transform'),
              ),
            ),
            Transform.translate(
              offset: const Offset(150.0, 100.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color(0xFF7F7F7F),
                child: const Text('Quarter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
