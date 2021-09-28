class Company {
  Company({
    this.id,
    this.name,
    this.bussinessEntity,
    this.bussinessType,
    this.npwp,
    this.nib,
    this.address,
    this.postalCode,
    this.totalEmployee,
    this.maleEmployee,
    this.femaleEmployee,
    this.foreignEmployee,
    this.vehicleType,
    this.totalVehicle,
    this.landOwnership,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.owners,
    this.licenses,
    this.contactName,
    this.contactPhone,
  });

  final String? id;
  final String? name;
  final String? contactName;
  final String? contactPhone;
  final String? bussinessEntity;
  final String? bussinessType;
  final String? npwp;
  final String? nib;
  final Address? address;
  final String? postalCode;
  final String? totalEmployee;
  final String? maleEmployee;
  final String? femaleEmployee;
  final String? foreignEmployee;
  final String? vehicleType;
  final String? totalVehicle;
  final String? landOwnership;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final List<Owner>? owners;
  final List<LicenseElement>? licenses;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        contactPhone:
            json["contact_phone"] == null ? null : json["contact_phone"],
        contactName: json["contact_name"] == null ? null : json["contact_name"],
        bussinessEntity:
            json["bussiness_entity"] == null ? null : json["bussiness_entity"],
        bussinessType:
            json["bussiness_type"] == null ? null : json["bussiness_type"],
        npwp: json["npwp"] == null ? null : json["npwp"],
        nib: json["nib"] == null ? null : json["nib"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        totalEmployee:
            json["total_employee"] == null ? null : json["total_employee"],
        maleEmployee:
            json["male_employee"] == null ? null : json["male_employee"],
        femaleEmployee:
            json["female_employee"] == null ? null : json["female_employee"],
        foreignEmployee:
            json["foreign_employee"] == null ? null : json["foreign_employee"],
        vehicleType: json["vehicle_type"] == null ? null : json["vehicle_type"],
        totalVehicle:
            json["total_vehicle"] == null ? null : json["total_vehicle"],
        landOwnership:
            json["land_ownership"] == null ? null : json["land_ownership"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        owners: json["owners"] == null
            ? null
            : List<Owner>.from(json["owners"].map((x) => Owner.fromJson(x))),
        licenses: json["licenses"] == null
            ? null
            : List<LicenseElement>.from(
                json["licenses"].map((x) => LicenseElement.fromJson(x))),
      );
}

class LicenseElement {
  LicenseElement({
    this.id,
    this.licenseId,
    this.companyId,
    this.expiredDate,
    this.idNumber,
    this.agencyProvider,
    this.qualification,
    this.classification,
    this.equivalent,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.license,
  });

  final String? id;
  final String? licenseId;
  final String? companyId;
  final dynamic expiredDate;
  final String? idNumber;
  final String? agencyProvider;
  final String? qualification;
  final String? classification;
  final String? equivalent;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final LicenseLicense? license;

  factory LicenseElement.fromJson(Map<String, dynamic> json) => LicenseElement(
        id: json["id"] == null ? null : json["id"],
        licenseId: json["license_id"] == null ? null : json["license_id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        expiredDate: json["expired_date"],
        idNumber: json["id_number"] == null ? null : json["id_number"],
        agencyProvider:
            json["agency_provider"] == null ? null : json["agency_provider"],
        qualification:
            json["qualification"] == null ? null : json["qualification"],
        classification:
            json["classification"] == null ? null : json["classification"],
        equivalent: json["equivalent"] == null ? null : json["equivalent"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        license: json["license"] == null
            ? null
            : LicenseLicense.fromJson(json["license"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "license_id": licenseId == null ? null : licenseId,
        "company_id": companyId == null ? null : companyId,
        "expired_date": expiredDate,
        "id_number": idNumber == null ? null : idNumber,
        "agency_provider": agencyProvider == null ? null : agencyProvider,
        "qualification": qualification == null ? null : qualification,
        "classification": classification == null ? null : classification,
        "equivalent": equivalent == null ? null : equivalent,
        "created_at": createdAt == null ? null : createdAt.toString(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
        "deleted_at": deletedAt,
        // "license": license == null ? null : license.toJson(),
      };
}

class LicenseLicense {
  LicenseLicense({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? name;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;

  factory LicenseLicense.fromJson(Map<String, dynamic> json) => LicenseLicense(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class Owner {
  Owner({
    this.id,
    this.companyId,
    this.cardId,
    this.phoneNumber,
    this.whatsapp,
    this.email,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? companyId;
  final String? cardId;
  final String? phoneNumber;
  final String? whatsapp;
  final String? email;
  final String? firstName;
  final String? lastName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"] == null ? null : json["id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        cardId: json["card_id"] == null ? null : json["card_id"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "company_id": companyId == null ? null : companyId,
        "card_id": cardId == null ? null : cardId,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "whatsapp": whatsapp == null ? null : whatsapp,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
      };
}

class Address {
  Address({
    this.id,
    this.companyId,
    this.region,
    this.province,
    this.city,
    this.district,
    this.subdistrict,
    this.address,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? companyId;
  final String? region;
  final String? province;
  final String? city;
  final String? district;
  final String? subdistrict;
  final String? address;
  final dynamic latitude;
  final dynamic longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        region: json["region"] == null ? null : json["region"],
        province: json["province"] == null ? null : json["province"],
        city: json["city"] == null ? null : json["city"],
        district: json["district"] == null ? null : json["district"],
        subdistrict: json["subdistrict"] == null ? null : json["subdistrict"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "company_id": companyId == null ? null : companyId,
        "region": region == null ? null : region,
        "province": province == null ? null : province,
        "city": city == null ? null : city,
        "district": district == null ? null : district,
        "subdistrict": subdistrict == null ? null : subdistrict,
        "address": address == null ? null : address,
        "latitude": latitude,
        "longitude": longitude,
        "deleted_at": deletedAt,
      };
}
