import 'package:flutter/material.dart';


class AnimatedSwitcherDemo extends StatelessWidget {
  final bool showIcon;
  final VoidCallback onSwitch;
 
  const AnimatedSwitcherDemo({required this.showIcon, required this.onSwitch});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AnimatedSwitcher cross-fades between children. Each child needs a
        // unique Key so Flutter can detect that the widget actually changed.
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: showIcon
              ? const Icon(Icons.favorite,
                  key: ValueKey('icon'), color: Colors.red, size: 56)
              : const Text(
                  'Liked!',
                  key: ValueKey('text'),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: onSwitch,
          icon: const Icon(Icons.swap_horiz),
          label: const Text('Switch Widget'),
        ),
      ],
    );
  }
}