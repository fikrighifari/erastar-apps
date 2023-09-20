// To parse this JSON data, do
//
//     final ProfileModel = ProfileModelFromMap(jsonString);

import 'dart:convert';

class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataProfile? data;

  factory ProfileModel.fromJson(String str) =>
      ProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DataProfile.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class DataProfile {
  DataProfile({
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.role,
    this.office,
    this.device,
    this.fcmToken,
    this.avatar,
    this.avatarPath,
    this.createdAt,
  });

  String? id;
  String? name;
  String? username;
  String? phone;
  String? email;
  Role? role;
  Office? office;
  String? device;
  String? fcmToken;
  String? avatar;
  String? avatarPath;
  DateTime? createdAt;

  factory DataProfile.fromJson(String str) =>
      DataProfile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataProfile.fromMap(Map<String, dynamic> json) => DataProfile(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
        office: json["office"] == null ? null : Office.fromMap(json["office"]),
        device: json["device"],
        fcmToken: json["fcm_token"],
        avatar: json["avatar"],
        avatarPath: json["avatar_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "username": username,
        "phone": phone,
        "email": email,
        "role": role?.toMap(),
        "office": office?.toMap(),
        "device": device,
        "fcm_token": fcmToken,
        "avatar": avatar,
        "avatar_path": avatarPath,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Office {
  Office({
    this.id,
    this.name,
    this.type,
    this.address,
    this.provinsiId,
    this.provinsiName,
    this.kabkoId,
    this.kabkoName,
    this.kecamatanId,
    this.kecamatanName,
    this.kelurahanId,
    this.kelurahanName,
    this.createdAt,
  });

  String? id;
  String? name;
  String? type;
  String? address;
  String? provinsiId;
  String? provinsiName;
  String? kabkoId;
  String? kabkoName;
  String? kecamatanId;
  String? kecamatanName;
  String? kelurahanId;
  String? kelurahanName;
  DateTime? createdAt;

  factory Office.fromJson(String str) => Office.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Office.fromMap(Map<String, dynamic> json) => Office(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        address: json["address"],
        provinsiId: json["provinsi_id"],
        provinsiName: json["provinsi_name"],
        kabkoId: json["kabko_id"],
        kabkoName: json["kabko_name"],
        kecamatanId: json["kecamatan_id"],
        kecamatanName: json["kecamatan_name"],
        kelurahanId: json["kelurahan_id"],
        kelurahanName: json["kelurahan_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "type": type,
        "address": address,
        "provinsi_id": provinsiId,
        "provinsi_name": provinsiName,
        "kabko_id": kabkoId,
        "kabko_name": kabkoName,
        "kecamatan_id": kecamatanId,
        "kecamatan_name": kecamatanName,
        "kelurahan_id": kelurahanId,
        "kelurahan_name": kelurahanName,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.v,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  DateTime? createdAt;
  int? v;
  DateTime? updatedAt;

  factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        v: json["__v"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "__v": v,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
