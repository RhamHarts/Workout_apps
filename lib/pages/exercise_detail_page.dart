import 'package:flutter/material.dart';
import 'package:test_app1/models/workout_item.dart';

class ExerciseDetailPage extends StatefulWidget {
  final WorkoutItem item;

  const ExerciseDetailPage({super.key, required this.item});

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  late int value;
  late WorkoutMode mode;

  @override
  void initState() {
    super.initState();
    value = widget.item.value;
    mode = widget.item.mode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: const Text("Gambar / Animasi"),
            ),

            const SizedBox(height: 30),

            ToggleButtons(
              isSelected: [mode == WorkoutMode.reps, mode == WorkoutMode.time],
              onPressed: (i) {
                setState(() {
                  mode = i == 0 ? WorkoutMode.reps : WorkoutMode.time;
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text("REPS"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text("TIME"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              mode == WorkoutMode.reps ? "$value x" : "$value s",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle, size: 40),
                  onPressed: () {
                    if (value > 1) {
                      setState(() => value--);
                    }
                  },
                ),
                const SizedBox(width: 30),
                IconButton(
                  icon: const Icon(Icons.add_circle, size: 40),
                  onPressed: () => setState(() => value++),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Wrap(
              spacing: 12,
              children: (mode == WorkoutMode.reps ? [1, 10, 30] : [10, 30, 60])
                  .map(
                    (e) => ElevatedButton(
                      onPressed: () => setState(() => value = e),
                      child: Text(mode == WorkoutMode.reps ? "$e x" : "$e s"),
                    ),
                  )
                  .toList(),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    widget.item.copyWith(value: value, mode: mode),
                  );
                },
                child: const Text("SAVE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
