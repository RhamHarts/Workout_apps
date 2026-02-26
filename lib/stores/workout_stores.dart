import 'package:flutter/material.dart';
import '../models/workout_item.dart';

class WorkoutStore {
  static final workouts = ValueNotifier<List<WorkoutItem>>([]);

  /// ADD CARD BARU
  static void add(String title) {
    workouts.value = [...workouts.value, WorkoutItem(title: title, count: 1)];
  }

  /// TAMBAH JUMLAH (x++)
  static void increment(int index) {
    final list = [...workouts.value];
    final item = list[index];

    list[index] = item.copyWith(count: item.count + 1);
    workouts.value = list;
  }

  /// DELETE CARD
  static void deleteAt(int index) {
    final list = [...workouts.value];
    list.removeAt(index);
    workouts.value = list;
  }

  static void clear() {
    workouts.value = [];
  }
}
