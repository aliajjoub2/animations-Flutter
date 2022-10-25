import 'package:flutter/material.dart';



class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.elasticIn,
          child: Container(
               decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: selected? const Color.fromARGB(255, 76, 248, 116) : const Color.fromARGB(255, 245, 245, 59),
          border: Border.all(
                  color: selected ? Colors.red : const Color.fromARGB(255, 103, 37, 37),
                  width: 30,
                ),
          ),
        ),
      ),
    ));
  }
}