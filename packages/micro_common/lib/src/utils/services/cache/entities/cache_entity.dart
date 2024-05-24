abstract class CacheEntity {
  final String id;
  final DateTime date;
  final Map<String, dynamic> data;

  CacheEntity({
    required this.id,
    required this.date,
    required this.data,
  });
}
