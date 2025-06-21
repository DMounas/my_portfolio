import 'package:flutter/material.dart';

class ResponsiveSection extends StatelessWidget {
  final Widget child;
  const ResponsiveSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: child,
      ),
    );
  }
}