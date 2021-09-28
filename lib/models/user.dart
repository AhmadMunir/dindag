class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.whatsapp,
    this.addresses,
    this.cardId,
    this.role,
    this.profileImage,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.password, 
  });

  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? whatsapp;
  final String? addresses;
  final String? cardId;
  final String? role;
  final String? profileImage;
  final String? password;
  final dynamic emailVerifiedAt;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
    whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    addresses: json["addresses"] == null ? null : json["addresses"],
    cardId: json["card_id"] == null ? null : json["card_id"],
    role: json["role"] == null ? null : json["role"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, String> toJson() => {
    "name": name ?? '',
    "password": password ?? '',
    "email": email ?? '',
    "phone_number": phoneNumber ?? '',
    "whatsapp": whatsapp ?? '',
    "addresses": addresses ?? '',
    "card_id": cardId ?? '',
  };
}

class UnauthenticatedUser extends User {}