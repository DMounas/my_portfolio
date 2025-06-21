import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/fade_in_up_animation.dart';
import '../widgets/hover_social_icon.dart';
import '../widgets/interactive_send_button.dart';

class ContactSectionContent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final bool isSending;
  final VoidCallback onSendMessage;
  final Function(String) onLaunchURL;

  const ContactSectionContent({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.isSending,
    required this.onSendMessage,
    required this.onLaunchURL,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Column(
            children: [
              FadeInUpAnimation(
                key: const ValueKey('contact_form'),
                delay: const Duration(milliseconds: 200),
                child: _buildContactForm(),
              ),
              const SizedBox(height: 40),
              FadeInUpAnimation(
                key: const ValueKey('contact_info'),
                delay: const Duration(milliseconds: 400),
                child: _buildContactInfo(),
              ),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: FadeInUpAnimation(
                key: const ValueKey('contact_form_desktop'),
                delay: const Duration(milliseconds: 200),
                child: _buildContactForm(),
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: FadeInUpAnimation(
                key: const ValueKey('contact_info_desktop'),
                delay: const Duration(milliseconds: 400),
                child: _buildContactInfo(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send Message',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 25),
          _buildTextField('Name', controller: nameController),
          const SizedBox(height: 20),
          _buildTextField('Email', controller: emailController),
          const SizedBox(height: 20),
          _buildTextField(
            'Message',
            controller: messageController,
            maxLines: 5,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: InteractiveSendButton(
              text: 'Send Message',
              isLoading: isSending,
              onTap: onSendMessage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get in Touch',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 25),
          _buildContactItem(Icons.email, 'debangshumounas.dev@gmail.com'),
          const SizedBox(height: 15),
          _buildContactItem(Icons.phone, '+91 9395240600'),
          const SizedBox(height: 15),
          _buildContactItem(Icons.location_on, 'Guwahati, Assam'),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    HoverSocialIcon(
                      icon: FontAwesomeIcons.github,
                      tooltip: 'GitHub',
                      url: 'https://github.com/DMounas',
                    ),
                    SizedBox(width: 15),
                    HoverSocialIcon(
                      icon: FontAwesomeIcons.linkedinIn,
                      tooltip: 'LinkedIn',
                      url:
                          'https://www.linkedin.com/in/debangshu-mounas-3b273b317/',
                    ),
                    SizedBox(width: 15),
                    HoverSocialIcon(
                      icon: FontAwesomeIcons.twitter,
                      tooltip: 'Twitter',
                      url: 'https://x.com/_d_mounas_',
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    HoverSocialIcon(
                      icon: FontAwesomeIcons.instagram,
                      tooltip: 'Instagram',
                      url: 'https://www.instagram.com/_d_mounas_/profilecard/',
                    ),
                    SizedBox(width: 15),
                    HoverSocialIcon(
                      icon: FontAwesomeIcons.discord,
                      tooltip: 'Discord',
                      url: 'https://discord.gg/NPG2NXAJ',
                    ),
                    SizedBox(width: 15),
                    HoverSocialIcon(
                      icon: FontAwesomeIcons.facebookF,
                      tooltip: 'Facebook',
                      url:
                          'https://www.facebook.com/profile.php?id=61561971812602&mibextid=ZbWKwL',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => onLaunchURL(
              'https://drive.google.com/file/d/1aVcTa-zjQMVtTRHwxtjB6WQVxzEthoDo/view?usp=sharing',
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyanAccent.withOpacity(0.3),
                    Colors.blueAccent.withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Text(
                'Download Resume',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 12),
        Text(text, style: TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
