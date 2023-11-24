import 'shipping_address.dart';
import 'payment.dart';

class MUser {
  final String id;
  final String AvatarUrl;
  final String nickname;
  final String email;
  final String oauthProvider;
  final String oauthAccessToken;
  final String oauthRefreshToken;
  final String oauthExpired;
  final ShippingAddress shippingAddress;
  final Payment payment;
  final String created;

  const MUser({
    required this.id,
    required this.AvatarUrl,
    required this.nickname,
    required this.email,
    required this.oauthProvider,
    required this.oauthAccessToken,
    required this.oauthRefreshToken,
    required this.oauthExpired,
    required this.shippingAddress,
    required this.payment,
    required this.created,
  });

  factory MUser.fromJson(Map<String, dynamic> json) {
    return MUser(
      id: json['_id'] as String,
      AvatarUrl: '',
      nickname: json['nickname'] as String,
      email: '',
      oauthProvider: json['oauth_provider'] as String,
      oauthAccessToken: json['oauth_acccess_token'] as String,
      oauthRefreshToken: json['oauth_refresh_token'] as String,
      oauthExpired: json['oauth_expired'] as String,
      shippingAddress: ShippingAddress.fromJson(json['shipping_address']),
      payment: Payment.fromJson(json['payment']),
      created: json['created'] as String,
    );
  }
}
