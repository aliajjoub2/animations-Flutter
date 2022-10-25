import 'package:animationflutter/animated_container.dart';
import 'package:animationflutter/transform.dart';
import 'package:flutter/material.dart';

import 'animated_cross_fade.dart';
import 'animated_defult_text_padding_opacity.dart';
import 'animation_controller.dart';



void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Page1(),
    ),
  );
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
       
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                alignment: Alignment.topCenter,
                //padding: const EdgeInsets.symmetric(vertical: 10),
                height: 80,
                width: 700,
                child: Scrollbar(
                  controller: _firstController,
                  child: ListView(
                    controller: _firstController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TransformExample()),
                          );
                        },
                        child: const Text('Go Transform'),
                      ),
                      const SizedBox(width: 30,),
                        
                       ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnimatedContainerExample()),
                          );
                        },
                        child: const Text('Go Animated Container'),
                      ),
                      const SizedBox(width: 30,),
                        
                       ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnimatedCrossfadeExample()),
                          );
                        },
                        child: const Text('Go Animated AnimatedCrossfade'),
                      ),
                        const SizedBox(width: 30,),
                        
                       ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnimationControllerExample()),
                          );
                        },
                        child: const Text('Go AnimationControllerExample'),
                      ),
                      
                       const SizedBox(width: 30,),
                        
                       ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnimatedDefultTextExample()),
                          );
                        },
                        child: const Text('Go More Animations'),
                      ),
                    ],
                  ),
                ),
              ),
                const SizedBox(
                height: 30,
                width: double.infinity*0.90,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute(const Page2()));
                },
                child: const Text('Go Slide Transition'),
              ),
              const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRouteScale(const Page2()));
                },
                child: const Text('Go Scale Transition'),
              ),
               const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRouteRotation(const Page2()));
                },
                child: const Text('Go Rotation Transition'),
              ),
               const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRouteSize(const Page2()));
                },
                child: const Text('Go Size Transition'),
              ),
                const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRouteFade(const Page2()));
                },
                child: const Text('Go Fade Transition'),
              ),
                const SizedBox(
                height: 30,
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRouteTwoTransition(const Page2()));
                },
                child: const Text('Go Two Transition'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  
  
  return PageRouteBuilder(
     
    transitionDuration:  const Duration(milliseconds: 2000),
    reverseTransitionDuration: const Duration(milliseconds: 2000),
    barrierColor: Colors.amberAccent, // The color to use for the modal barrier. If this is null, the barrier will be transparent.
     barrierLabel: 'Ali Ajjoub Animation', // The semantic label used for a dismissible barrier.

    pageBuilder: (context, animation, secondaryAnimation) =>  page, // Used build the route's primary contents

    // secondaryAnimation → Animation<double>?
    // The animation for the route being pushed on top of this route. This animation lets this route coordinate with the entrance and exit transition of route pushed on top of this route.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticOut;
      

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },

  );
}

Route _createRouteScale(Widget page) {
  return PageRouteBuilder(
     
    transitionDuration:  const Duration(milliseconds: 2000),
    reverseTransitionDuration: const Duration(milliseconds: 3000),
    barrierColor: Colors.amberAccent, // The color to use for the modal barrier. If this is null, the barrier will be transparent.
     barrierLabel: 'Ali Ajjoub Animation', // The semantic label used for a dismissible barrier.

    pageBuilder: (context, animation, secondaryAnimation) =>  page, // Used build the route's primary contents

    // secondaryAnimation → Animation<double>?
    // The animation for the route being pushed on top of this route. This animation lets this route coordinate with the entrance and exit transition of route pushed on top of this route.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.elasticOut;
      

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return ScaleTransition(
        scale: animation.drive(tween),
        child: child,
      );
    },

  );
}

Route _createRouteRotation(Widget page) {
  return PageRouteBuilder(
     
    transitionDuration:  const Duration(milliseconds: 3000),
    reverseTransitionDuration: const Duration(milliseconds: 3000),
    barrierColor: Colors.amberAccent, // The color to use for the modal barrier. If this is null, the barrier will be transparent.
     barrierLabel: 'Ali Ajjoub Animation', // The semantic label used for a dismissible barrier.

    pageBuilder: (context, animation, secondaryAnimation) =>  page, // Used build the route's primary contents

    // secondaryAnimation → Animation<double>?
    // The animation for the route being pushed on top of this route. This animation lets this route coordinate with the entrance and exit transition of route pushed on top of this route.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.elasticOut;
      

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return RotationTransition(
        turns: animation.drive(tween),
        child: child,
      );
    },

  );
}
// start sizeTransition 
Route _createRouteSize(Widget page) { 
  return PageRouteBuilder(
     
    transitionDuration:  const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    barrierColor: Colors.amberAccent, // The color to use for the modal barrier. If this is null, the barrier will be transparent.
     barrierLabel: 'Ali Ajjoub Animation', // The semantic label used for a dismissible barrier.

    pageBuilder: (context, animation, secondaryAnimation) =>  page, // Used build the route's primary contents

    // secondaryAnimation → Animation<double>?
    // The animation for the route being pushed on top of this route. This animation lets this route coordinate with the entrance and exit transition of route pushed on top of this route.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInToLinear;
      

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return Align(
        alignment: Alignment.topCenter,
        child: SizeTransition(
          sizeFactor: animation.drive(tween),
          child: child,
        ),
      );
    },

  );
}
// start fadeTransition 
Route _createRouteFade(Widget page) { 
  return PageRouteBuilder(
     
    transitionDuration:  const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    barrierColor: Colors.amberAccent, // The color to use for the modal barrier. If this is null, the barrier will be transparent.
     barrierLabel: 'Ali Ajjoub Animation', // The semantic label used for a dismissible barrier.

    pageBuilder: (context, animation, secondaryAnimation) =>  page, // Used build the route's primary contents

    // secondaryAnimation → Animation<double>?
    // The animation for the route being pushed on top of this route. This animation lets this route coordinate with the entrance and exit transition of route pushed on top of this route.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInToLinear;
      

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return  FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        
      );
    },

  );
}

// start Two togther Transition
Route _createRouteTwoTransition(Widget page) {
  return PageRouteBuilder(
     
    transitionDuration:  const Duration(milliseconds: 2000),
    reverseTransitionDuration: const Duration(milliseconds: 3000),
    barrierColor: Colors.amberAccent, // The color to use for the modal barrier. If this is null, the barrier will be transparent.
     barrierLabel: 'Ali Ajjoub Animation', // The semantic label used for a dismissible barrier.

    pageBuilder: (context, animation, secondaryAnimation) =>  page, // Used build the route's primary contents

    // secondaryAnimation → Animation<double>?
    // The animation for the route being pushed on top of this route. This animation lets this route coordinate with the entrance and exit transition of route pushed on top of this route.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.elasticOut;
      

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return ScaleTransition(
        scale: animation.drive(tween),
        child: RotationTransition(
        turns: animation.drive(tween),
        child: child,
      ),
      );
    },

  );
}

// start Page 2
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 220, 159, 255),
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Page Example page Route Animation', style: TextStyle(color: Color.fromARGB(255, 255, 7, 98)),),
        ),
      ),
    );
  }
}
