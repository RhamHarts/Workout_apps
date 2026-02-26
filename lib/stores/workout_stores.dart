import 'package:flutter/material.dart';
import '../models/workout_item.dart';

class WorkoutStore {
  static final workouts = ValueNotifier<List<WorkoutItem>>([]);

  /// ADD CARD BARU
  static void add(String title) {
    workouts.value = [...workouts.value, WorkoutItem(title: title, count: 1)];
  }

  /// TAMBAH JUMLAH (++)
  static void increment(int index) {
    final list = [...workouts.value];
    final item = list[index];

    list[index] = item.copyWith(count: item.count + 1);
    workouts.value = list;
  }

  /// KURANGI JUMLAH (--), MINIMAL 1
  static void decrement(int index) {
    final list = [...workouts.value];
    final item = list[index];

    if (item.count > 1) {
      list[index] = item.copyWith(count: item.count - 1);
      workouts.value = list;
    }
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

  /// REORDER LIST (DRAG & DROP)
  static void reorder(int oldIndex, int newIndex) {
    final list = [...workouts.value];

    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    workouts.value = list;
  }
}
