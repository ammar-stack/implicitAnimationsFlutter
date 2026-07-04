import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggle;
 
  const AnimatedOpacityDemo({required this.isVisible, required this.onToggle});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AnimatedOpacity only animates the opacity value — the widget
        // still occupies layout space even when fully transparent.
        AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade400,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text('Now you see me! 👋',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: onToggle,
          icon: const Icon(Icons.visibility),
          label: Text(isVisible ? 'Fade Out' : 'Fade In'),
        ),
      ],
    );
  }
}