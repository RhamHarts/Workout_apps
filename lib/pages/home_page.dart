import 'package:flutter/material.dart';
import '../components/header.dart';
import '../stores/workout_stores.dart';
import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: dark1,
        elevation: 0,
        toolbarHeight: 71,
        title: const Header(),
      ),
      body: ValueListenableBuilder(
        valueListenable: WorkoutStore.workouts,
        builder: (context, list, _) {
          if (list.isEmpty) {
            return const Center(child: Text('No workout yet'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];

              return _WorkoutCard(
                title: item.title,
                count: item.count,
                onAdd: () => WorkoutStore.increment(index),
                onDelete: () => WorkoutStore.deleteAt(index),
              );
            },
          );
        },
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onDelete;

  const _WorkoutCard({
    required this.title,
    required this.count,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: blue1,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$title x$count',
              style: semibold14.copyWith(color: Colors.white, fontSize: 16),
            ),
          ),

          _iconBtn(icon: Icons.add, color: blue1, onTap: onAdd),

          const SizedBox(width: 10),

          _iconBtn(icon: Icons.delete, color: Colors.red, onTap: onDelete),
        ],
      ),
    );
  }

  Widget _iconBtn({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
