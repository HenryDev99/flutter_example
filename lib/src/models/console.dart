class Console {
  final String name;
  final String imageUrl;

  const Console({
    required this.name,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Console: {name: $name, imageUrl: $imageUrl}';
  }
}
