import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app1/theme.dart';

class Gopay extends StatelessWidget {
  const Gopay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
            // TEXT “WORKOUT” di kiri
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Workout',
                  style: semibold14.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // ICON BUTTONS
            Row(
              children: [
                AnimatedIconButton(
                  icon: Icons.add,
                  color: blue1,
                  onTap: () {
                    print('Tambah workout');
                  },
                ),
                const SizedBox(width: 12),
                AnimatedIconButton(
                  icon: Icons.delete,
                  color: Colors.red,
                  onTap: () {
                    print('Hapus workout');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔥 Button dengan Scale + Ripple + Haptic
class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const AnimatedIconButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  double scale = 1;

  void _onTapDown(TapDownDetails details) {
    setState(() => scale = 0.9);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => scale = 1);
  }

  void _onTapCancel() {
    setState(() => scale = 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        HapticFeedback.lightImpact(); // getaran halus
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
          child: Icon(widget.icon, color: widget.color),
        ),
      ),
    );
  }
}
