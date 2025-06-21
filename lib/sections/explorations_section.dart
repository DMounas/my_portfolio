// import 'package:flutter/material.dart';
// import '../widgets/fade_in_up_animation.dart';

// class ExplorationsSectionContent extends StatelessWidget {
//   const ExplorationsSectionContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: FadeInUpAnimation(
//         key: const ValueKey('explorations_card'),
//         delay: const Duration(milliseconds: 200),
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: 800),
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.05),
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: Colors.white.withOpacity(0.1)),
//           ),
//           child: const Column(
//             children: [
//               Icon(Icons.explore_outlined, color: Colors.white70, size: 40),
//               SizedBox(height: 20),
//               Text('In The Lab', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
//               SizedBox(height: 8),
//               Text(
//                 'I\'m currently fascinated by the bridge between software and hardware. My focus is on learning robotics and IoT fundamentals to build some fun, real-world projects. Stay tuned!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }