import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;
 
  const AnimatedContainerDemo({required this.isExpanded, required this.onTap});
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        // AnimatedContainer watches its properties (width, height, color,
        // borderRadius) and animates between old/new values automatically.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          width: isExpanded ? 220 : 120,
          height: isExpanded ? 120 : 80,
          decoration: BoxDecoration(
            color: isExpanded ? Colors.deepPurple : Colors.pinkAccent,
            borderRadius: BorderRadius.circular(isExpanded ? 12 : 40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            'Tap me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: isExpanded ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}