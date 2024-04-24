extension IntExtension on int {
  String get toHourMinutes {
    return '${this ~/ 60}h ${this % 60}m';
  }
}