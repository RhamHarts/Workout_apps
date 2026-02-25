import 'package:flutter/material.dart';

class WorkoutStore {
  /// RAW LIST (TIDAK GROUP)
  static final workouts = ValueNotifier<List<String>>([]);

  /// ADD RAW ITEM
  static void add(String title) {
    workouts.value = [...workouts.value, title];
  }

  /// GROUPING UNTUK HOMEPAGE
  static Map<String, int> grouped() {
    final Map<String, int> map = {};

    for (final item in workouts.value) {
      map[item] = (map[item] ?? 0) + 1;
    }

    return map;
  }

  /// DELETE SEMUA ITEM TITLE TERTENTU
  static void deleteAll(String title) {
    workouts.value = workouts.value.where((e) => e != title).toList();
  }
}
