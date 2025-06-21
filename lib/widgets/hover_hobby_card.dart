import 'package:flutter/material.dart';

class HoverHobbyCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final String hoverText;
  final String backgroundImageUrl;
  final String favoriteText;
  const HoverHobbyCard({
    super.key,
    required this.title,
    required this.icon,
    required this.hoverText,
    required this.backgroundImageUrl,
    required this.favoriteText,
  });
  @override
  State<HoverHobbyCard> createState() => _HoverHobbyCardState();
}

class _HoverHobbyCardState extends State<HoverHobbyCard> {
  bool _isActivated = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 600
        ? (screenWidth / 2) - 22
        : (screenWidth / 3) - 40;
    return GestureDetector(
      onTap: () => setState(() => _isActivated = !_isActivated),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isActivated = true),
        onExit: (_) => setState(() => _isActivated = false),
        cursor: SystemMouseCursors.click,
        child: Container(
          width: cardWidth,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: _isActivated
                ? Colors.white.withOpacity(0.1)
                : Colors.white.withOpacity(0.05),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            image: DecorationImage(
              image: AssetImage(widget.backgroundImageUrl),
              fit: BoxFit.cover,
              opacity: _isActivated ? 0.15 : 0.0,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.white70, size: 28),
              const SizedBox(height: 10),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: _isActivated
                    ? Column(
                        key: const ValueKey('expanded_content'),
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            widget.hoverText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.yellow.withOpacity(0.7),
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  widget.favoriteText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
