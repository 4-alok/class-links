class IndexEntity {
  final String name;
  final String path;
  final String lastUpdate;
  const IndexEntity(
      {required this.name, required this.path, required this.lastUpdate});
}

class IndexFolder implements IndexEntity {
  @override
  final String name;
  @override
  final String path;
  @override
  final String lastUpdate;
  const IndexFolder({
    required this.name,
    required this.path,
    required this.lastUpdate,
  }) : super();
}

class IndexFile implements IndexEntity {
  @override
  final String name;
  @override
  final String path;
  @override
  final String lastUpdate;
  final String id;
  final String? description;
  final double size;
  const IndexFile({
    required this.name,
    required this.path,
    required this.id,
    required this.lastUpdate,
    this.description,
    required this.size,
  }) : super();
}
