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
    "id": id == null ? '' : id!,
    "name": name == null ? '' : name!,
    "email": email == null ? '' : email!,
    "phone_number": phoneNumber == null ? '' : phoneNumber!,
    "whatsapp": whatsapp == null ? '' : whatsapp!,
    "addresses": addresses == null ? '' : addresses!,
    "card_id": cardId == null ? '' : cardId!,
  };
}

class UnauthenticatedUser extends User {}