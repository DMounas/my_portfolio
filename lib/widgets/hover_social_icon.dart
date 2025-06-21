import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart'; // To access _PortfolioHomeState for launching URL

class HoverSocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final String url;

  const HoverSocialIcon({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.url,
  });

  @override
  State<HoverSocialIcon> createState() => _HoverSocialIconState();
}

class _HoverSocialIconState extends State<HoverSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            (context.findAncestorStateOfType<PortfolioHomeState>())
                ?.launchURL(widget.url);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isHovered
                  ? Colors.cyanAccent.withOpacity(0.2)
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: FaIcon(widget.icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}