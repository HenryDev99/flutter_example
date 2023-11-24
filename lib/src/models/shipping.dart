import 'package:goodiez_abalone/src/models/parcel.dart';
import 'package:goodiez_abalone/src/models/shipping_address.dart';

enum Providers { usps }
enum ShippingStatus {
  offered,
  preTransit,
  transit,
  delievered,
  returned,
  failure,
  unknown
}

class Shipping {
  final String shippoRateId;
  final String shippoTransactionId;
  final Providers provider;
  final String serviceLevel;
  final ShippingAddress? addressTo;
  final ShippingAddress? addressFrom;
  final ShippingAddress? addressReturn;
  final double cost;
  final double duration;
  final Parcel? parcel;
  final ShippingStatus status;
  final String substat;
  final String? labelUrl;
  final String? trackingUrl;

  const Shipping({
    required this.shippoRateId,
    required this.shippoTransactionId,
    required this.provider,
    required this.serviceLevel,
    this.addressTo,
    this.addressFrom,
    this.addressReturn,
    required this.cost,
    required this.duration,
    this.parcel,
    required this.status,
    required this.substat,
    this.labelUrl,
    this.trackingUrl,
  });
}
