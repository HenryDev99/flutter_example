enum DistanceUnit { millimeter, centimeter, meter, inch, feet, yard }
enum MassUnit { gram, kilogram, ounce, pound }

class Parcel {
  final double length;
  final double width;
  final double height;
  final DistanceUnit distanceUnit;
  final double weight;
  final MassUnit massUnit;

  const Parcel({
    required this.length,
    required this.width,
    required this.height,
    required this.distanceUnit,
    required this.weight,
    required this.massUnit,
  });

  @override
  String toString() {
    return 'Parcel: {length: $length, width: $width, height: $height, distanceUnit: $distanceUnit, weight: $weight, massUnit: $massUnit}';
  }
}
