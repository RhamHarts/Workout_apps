class WorkoutItem {
  final String title;
  final int count;

  WorkoutItem({required this.title, required this.count});

  WorkoutItem copyWith({int? count}) {
    return WorkoutItem(title: title, count: count ?? this.count);
  }
}
