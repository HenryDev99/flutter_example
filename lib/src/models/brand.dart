import 'console.dart';

class Brand {
  final String name;
  final String imageUrl;
  final List<Console> consoles;

  const Brand({
    required this.name,
    required this.imageUrl,
    required this.consoles,
  });

  @override
  String toString() {
    return 'Brand: {name: $name, imageUrl: $imageUrl, consoles: $consoles}';
  }
}
