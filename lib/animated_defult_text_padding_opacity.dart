import 'package:flutter/material.dart';

class AnimatedDefultTextExample extends StatefulWidget {
  const AnimatedDefultTextExample({super.key});

  @override
  State<AnimatedDefultTextExample> createState() =>
      _AnimatedDefultTextExampleState();
}

class _AnimatedDefultTextExampleState extends State<AnimatedDefultTextExample> {
  bool isbottom = false;

  // padding
  double padValue = 10.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  // Opacity
  double opacityLevel = 1.0;
  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  // PhysicalModel
  BoxShape shape = BoxShape.rectangle;
  Color color = Colors.white;
  double elevation = 6.0;
  // animated Position
  double top = 0;
  double right = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 2),
              style: TextStyle(
                  color: isbottom ? Colors.red : Colors.green,
                  fontSize: isbottom ? 30 : 20,
                  fontWeight: isbottom ? FontWeight.bold : FontWeight.w200),
              curve: Curves.elasticIn,
              child: const Text('Animated Default Text Style Ali Ajjoub'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: (() => setState(() {
                      isbottom = !isbottom;
                    })),
                child: const Text('Animate')),

            // start animated Padding
            AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  color: Colors.blue,
                  child: const Center(
                      child: Text(
                    'Animated Padding',
                    style: TextStyle(
                        color: Color.fromARGB(255, 18, 1, 255),
                        decorationColor: Color.fromARGB(255, 239, 187, 118),
                        decoration: TextDecoration.none),
                  ))),
            ),
            Text(
              'Padding: $padValue',
              style: const TextStyle(
                  color: Color.fromARGB(255, 72, 3, 249),
                  decorationColor: Color.fromARGB(255, 239, 187, 118),
                  decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                child: const Text('Change padding'),
                onPressed: () {
                  _updatePadding(padValue == 10.0 ? 100.0 : 10.0);
                }),

            const SizedBox(
              height: 30,
            ),

            // start animated Aupacity
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 3),
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/n2.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: _changeOpacity,
              child: const Text('Fade Foto || AnimatedOpacity'),
            ),
            const SizedBox(
              height: 30,
            ),

            AnimatedPhysicalModel(
              shape: shape,
              elevation: elevation,
              color: color,
              shadowColor: Colors.red,
              duration: const Duration(seconds: 2),
              child: const SizedBox(
                height: 120.0,
                width: 120.0,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  shape = shape == BoxShape.rectangle
                      ? BoxShape.circle
                      : BoxShape.rectangle;
                  color = color == Colors.white ? Colors.blue : Colors.white;
                  elevation = elevation == 6.0 ? 12.0 : 6.0;
                });
              },
              child: const Text('AnimatedPhysicalModel '),
            ),

            // start animatedpositio
            const SizedBox(
              height: 30,
            ),

            Container(
                height: 300,
                width: 300,
                color: Colors.red,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        duration: const Duration(seconds: 2),
                        curve: Curves.elasticInOut,
                        right: right,
                        top: top,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: const Color.fromARGB(255, 58, 111, 59),
                        ))
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    right = right == 0 ? 200 : 0;
                    top = top == 0 ? 200 : 0;
                  });
                },
                child: const Text('AnimatedPositioned')),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
