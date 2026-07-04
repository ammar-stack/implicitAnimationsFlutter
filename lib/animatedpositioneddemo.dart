import 'package:flutter/material.dart';

class AnimatedPositionedDemo extends StatelessWidget {
  final bool isAtTop;
  final VoidCallback onMove;
 
  const AnimatedPositionedDemo({required this.isAtTop, required this.onMove});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              // AnimatedPositioned MUST be a direct child of a Stack.
              // It animates the top/bottom/left/right offsets.
              AnimatedPositioned(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOutBack,
                top: isAtTop ? 10 : 110,
                left: isAtTop ? 10 : 200,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.tonalIcon(
          onPressed: onMove,
          icon: const Icon(Icons.arrow_upward),
          label: const Text('Move Ball'),
        ),
      ],
    );
  }
}