import 'package:flutter/material.dart';
import '../widgets/fade_in_up_animation.dart';

class EducationSectionContent extends StatelessWidget {
  const EducationSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final educations = [
      {'degree': 'Bachelor of Technology (B.Tech)', 'institution': 'NIT Silchar', 'period': '2024 - Present'},
      {'degree': 'AISSCE (Science)', 'institution': 'Hindustani Kendriya Vidyalaya', 'period': '2021 - 2023'},
      {'degree': 'High School Leaving Certificate', 'institution': 'St. Stephen\'s School', 'period': '2014 - 2021'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: educations.asMap().entries.map((entry) {
              final index = entry.key;
              final education = entry.value;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 15, right: index == educations.length - 1 ? 0 : 15),
                  child: FadeInUpAnimation(
                    key: ValueKey(education['institution']!),
                    delay: Duration(milliseconds: 100 * index),
                    child: _buildEducationCard(degree: education['degree']!, institution: education['institution']!, period: education['period']!),
                  ),
                ),
              );
            }).toList(),
          );
        }
        return Column(
          children: educations.asMap().entries.map((entry) {
            final index = entry.key;
            final education = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: FadeInUpAnimation(
                key: ValueKey(education['institution']!),
                delay: Duration(milliseconds: 100 * index),
                child: _buildEducationCard(degree: education['degree']!, institution: education['institution']!, period: education['period']!),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildEducationCard({required String degree, required String institution, required String period}) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(degree, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(institution, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(period, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}