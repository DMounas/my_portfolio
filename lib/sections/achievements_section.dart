import 'package:flutter/material.dart';
import '../models/achievement.dart';
import '../widgets/achievement_card.dart';
import '../widgets/fade_in_up_animation.dart';

class AchievementsSectionContent extends StatelessWidget {
  const AchievementsSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    const achievements = [
      Achievement(
        title: 'Robosoccer 2024 - 1st Runner Up',
        description: 'Built the tournament\'s most powerful ESP32-driven wireless bot—dominated until the finals\' wire-thin margin.',
        imageUrl: 'assets/images/robosoccer.jpeg',
        proofUrl: 'https://drive.google.com/file/d/1n0qQUS1kBfMFitCXQjbO9aBMbgn4kVEK/view?usp=sharing',
      ),
      Achievement(
        title: 'UI/UX Hackathon 2024 - 2nd Runner Up',
        description: 'Crafted a scheduling app that made time management look (almost) as good as my design.',
        imageUrl: 'assets/images/organiseme.jpeg',
        proofUrl: 'https://drive.google.com/file/d/1LEki36zcAIP5GWCCxU3wXJhGDBDQUUlr/view?usp=sharing',
      ),
      Achievement(
        title: 'Treasure Hunt - 1st Runner Up',
        description: 'Team Mugiwaras broke every puzzle before the winners broke our streak.',
        imageUrl: 'assets/images/rupy.jpeg',
        proofUrl: 'https://drive.google.com/file/d/1rTUp5KXbLBvJVkpoIGefuMdJGbnC_AsY/view?usp=sharing',
      ),
    ];

    return Wrap(
      spacing: 25,
      runSpacing: 25,
      alignment: WrapAlignment.center,
      children: achievements.asMap().entries.map((entry) {
        final index = entry.key;
        final achievement = entry.value;
        return FadeInUpAnimation(
          key: ValueKey(achievement.title),
          delay: Duration(milliseconds: 150 * index),
          child: AchievementCard(
            title: achievement.title,
            description: achievement.description,
            imageUrl: achievement.imageUrl,
            proofUrl: achievement.proofUrl,
          ),
        );
      }).toList(),
    );
  }
}