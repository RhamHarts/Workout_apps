import 'package:flutter/material.dart';
import 'package:test_app1/stores/workout_stores.dart';
import 'package:test_app1/theme.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark1,
      appBar: AppBar(
        backgroundColor: dark1,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Workout',
          style: semibold14.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _item('Push Up'),
          _item('Sit Up'),
          _item('Pull Up'),
          _item('Squat'),
        ],
      ),
    );
  }

  Widget _item(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 60,
      decoration: BoxDecoration(
        color: blue1,
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          WorkoutStore.add(title); // 🔥 RAW ADD
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: semibold14.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
              const Icon(Icons.add, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
