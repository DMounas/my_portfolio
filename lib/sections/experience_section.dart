import 'package:flutter/material.dart';
import '../widgets/fade_in_up_animation.dart';

class ExperienceSectionContent extends StatelessWidget {
  const ExperienceSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FadeInUpAnimation(
        key: const ValueKey('experience_card'),
        delay: const Duration(milliseconds: 200),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: const Column(
            children: [
              Icon(Icons.stream, color: Colors.white70, size: 40),
              SizedBox(height: 20),
              Text(
                'My Experience Philosophy',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(height: 15),
              Text(
                "My experience comes from dedicated, hands-on work. I go beyond my coursework to build real projects, turning theory into practical skill. I am now actively seeking an internship to apply this passion and dedication to solve real-world industry problems.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}