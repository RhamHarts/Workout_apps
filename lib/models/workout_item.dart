enum WorkoutMode { reps, time }

class WorkoutItem {
  final String id;
  final String title;
  int value;
  WorkoutMode mode;

  WorkoutItem({
    required this.id,
    required this.title,
    this.value = 10,
    this.mode = WorkoutMode.reps,
  });

  /// FACTORY UNTUK NEW ITEM
  factory WorkoutItem.create(String title) {
    return WorkoutItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
    );
  }

  WorkoutItem copyWith({int? value, WorkoutMode? mode}) {
    return WorkoutItem(
      id: id,
      title: title,
      value: value ?? this.value,
      mode: mode ?? this.mode,
    );
  }
}
