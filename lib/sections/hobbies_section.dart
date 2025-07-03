import 'package:flutter/material.dart';
import '../models/hobby.dart';
import '../widgets/fade_in_up_animation.dart';
import '../widgets/hover_hobby_card.dart';

class HobbiesSectionContent extends StatelessWidget {
  const HobbiesSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final hobbies = [
      const Hobby(
        name: 'Anime',
        icon: Icons.live_tv_rounded,
        hoverText:
            'Annotating code by day, annotating anime plotholes by night.',
        backgroundImageUrl: 'assets/images/frieren.jpg',
        favoriteText: 'Favorite Anime: Frieren',
      ),
      const Hobby(
        name: 'Cycling',
        icon: Icons.directions_bike_rounded,
        hoverText: 'No Strava. Just Wind & Bad Decisions.',
        backgroundImageUrl: 'assets/images/cycle.jpg',
        favoriteText: 'I own: Triad',
      ),
      const Hobby(
        name: 'Music',
        icon: Icons.music_note,
        hoverText: 'Me: ‘Just one more commit’\nAlso me: plays ‘OHMAMI’ 17x',
        backgroundImageUrl: 'assets/images/chase.jpg',
        favoriteText: 'All time Favorite : Chase Atlantic',
      ),
      const Hobby(
        name: 'Cooking',
        icon: Icons.restaurant,
        hoverText: 'My love for rajma chawal is dependency: required..',
        backgroundImageUrl: 'assets/images/rajma.jpg',
        favoriteText: 'Favorite: Rajma Chawal',
      ),
      const Hobby(
        name: 'Reading',
        icon: Icons.book,
        hoverText:
            'Just finished "Project Hail Mary" by Andy Weir. Highly recommended!',
        backgroundImageUrl: 'assets/images/rupy.jpeg',
        favoriteText: 'Favorite Book: ---',
      ),
      const Hobby(
        name: 'Gaming',
        icon: Icons.games_outlined,
        hoverText: 'If my game sense was as sharp as my code...',
        backgroundImageUrl: 'assets/images/omen.jpg',
        favoriteText: 'Bottomfragger in Valorant',
      ),
    ];

    return Center(
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        alignment: WrapAlignment.center,
        children: hobbies.asMap().entries.map((entry) {
          final index = entry.key;
          final hobby = entry.value;
          return FadeInUpAnimation(
            key: ValueKey(hobby.name),
            delay: Duration(milliseconds: 100 * index),
            child: HoverHobbyCard(
              title: hobby.name,
              icon: hobby.icon,
              hoverText: hobby.hoverText,
              backgroundImageUrl: hobby.backgroundImageUrl,
              favoriteText: hobby.favoriteText,
            ),
          );
        }).toList(),
      ),
    );
  }
}
