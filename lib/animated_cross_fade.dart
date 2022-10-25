import 'package:flutter/material.dart';


class AnimatedCrossfadeExample extends StatefulWidget {
  const AnimatedCrossfadeExample({super.key});
 
  @override
  State<AnimatedCrossfadeExample> createState() =>
      _AnimatedCrossfadeExampleState();
}

class _AnimatedCrossfadeExampleState extends State<AnimatedCrossfadeExample> {
   bool _firstChild = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Cross Fade'),
      ),
      body: AnimatedCrossFade(
        firstCurve: Curves.easeInCubic,
        secondCurve: Curves.easeInCirc,
        firstChild: InkWell(
          onTap: () {
            setState(() {
              _firstChild = !_firstChild;
            });
          },
          child: Container(
            alignment: Alignment.center,
            child: ClipOval(
              child: CircleAvatar(
                maxRadius: 100,
                child: Image.asset(
                  'assets/images/1.webp',
                  
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        secondChild: InkWell(
          onTap: () {
            setState(() {
              _firstChild = !_firstChild;
            });
          },
          child: Container(
            height: 250,
            width: 250,
            color: Colors.amberAccent.shade700,
            
            child: Image.asset(
              'assets/images/natur.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        crossFadeState: _firstChild ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
       
      ),
    );
  }
}
