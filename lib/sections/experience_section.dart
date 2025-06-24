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
                "As a sophomore in my B.Tech program, my primary focus is on building a robust technical skill set. My experience is currently being forged through dedicated academic learning and self-directed projects. I view each project not just as a line on my resume, but as an opportunity to dive deeper into concepts, overcome challenges, and learn from my mistakes. This process is fundamental to my growth as a future software developer, and the projects showcased in this portfolio are a testament to my commitment to continuous learning and improvement.",
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