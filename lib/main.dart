import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

// Import all your new sections and widgets
import 'sections/about_section.dart';
import 'sections/achievements_section.dart';
import 'sections/blogs_section.dart';
import 'sections/contact_section.dart';
import 'sections/current_work_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
//import 'sections/explorations_section.dart';
import 'sections/hero_section.dart';
import 'sections/hobbies_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'widgets/fade_in_up_animation.dart';
import 'widgets/responsive_section.dart';

class NavItem {
  final String title;
  final GlobalKey key;
  NavItem(this.title, this.key);
}

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 37, 11, 51),
        scaffoldBackgroundColor: const Color(0xFF0A1525),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'SF Pro Display',
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        cardColor: const Color(0xFF1A2B42),
        dividerColor: Colors.white12,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => PortfolioHomeState();
}

class PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _blogsKey = GlobalKey();
  final GlobalKey _hobbiesKey = GlobalKey();
  //final GlobalKey _explorationsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();

  late final List<NavItem> _navItems;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _navItems = [
      NavItem('About', _aboutKey),
      NavItem('Work', _workKey),
      NavItem('Skills', _skillsKey),
      NavItem('Projects', _projectsKey),
      NavItem('Achievements', _achievementsKey),
      NavItem('Experience', _experienceKey),
      NavItem('Education', _educationKey),
      NavItem('Blogs', _blogsKey),
      NavItem('Hobbies', _hobbiesKey),
      //NavItem('Explorations', _explorationsKey),
      NavItem('Contact', _contactKey),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not launch $urlString')));
      }
    }
  }

  Future<void> sendMessage() async {
    if (_isSending) return;
    setState(() => _isSending = true);

    const serviceId = 'service_nu3rtxi';
    const templateId = 'template_e3kcbpu';
    const publicKey = 'FK4yER5A0FG9YrgWq';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'template_params': {
            'from_name': _nameController.text,
            'name': _nameController.text,
            'email': _emailController.text,
            'title': 'New message from ${_nameController.text}',
            'message': _messageController.text,
          },
        }),
      );

      if (response.statusCode == 200) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send message: ${response.body}')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('An error occurred: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  Widget _buildSection(String title, Widget content, GlobalKey key) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: ResponsiveSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUpAnimation(
              key: ValueKey(title),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            content,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 92, 32, 161),
              Color(0xFF1A2B42),
              Color(0xFF2E4A6B),
            ],
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeroSection(
                key: _heroKey,
                navItems: _navItems,
                onNavItemTap: scrollToSection,
                onViewWorkTap: () => scrollToSection(_projectsKey),
                onContactTap: () => scrollToSection(_contactKey),
              ),
              _buildSection('About', const AboutSectionContent(), _aboutKey),
              _buildSection(
                'Current Work',
                const CurrentWorkSectionContent(),
                _workKey,
              ),
              _buildSection('Skills', const SkillsSectionContent(), _skillsKey),
              _buildSection(
                'Projects',
                const ProjectsSectionContent(),
                _projectsKey,
              ),
              _buildSection(
                'Achievements',
                const AchievementsSectionContent(),
                _achievementsKey,
              ),
              _buildSection(
                'Experience',
                const ExperienceSectionContent(),
                _experienceKey,
              ),
              _buildSection(
                'Education',
                const EducationSectionContent(),
                _educationKey,
              ),
              _buildSection('Blogs', const BlogsSectionContent(), _blogsKey),
              _buildSection(
                'Hobbies',
                const HobbiesSectionContent(),
                _hobbiesKey,
              ),
              //_buildSection('Current Explorations', const ExplorationsSectionContent(), _explorationsKey),
              _buildSection(
                'Contact',
                ContactSectionContent(
                  nameController: _nameController,
                  emailController: _emailController,
                  messageController: _messageController,
                  isSending: _isSending,
                  onSendMessage: sendMessage,
                  onLaunchURL: launchURL,
                ),
                _contactKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
