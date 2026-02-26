import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app1/theme.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 15, right: 15),
      child: Row(
        children: [
          _buildCircleIcon(
            iconPath: 'assets/icons/search.svg',
            background: green1,
            iconColor: Colors.white,
          ),
          const SizedBox(width: 12),

          Expanded(child: _buildSearchBar()),

          const SizedBox(width: 12),

          _buildCircleIcon(
            iconPath: 'assets/icons/filter.svg',
            background: const Color(0xFFF2F2F2),
            iconColor: dark1,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFE8E8E8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search.svg',
            color: dark3,
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 10),
          Text('Find Your Exercise', style: regular14.copyWith(color: dark3)),
        ],
      ),
    );
  }

  Widget _buildCircleIcon({
    required String iconPath,
    required Color background,
    required Color iconColor,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          color: iconColor,
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}
