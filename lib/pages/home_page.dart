import 'package:flutter/material.dart';
import 'package:test_app1/stores/workout_stores.dart';
import 'package:test_app1/models/workout_item.dart';
import 'exercise_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<WorkoutItem>>(
      valueListenable: WorkoutStore.workouts,
      builder: (_, list, __) {
        return ReorderableListView.builder(
          itemCount: list.length,
          onReorder: WorkoutStore.reorder,
          buildDefaultDragHandles: false,
          itemBuilder: (context, index) {
            final item = list[index];

            return GestureDetector(
              key: ValueKey(item.id),
              onTap: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseDetailPage(item: item),
                  ),
                );

                if (updated != null) {
                  WorkoutStore.update(updated);
                }
              },
              child: ReorderableDelayedDragStartListener(
                index: index,
                child: Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.mode == WorkoutMode.reps
                                    ? "${item.value}x"
                                    : "${item.value}s",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => WorkoutStore.decrement(item.id),
                        ),

                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => WorkoutStore.increment(item.id),
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => WorkoutStore.delete(item.id),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
