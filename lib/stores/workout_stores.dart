import 'package:flutter/material.dart';
import 'package:test_app1/models/workout_item.dart';
import 'package:uuid/uuid.dart';

class WorkoutStore {
  static final _uuid = Uuid();

  static final workouts = ValueNotifier<List<WorkoutItem>>([]);

  static void add(String title) {
    workouts.value = [
      ...workouts.value,
      WorkoutItem(id: _uuid.v4(), title: title),
    ];
  }

  static void delete(String id) {
    workouts.value = workouts.value.where((e) => e.id != id).toList();
  }

  static void update(WorkoutItem item) {
    workouts.value = workouts.value.map((e) {
      if (e.id == item.id) return item;
      return e;
    }).toList();
  }

  static void increment(String id) {
    workouts.value = workouts.value.map((e) {
      if (e.id == id) e.value += 1;
      return e;
    }).toList();
  }

  static void decrement(String id) {
    workouts.value = workouts.value.map((e) {
      if (e.id == id && e.value > 1) e.value -= 1;
      return e;
    }).toList();
  }

  static void reorder(int oldIndex, int newIndex) {
    final list = [...workouts.value];
    if (newIndex > oldIndex) newIndex -= 1;

    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    workouts.value = list;
  }
}
