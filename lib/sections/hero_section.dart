import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart'; // For NavItem
import '../widgets/fade_in_up_animation.dart';

class HeroSection extends StatefulWidget {
  final List<NavItem> navItems;
  final void Function(GlobalKey) onNavItemTap;
  final VoidCallback onViewWorkTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.navItems,
    required this.onNavItemTap,
    required this.onViewWorkTap,
    required this.onContactTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    _slideController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    _scaleController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut));
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.8), end: Offset.zero).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut));

    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: FadeTransition(opacity: _fadeAnimation, child: _buildNavigation(context)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: 40),
                _buildHeroText(context),
                const SizedBox(height: 30),
                _buildHeroCTA(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) return _buildMobileNav(context);
          return _buildDesktopNav();
        },
      ),
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Portfolio', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
        Row(
          children: widget.navItems.map((item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildNavItem(item.title, () => widget.onNavItemTap(item.key)),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Portfolio', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _showMobileMenu(context),
        ),
      ],
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    bool isEnabled = title != 'Blogs';
    return InkWell(
      onTap: isEnabled ? () { HapticFeedback.selectionClick(); onTap(); } : null,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(title, style: TextStyle(color: isEnabled ? Colors.white70 : Colors.white38, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF1A2B42), Color(0xFF0A1525)]),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.circular(2)),
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Column(
                      children: widget.navItems.map((item) => ListTile(
                        title: Text(item.title, style: const TextStyle(color: Colors.white, fontSize: 16)),
                        onTap: () { Navigator.pop(context); widget.onNavItemTap(item.key); },
                      )).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [Colors.cyanAccent.withOpacity(0.8), Colors.blueAccent.withOpacity(0.6), Colors.purpleAccent.withOpacity(0.4)]),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.5), width: 2),
          boxShadow: [BoxShadow(color: Colors.cyanAccent.withOpacity(0.3), blurRadius: 20, spreadRadius: 5)],
        ),
        child: const Icon(Icons.person, color: Colors.white, size: 40),
      ),
    );
  }

  Widget _buildHeroText(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Text('Debangshu Mounas', style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width < 600 ? 32 : 48, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
            const SizedBox(height: 10),
            const Text('Flutter Developer', style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCTA() {
    return FadeInUpAnimation(
      key: const ValueKey('hero_cta'),
      delay: const Duration(milliseconds: 600),
      offset: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton('View Work', widget.onViewWorkTap),
          const SizedBox(width: 20),
          _buildButton('Contact', widget.onContactTap, outlined: true),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onTap, {bool outlined = false}) {
    return GestureDetector(
      onTap: () { HapticFeedback.lightImpact(); onTap(); },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: outlined ? null : LinearGradient(colors: [Colors.cyanAccent.withOpacity(0.3), Colors.blueAccent.withOpacity(0.2)]),
          color: outlined ? Colors.transparent : null,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: outlined ? Colors.cyanAccent.withOpacity(0.5) : Colors.transparent, width: outlined ? 1.5 : 0),
          boxShadow: outlined ? null : [BoxShadow(color: Colors.cyanAccent.withOpacity(0.2), blurRadius: 10, spreadRadius: 2)],
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}