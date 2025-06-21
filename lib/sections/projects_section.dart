import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/fade_in_up_animation.dart';
import '../widgets/project_card.dart';

class ProjectsSectionContent extends StatelessWidget {
  const ProjectsSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      const Project(
        title: 'Nova AI Assistant',
        tagline: 'A voice-first conversational AI for mobile.',
        description: 'A sophisticated, cross-platform conversational AI assistant built with Flutter, leveraging Google\'s Gemini and Vertex AI APIs for real-time chat and generative image creation.',
        tags: ['Flutter', 'Gemini API', 'Google Cloud'],
        githubUrl: '#',
      ),
      const Project(
        title: 'Weather App',
        tagline: 'Clean, modern weather forecasting.',
        description: 'A sleek weather application that provides real-time weather data, hourly forecasts, and a 7-day outlook using the OpenWeatherMap API.',
        tags: ['Flutter', 'REST API', 'UI/UX'],
        githubUrl: '#',
      ),
      const Project(
        title: 'Currency Converter App',
        tagline: 'Real-time currency conversion.',
        description: 'A practical utility app for converting between multiple currencies with up-to-date exchange rates, featuring a simple and efficient user interface.',
        tags: ['Flutter', 'API', 'Mobile'],
        githubUrl: '#',
      ),
    ];

    return Wrap(
      spacing: 25,
      runSpacing: 25,
      alignment: WrapAlignment.center,
      children: projects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;
        return LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth > 900
                  ? (constraints.maxWidth / 3) - 20
                  : constraints.maxWidth > 600
                  ? (constraints.maxWidth / 2) - 20
                  : constraints.maxWidth,
              child: FadeInUpAnimation(
                key: ValueKey(project.title),
                delay: Duration(milliseconds: 50 * index),
                child: ProjectCard(
                  title: project.title,
                  tagline: project.tagline,
                  description: project.description,
                  tags: project.tags,
                  githubUrl: project.githubUrl,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}