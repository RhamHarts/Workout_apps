import 'package:flutter/material.dart';
import 'package:test_app1/pages/exercise_detail_page.dart';
import 'package:test_app1/stores/workout_stores.dart';
import 'package:test_app1/theme.dart';
import 'package:test_app1/models/workout_item.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

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
          _item(context, 'Push Up'),
          _item(context, 'Sit Up'),
          _item(context, 'Pull Up'),
          _item(context, 'Squat'),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 60,
      decoration: BoxDecoration(
        color: blue1,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          /// TAP AREA → DETAIL PAGE
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ExerciseDetailPage(item: WorkoutItem.create(title)),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: semibold14.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// ICON PLUS → ADD WORKOUT (DEFAULT 10x)
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              WorkoutStore.add(title);
            },
          ),
        ],
      ),
    );
  }
}
