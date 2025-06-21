import 'package:flutter/material.dart';
import '../widgets/fade_in_up_animation.dart';

class BlogsSectionContent extends StatelessWidget {
  const BlogsSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FadeInUpAnimation(
        key: const ValueKey('blogs_coming_soon'),
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
              Icon(Icons.draw_outlined, color: Colors.white70, size: 40),
              SizedBox(height: 20),
              Text('Coming Soon', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
              SizedBox(height: 8),
              Text(
                'I\'m currently working on articles about Flutter, full-stack development, and design. Stay tuned!',
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