// In lib/sections/about_section.dart

import 'package:flutter/material.dart';
import '../widgets/fade_in_up_animation.dart';

class AboutSectionContent extends StatelessWidget {
  const AboutSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    // This Column contains the actual content of the section.
    // The title and padding are handled by the _buildSection frame in main.dart
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FadeInUpAnimation(
          key: ValueKey('about_p1'),
          delay: Duration(milliseconds: 200),
          child: Text(
            'I\'ve always been driven by the desire to build things—to take a creative spark and shape it into something tangible and useful. For me, technology is the ultimate creative canvas, and I found my passion at the intersection of elegant design and powerful functionality.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const FadeInUpAnimation(
          key: ValueKey('about_p2'),
          delay: Duration(milliseconds: 400),
          child: Text(
            'This is why I\'m so drawn to App Development and UI/UX. I believe an application should not only work flawlessly but also feel intuitive and delightful to use. I\'m currently honing this craft as a engineering student, with a deep focus on building beautiful, responsive apps with Flutter. Away from the keyboard, my curiosity leads me to the world of F1 engineering and hands-on robotics projects, which constantly inspire my approach to problem-solving. I\'m excited to continue learning, building, and finding new creative challenges to tackle.',
            style: TextStyle(color: Colors.white60, fontSize: 16, height: 1.6),
          ),
        ),
      ],
    );
  }
}
