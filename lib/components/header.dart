import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app1/pages/add_page.dart';
import 'package:test_app1/theme.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            'Workout',
            style: semibold14.copyWith(color: Colors.white, fontSize: 18),
          ),

          const Spacer(),

          InvisibleAnimatedIconButton(
            icon: Icons.add,
            color: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InvisibleAnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const InvisibleAnimatedIconButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  State<InvisibleAnimatedIconButton> createState() =>
      _InvisibleAnimatedIconButtonState();
}

class _InvisibleAnimatedIconButtonState
    extends State<InvisibleAnimatedIconButton> {
  double scale = 1;

  void _onTapDown(TapDownDetails details) => setState(() => scale = 0.85);

  void _onTapUp(TapUpDetails details) => setState(() => scale = 1);

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
        duration: const Duration(milliseconds: 110),
        curve: Curves.easeOut,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(widget.icon, color: widget.color, size: 22),
        ),
      ),
    );
  }
}
