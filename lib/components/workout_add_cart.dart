import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app1/theme.dart';

class WorkoutAddCard extends StatelessWidget {
  final String title;
  final VoidCallback onAdd;

  const WorkoutAddCard({super.key, required this.title, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        height: 96,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: blue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TEXT KIRI
            Expanded(
              child: Text(
                title,
                style: semibold14.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // ICON PLUS
            AnimatedAddButton(onTap: onAdd),
          ],
        ),
      ),
    );
  }
}

/// 🔥 Clean Animated Plus Button
class AnimatedAddButton extends StatefulWidget {
  final VoidCallback onTap;

  const AnimatedAddButton({super.key, required this.onTap});

  @override
  State<AnimatedAddButton> createState() => _AnimatedAddButtonState();
}

class _AnimatedAddButtonState extends State<AnimatedAddButton> {
  double scale = 1;

  void _onTapDown(TapDownDetails _) => setState(() => scale = 0.9);
  void _onTapUp(TapUpDetails _) => setState(() => scale = 1);
  void _onTapCancel() => setState(() => scale = 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(Icons.add, color: blue1),
        ),
      ),
    );
  }
}
