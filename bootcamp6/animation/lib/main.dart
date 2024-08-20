import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: const Center(
            child: AnimationDemo(),
          ),
        ));
  }
}

// implicit animation
class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 200),
        width: isExpanded ? 200 : 100,
        height: isExpanded ? 200 : 100,
        color: isExpanded ? Colors.blue : Colors.red,
        child: FlutterLogo(),
      ),
    );
  }
}

// explicit animation
// class AnimationDemo extends StatefulWidget {
//   const AnimationDemo({super.key});

//   @override
//   State<AnimationDemo> createState() => _AnimationDemoState();
// }

// class _AnimationDemoState extends State<AnimationDemo>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat(reverse: true);
//     _animation =
//         CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Text("Basic Animation"),
//           AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _animation.value,
//                 child: child,
//               );
//             },
//             child: Container(
//               width: 200,
//               height: 200,
//               color: Colors.blue,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
