class ShippingAddress {
  final String firstName;
  final String lastName;
  final String country;
  final String address;
  final String address2;
  final String city;
  final String state;
  final String zipCode;
  final String phoneNumber;

  const ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.address,
    required this.address2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.phoneNumber,
  });

  Map toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'country' : country,
    'address' : address,
    'address2' : address2,
    'city' : city,
    'state' : state,
    'zip_code' : zipCode,
    'phone_number' : phoneNumber
  };

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      country: json['country'] as String,
      address: json['address'] as String,
      address2: json['address2'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zip_code'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }
}
