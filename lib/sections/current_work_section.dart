import 'package:flutter/material.dart';
import '../widgets/fade_in_up_animation.dart';

class CurrentWorkSectionContent extends StatelessWidget {
  const CurrentWorkSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FadeInUpAnimation(
        key: const ValueKey('current_work_card'),
        delay: const Duration(milliseconds: 200),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'I am currently a sophomore pursuing a Bachelor of Technology, where I am building a strong foundation in software development principles. My primary focus right now is on mobile application development using Flutter. I dedicate my time to building real-world projects, deepening my understanding of Dart, and exploring advanced state management and UI design patterns to create beautiful and functional applications.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}