import 'package:flutter/material.dart';
import '../widgets/fade_in_up_animation.dart';

class SkillsSectionContent extends StatelessWidget {
  const SkillsSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter', 'Dart', 'Firebase', 'UI/UX Design', 'Git',
      'C', 'C++', 'Arduino IDE', 'IoT', 'REST APIs', 'Figma', 'OnSpace', 'MATLAB', 'Mission Planner'
    ];

    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        alignment: WrapAlignment.center,
        children: skills.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          return FadeInUpAnimation(
            key: ValueKey(skill),
            delay: Duration(milliseconds: 40 * index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}