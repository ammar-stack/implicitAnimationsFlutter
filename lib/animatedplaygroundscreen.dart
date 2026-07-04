import 'package:flutter/material.dart';
import 'package:practise_animations/animatedcontainerdemo.dart';
import 'package:practise_animations/animatedopacitydemo.dart';
import 'package:practise_animations/animatedpositioneddemo.dart';
import 'package:practise_animations/animatedswitcherdemo.dart';

class AnimationPlaygroundScreen extends StatefulWidget {
  const AnimationPlaygroundScreen({super.key});
 
  @override
  State<AnimationPlaygroundScreen> createState() =>
      _AnimationPlaygroundScreenState();
}
 
class _AnimationPlaygroundScreenState
    extends State<AnimationPlaygroundScreen> {
  // ── State for AnimatedContainer ──
  bool _isBoxExpanded = false;
 
  // ── State for AnimatedOpacity ──
  bool _isVisible = true;
 
  // ── State for AnimatedSwitcher ──
  bool _showIcon = true;
 
  // ── State for AnimatedPositioned ──
  bool _isBallAtTop = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation Playground'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildIntro(),
          const SizedBox(height: 24),
          _SectionCard(
            title: '1. AnimatedContainer',
            explanation:
                'AnimatedContainer automatically animates changes to size, '
                'color, and shape whenever its properties change. It saves '
                'you from writing a manual AnimationController for simple '
                'transitions.',
            child: AnimatedContainerDemo(
              isExpanded: _isBoxExpanded,
              onTap: () => setState(() => _isBoxExpanded = !_isBoxExpanded),
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: '2. AnimatedOpacity',
            explanation:
                'AnimatedOpacity smoothly fades a widget in or out by '
                'interpolating its opacity value. It\'s great for subtle '
                'show/hide effects without abrupt UI jumps.',
            child: AnimatedOpacityDemo(
              isVisible: _isVisible,
              onToggle: () => setState(() => _isVisible = !_isVisible),
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: '3. AnimatedSwitcher',
            explanation:
                'AnimatedSwitcher animates between two different widgets by '
                'fading/transitioning the old one out and the new one in. '
                'Useful when the widget *type* changes, not just a property.',
            child: AnimatedSwitcherDemo(
              showIcon: _showIcon,
              onSwitch: () => setState(() => _showIcon = !_showIcon),
            ),
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: '4. AnimatedPositioned',
            explanation:
                'AnimatedPositioned animates a widget\'s position inside a '
                'Stack. It requires a Stack as parent and is commonly used '
                'for sliding, docking, or repositioning UI elements.',
            child: AnimatedPositionedDemo(
              isAtTop: _isBallAtTop,
              onMove: () => setState(() => _isBallAtTop = !_isBallAtTop),
            ),
          ),
          const SizedBox(height: 30),
          _buildRealWorldTips(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
 
  Widget _buildIntro() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'This screen demonstrates 4 core "implicit" animations in Flutter. '
        'Each one animates automatically when its underlying value changes — '
        'no manual AnimationController required. Tap the buttons in each '
        'card to trigger the effect.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }
 
  Widget _buildRealWorldTips() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('💡 Quick Tips for Real-World Use',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('• Implicit animations (like these) are best for simple, '
              'one-off property changes. For complex, coordinated, or '
              'repeating animations, use an AnimationController instead.'),
          SizedBox(height: 4),
          Text('• Always give AnimatedSwitcher a unique Key on each child, '
              'otherwise Flutter won\'t know a "switch" happened.'),
          SizedBox(height: 4),
          Text('• AnimatedPositioned only works inside a Stack — wrap it '
              'incorrectly and you\'ll get a runtime error.'),
          SizedBox(height: 4),
          Text('• Keep animation durations between 150–400ms for UI '
              'polish — too slow feels laggy, too fast feels jarring.'),
        ],
      ),
    );
  }
}
 
// ─────────────────────────────────────────────────────────────
// REUSABLE SECTION CARD
// Wraps each demo with a title + short explanation for teaching.
// ─────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final String title;
  final String explanation;
  final Widget child;
 
  const _SectionCard({
    required this.title,
    required this.explanation,
    required this.child,
  });
 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(
              explanation,
              style: TextStyle(color: Colors.grey.shade700, height: 1.4),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}