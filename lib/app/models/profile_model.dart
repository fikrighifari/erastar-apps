// // // To parse this JSON data, do
// // //
// // //     final ProfileModel = ProfileModelFromMap(jsonString);

// // import 'dart:convert';

// // class ProfileModel {
// //   ProfileModel({
// //     this.status,
// //     this.message,
// //     this.data,
// //   });

// //   String? status;
// //   String? message;
// //   DataProfile? data;

// //   factory ProfileModel.fromJson(String str) =>
// //       ProfileModel.fromMap(json.decode(str));

// //   String toJson() => json.encode(toMap());

// //   factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
// //         status: json["status"],
// //         message: json["message"],
// //         data: json["data"] == null ? null : DataProfile.fromMap(json["data"]),
// //       );

// //   Map<String, dynamic> toMap() => {
// //         "status": status,
// //         "message": message,
// //         "data": data?.toMap(),
// //       };
// // }

// // class DataProfile {
// //   DataProfile({
// //     this.id,
// //     this.name,
// //     this.username,
// //     this.phone,
// //     this.email,
// //     this.role,
// //     this.office,
// //     this.device,
// //     this.fcmToken,
// //     this.avatar,
// //     this.avatarPath,
// //     this.createdAt,
// //   });

// //   String? id;
// //   String? name;
// //   String? username;
// //   String? phone;
// //   String? email;
// //   Role? role;
// //   Office? office;
// //   String? device;
// //   String? fcmToken;
// //   String? avatar;
// //   String? avatarPath;
// //   DateTime? createdAt;

// //   factory DataProfile.fromJson(String str) =>
// //       DataProfile.fromMap(json.decode(str));

// //   String toJson() => json.encode(toMap());

// //   factory DataProfile.fromMap(Map<String, dynamic> json) => DataProfile(
// //         id: json["_id"],
// //         name: json["name"],
// //         username: json["username"],
// //         phone: json["phone"],
// //         email: json["email"],
// //         role: json["role"] == null ? null : Role.fromMap(json["role"]),
// //         office: json["office"] == null ? null : Office.fromMap(json["office"]),
// //         device: json["device"],
// //         fcmToken: json["fcm_token"],
// //         avatar: json["avatar"],
// //         avatarPath: json["avatar_path"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //       );

// //   Map<String, dynamic> toMap() => {
// //         "_id": id,
// //         "name": name,
// //         "username": username,
// //         "phone": phone,
// //         "email": email,
// //         "role": role?.toMap(),
// //         "office": office?.toMap(),
// //         "device": device,
// //         "fcm_token": fcmToken,
// //         "avatar": avatar,
// //         "avatar_path": avatarPath,
// //         "created_at": createdAt?.toIso8601String(),
// //       };
// // }

// // class Office {
// //   Office({
// //     this.id,
// //     this.name,
// //     this.type,
// //     this.address,
// //     this.provinsiId,
// //     this.provinsiName,
// //     this.kabkoId,
// //     this.kabkoName,
// //     this.kecamatanId,
// //     this.kecamatanName,
// //     this.kelurahanId,
// //     this.kelurahanName,
// //     this.createdAt,
// //   });

// //   String? id;
// //   String? name;
// //   String? type;
// //   String? address;
// //   String? provinsiId;
// //   String? provinsiName;
// //   String? kabkoId;
// //   String? kabkoName;
// //   String? kecamatanId;
// //   String? kecamatanName;
// //   String? kelurahanId;
// //   String? kelurahanName;
// //   DateTime? createdAt;

// //   factory Office.fromJson(String str) => Office.fromMap(json.decode(str));

// //   String toJson() => json.encode(toMap());

// //   factory Office.fromMap(Map<String, dynamic> json) => Office(
// //         id: json["_id"],
// //         name: json["name"],
// //         type: json["type"],
// //         address: json["address"],
// //         provinsiId: json["provinsi_id"],
// //         provinsiName: json["provinsi_name"],
// //         kabkoId: json["kabko_id"],
// //         kabkoName: json["kabko_name"],
// //         kecamatanId: json["kecamatan_id"],
// //         kecamatanName: json["kecamatan_name"],
// //         kelurahanId: json["kelurahan_id"],
// //         kelurahanName: json["kelurahan_name"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //       );

// //   Map<String, dynamic> toMap() => {
// //         "_id": id,
// //         "name": name,
// //         "type": type,
// //         "address": address,
// //         "provinsi_id": provinsiId,
// //         "provinsi_name": provinsiName,
// //         "kabko_id": kabkoId,
// //         "kabko_name": kabkoName,
// //         "kecamatan_id": kecamatanId,
// //         "kecamatan_name": kecamatanName,
// //         "kelurahan_id": kelurahanId,
// //         "kelurahan_name": kelurahanName,
// //         "created_at": createdAt?.toIso8601String(),
// //       };
// // }

// // class Role {
// //   Role({
// //     this.id,
// //     this.name,
// //     this.slug,
// //     this.createdAt,
// //     this.v,
// //     this.updatedAt,
// //   });

// //   String? id;
// //   String? name;
// //   String? slug;
// //   DateTime? createdAt;
// //   int? v;
// //   DateTime? updatedAt;

// //   factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

// //   String toJson() => json.encode(toMap());

// //   factory Role.fromMap(Map<String, dynamic> json) => Role(
// //         id: json["_id"],
// //         name: json["name"],
// //         slug: json["slug"],
// //         createdAt: json["created_at"] == null
// //             ? null
// //             : DateTime.parse(json["created_at"]),
// //         v: json["__v"],
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //       );

// //   Map<String, dynamic> toMap() => {
// //         "_id": id,
// //         "name": name,
// //         "slug": slug,
// //         "created_at": createdAt?.toIso8601String(),
// //         "__v": v,
// //         "updated_at": updatedAt?.toIso8601String(),
// //       };
// // }

// import 'dart:convert';

// class ProfileModel {
//   String? status;
//   String? message;
//   Data? data;

//   ProfileModel({
//     this.status,
//     this.message,
//     this.data,
//   });

//   factory ProfileModel.fromJson(String str) =>
//       ProfileModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromMap(json["data"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "status": status,
//         "message": message,
//         "data": data?.toMap(),
//       };
// }

// class Data {
//   String? id;
//   String? name;
//   String? username;
//   String? phone;
//   String? email;
//   Role? role;
//   List<RoleAccess>? roleAccess;
//   Office? office;
//   String? device;
//   String? fcmToken;
//   String? avatar;
//   String? avatarPath;
//   DateTime? createdAt;

//   Data({
//     this.id,
//     this.name,
//     this.username,
//     this.phone,
//     this.email,
//     this.role,
//     this.roleAccess,
//     this.office,
//     this.device,
//     this.fcmToken,
//     this.avatar,
//     this.avatarPath,
//     this.createdAt,
//   });

//   factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Data.fromMap(Map<String, dynamic> json) => Data(
//         id: json["_id"],
//         name: json["name"],
//         username: json["username"],
//         phone: json["phone"],
//         email: json["email"],
//         role: json["role"] == null ? null : Role.fromMap(json["role"]),
//         roleAccess: json["role_access"] == null
//             ? []
//             : List<RoleAccess>.from(
//                 json["role_access"]!.map((x) => RoleAccess.fromMap(x))),
//         office: json["office"] == null ? null : Office.fromMap(json["office"]),
//         device: json["device"],
//         fcmToken: json["fcm_token"],
//         avatar: json["avatar"],
//         avatarPath: json["avatar_path"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "name": name,
//         "username": username,
//         "phone": phone,
//         "email": email,
//         "role": role?.toMap(),
//         "role_access": roleAccess == null
//             ? []
//             : List<dynamic>.from(roleAccess!.map((x) => x.toMap())),
//         "office": office?.toMap(),
//         "device": device,
//         "fcm_token": fcmToken,
//         "avatar": avatar,
//         "avatar_path": avatarPath,
//         "created_at": createdAt?.toIso8601String(),
//       };
// }

// class Office {
//   String? id;
//   String? name;
//   String? type;
//   String? address;
//   String? provinsiId;
//   String? provinsiName;
//   String? kabkoId;
//   String? kabkoName;
//   String? kecamatanId;
//   String? kecamatanName;
//   String? kelurahanId;
//   String? kelurahanName;
//   int? phone;
//   String? email;
//   DateTime? createdAt;

//   Office({
//     this.id,
//     this.name,
//     this.type,
//     this.address,
//     this.provinsiId,
//     this.provinsiName,
//     this.kabkoId,
//     this.kabkoName,
//     this.kecamatanId,
//     this.kecamatanName,
//     this.kelurahanId,
//     this.kelurahanName,
//     this.phone,
//     this.email,
//     this.createdAt,
//   });

//   factory Office.fromJson(String str) => Office.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Office.fromMap(Map<String, dynamic> json) => Office(
//         id: json["_id"],
//         name: json["name"],
//         type: json["type"],
//         address: json["address"],
//         provinsiId: json["provinsi_id"],
//         provinsiName: json["provinsi_name"],
//         kabkoId: json["kabko_id"],
//         kabkoName: json["kabko_name"],
//         kecamatanId: json["kecamatan_id"],
//         kecamatanName: json["kecamatan_name"],
//         kelurahanId: json["kelurahan_id"],
//         kelurahanName: json["kelurahan_name"],
//         phone: json["phone"],
//         email: json["email"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "name": name,
//         "type": type,
//         "address": address,
//         "provinsi_id": provinsiId,
//         "provinsi_name": provinsiName,
//         "kabko_id": kabkoId,
//         "kabko_name": kabkoName,
//         "kecamatan_id": kecamatanId,
//         "kecamatan_name": kecamatanName,
//         "kelurahan_id": kelurahanId,
//         "kelurahan_name": kelurahanName,
//         "phone": phone,
//         "email": email,
//         "created_at": createdAt?.toIso8601String(),
//       };
// }

// class Role {
//   Id? id;
//   String? name;
//   String? slug;
//   DateTime? createdAt;
//   int? v;
//   DateTime? updatedAt;

//   Role({
//     this.id,
//     this.name,
//     this.slug,
//     this.createdAt,
//     this.v,
//     this.updatedAt,
//   });

//   factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Role.fromMap(Map<String, dynamic> json) => Role(
//         id: idValues.map[json["_id"]]!,
//         name: json["name"],
//         slug: json["slug"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         v: json["__v"],
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": idValues.reverse[id],
//         "name": name,
//         "slug": slug,
//         "created_at": createdAt?.toIso8601String(),
//         "__v": v,
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// enum Id { THE_63_CB97882_D5_CAA09_CAFE1_AA6 }

// final idValues = EnumValues(
//     {"63cb97882d5caa09cafe1aa6": Id.THE_63_CB97882_D5_CAA09_CAFE1_AA6});

// class RoleAccess {
//   String? id;
//   Id? roleId;
//   String? pageId;
//   String? name;
//   String? slug;
//   String? parent;
//   DateTime? createdAt;
//   int? v;

//   RoleAccess({
//     this.id,
//     this.roleId,
//     this.pageId,
//     this.name,
//     this.slug,
//     this.parent,
//     this.createdAt,
//     this.v,
//   });

//   factory RoleAccess.fromJson(String str) =>
//       RoleAccess.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory RoleAccess.fromMap(Map<String, dynamic> json) => RoleAccess(
//         id: json["_id"],
//         roleId: idValues.map[json["role_id"]]!,
//         pageId: json["page_id"],
//         name: json["name"],
//         slug: json["slug"],
//         parent: json["parent"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "role_id": idValues.reverse[roleId],
//         "page_id": pageId,
//         "name": name,
//         "slug": slug,
//         "parent": parent,
//         "created_at": createdAt?.toIso8601String(),
//         "__v": v,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// // ignore_for_file: no_leading_underscores_for_local_identifiers, unused_label
// class ProfileModel {
//   ProfileModel({
//     required this.status,
//     required this.message,
//     required this.dataProfile,
//   });
//   late final String? status;
//   late final String? message;
//   late final DataProfile? dataProfile;

//   ProfileModel.fromJson(Map<String?, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     dataProfile =
//         json['data'] != null ? DataProfile.fromJson(json['data']) : null;
//   }

//   Map<String?, dynamic> toJson() {
//     final _data = <String?, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     if (dataProfile != null) {
//       _data['data'] = dataProfile!.toJson();
//     }

//     return _data;
//   }
// }

// class DataProfile {
//   DataProfile({
//     this.uid,
//     required this.regisNumber,
//     required this.fullName,
//     required this.phone,
//     required this.email,
//     required this.companyId,
//     required this.companyName,
//     required this.deptId,
//     required this.deptName,
//     required this.placementCode,
//     required this.placementName,
//     required this.gender,
//     required this.fotoUrl,
//     required this.emei,
//     required this.statusAccountId,
//     required this.statusAccountName,
//     required this.statusVerifId,
//     required this.statusVerifName,
//     this.shift,
//     required this.modelData,
//   });
//   int? uid;
//   int? regisNumber;
//   late final String? fullName;
//   late final int? phone;
//   late final String? email;
//   late final int? companyId;
//   late final String? companyName;
//   late final int? deptId;
//   late final String? deptName;
//   late final String? placementCode;
//   late final String? placementName;
//   String? gender;
//   late final String? fotoUrl;
//   late final String? emei;
//   late final int? statusAccountId;
//   late final String? statusAccountName;
//   late final int? statusVerifId;
//   late final String? statusVerifName;
//   late final Shift? shift;
//   late final String? modelData;

//   DataProfile.fromJson(Map<String?, dynamic> json) {
//     uid = json['uid'];
//     regisNumber = json['regisNumber'];
//     fullName = json['fullName'];
//     phone = json['phone'];
//     email = json['email'] == null ? "" : json["email"] as String;
//     companyId = json['companyId'];
//     companyName = json['companyName'];
//     deptId = json['deptId'];
//     deptName = json['deptName'];
//     placementCode = json['placementCode'];
//     placementName = json['placementName'];
//     gender = json['gender'];
//     fotoUrl = json['fotoUrl'];
//     emei = json['emei'];
//     statusAccountId = json['statusAccountId'];
//     statusAccountName = json['statusAccountName'];
//     statusVerifId = json['statusVerifId'];
//     statusVerifName = json['statusVerifName'];
//     shift = Shift.fromJson(json['shift']);
//     modelData = json['model_data'];
//   }

//   Map<String?, dynamic> toJson() {
//     final _data = <String?, dynamic>{};
//     _data['uid'] = uid;
//     _data['regisNumber'] = regisNumber;
//     _data['fullName'] = fullName;
//     _data['phone'] = phone;
//     _data['email'] = email;
//     _data['companyId'] = companyId;
//     _data['companyName'] = companyName;
//     _data['deptId'] = deptId;
//     _data['deptName'] = deptName;
//     _data['placementCode'] = placementCode;
//     _data['placementName'] = placementName;
//     _data['gender'] = gender;
//     _data['fotoUrl'] = fotoUrl;
//     _data['emei'] = emei;
//     _data['statusAccountId'] = statusAccountId;
//     _data['statusAccountName'] = statusAccountName;
//     _data['statusVerifId'] = statusVerifId;
//     _data['statusVerifName'] = statusVerifName;
//     _data['shift'] = shift!.toJson();
//     _data['model_data'] = modelData;
//     return _data;
//   }

//   toMap() {
//     return {
//       'uid': uid,
//       'fullName': fullName,
//       'phone': phone,
//       'email': email,
//       'companyId': companyId,
//       'companyName': companyName,
//       'deptId': deptId,
//       'deptName': deptName,
//       'placementCode': placementCode,
//       'placementName': placementName,
//       'fotoUrl': fotoUrl,
//       'statusAccountId': statusAccountId,
//       'statusAccountName': statusAccountName,
//       'statusVerifId': statusVerifId,
//       'statusVerifName': statusVerifName,
//       'model_data': modelData,
//     };
//   }

//   DataProfile.fromMap(Map<String?, dynamic> map) {
//     uid = map['uid'];
//     fullName = map['fullName'];
//     phone = map['phone'];
//     email = map['email'];
//     companyId = map['companyId'];
//     companyName = map['companyName'];
//     deptId = map['deptId'];
//     deptName = map['deptName'];
//     placementCode = map['placementCode'];
//     placementName = map['placementName'];
//     fotoUrl = map['fotoUrl'];
//     statusAccountId = map['statusAccountId'];
//     statusAccountName = map['statusAccountName'];
//     statusVerifId = map['statusVerifId'];
//     statusVerifName = map['statusVerifName'];
//     modelData = map['model_data'];
//   }
// }

// class Shift {
//   Shift({
//     required this.uid,
//     required this.shiftIn,
//     required this.shiftOut,
//     required this.diffHour,
//     required this.radius,
//     required this.inLat,
//     required this.inLong,
//     required this.outLat,
//     required this.outLong,
//   });
//   late final int? uid;
//   late final String? shiftIn;
//   late final String? shiftOut;
//   late final String? diffHour;
//   late final String? radius;
//   late final String? inLat;
//   late final String? inLong;
//   late final String? outLat;
//   late final String? outLong;

//   Shift.fromJson(Map<String?, dynamic> json) {
//     uid = json['uid'];
//     shiftIn = json['shiftIn'];
//     shiftOut = json['shiftOut'];
//     diffHour = json['diffHour'];
//     radius = json['radius'];
//     inLat = json['inLat'];
//     inLong = json['inLong'];
//     outLat = json['outLat'];
//     outLong = json['outLong'];
//   }

//   Map<String?, dynamic> toJson() {
//     final _data = <String?, dynamic>{};
//     _data['uid'] = uid;
//     _data['shiftIn'] = shiftIn;
//     _data['shiftOut'] = shiftOut;
//     _data['diffHour'] = diffHour;
//     _data['radius'] = radius;
//     _data['inLat'] = inLat;
//     _data['inLong'] = inLong;
//     _data['outLat'] = outLat;
//     _data['outLong'] = outLong;
//     return _data;
//   }

//   toMap() {
//     return {
//       'shiftIn': shiftIn,
//       'shiftOut': shiftOut,
//       'diffHour': diffHour,
//       'radius': radius,
//       'inLat': inLat,
//       'inLong': inLong,
//       'outLat': outLat,
//       'outLong': outLong,
//     };
//   }

//   Shift.fromMap(Map<String?, dynamic> map) {
//     shiftIn = map['shiftIn'];
//     shiftOut = map['shiftOut'];
//     diffHour = map['diffHour'];
//     radius = map['radius'];
//     inLat = map['inLat'];
//     inLong = map['inLong'];
//     outLat = map['outLat'];
//     outLong = map['outLong'];
//   }
// }

// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_label

// class ProfileModel {
//   ProfileModel({
//     required this.status,
//     required this.message,
//     required this.dataProfile,
//   });
//   late final String? status;
//   late final String? message;
//   late final String? token;
//   late final DataProfile? dataProfile;

//   ProfileModel.fromJson(Map<String?, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     token = json['token'] == null ? "" : json["token"] as String;
//     dataProfile =
//         json['data'] != null ? DataProfile.fromJson(json['data']) : null;
//   }

//   Map<String?, dynamic> toJson() {
//     final _data = <String?, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     if (dataProfile != null) {
//       _data['data'] = dataProfile!.toJson();
//     }

//     return _data;
//   }
// }

// class DataProfile {
//   DataProfile({
//     this.id,
//   });
//   String? id;

//   DataProfile.fromJson(Map<String?, dynamic> json) {
//     id = json['_id'];
//   }

//   Map<String?, dynamic> toJson() {
//     final _data = <String?, dynamic>{};
//     _data['_id'] = id;
//     return _data;
//   }

//   toMap() {
//     return {
//       '_id': id,
//     };
//   }

//   DataProfile.fromMap(Map<String?, dynamic> map) {
//     id = map['_id'];
//   }
// }

class ProfileModel {
  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final Data data;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.role,
    required this.roleAccess,
    required this.office,
    required this.device,
    required this.fcmToken,
    required this.avatar,
    required this.avatarPath,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String username;
  late final String phone;
  late final String email;
  late final Role role;
  late final List<RoleAccess> roleAccess;
  late final Office office;
  late final String device;
  late final String fcmToken;
  late final String avatar;
  late final String avatarPath;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    role = Role.fromJson(json['role']);
    roleAccess = List.from(json['role_access'])
        .map((e) => RoleAccess.fromJson(e))
        .toList();
    office = Office.fromJson(json['office']);
    device = json['device'];
    fcmToken = json['fcm_token'];
    avatar = json['avatar'];
    avatarPath = json['avatar_path'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['role'] = role.toJson();
    _data['role_access'] = roleAccess.map((e) => e.toJson()).toList();
    _data['office'] = office.toJson();
    _data['device'] = device;
    _data['fcm_token'] = fcmToken;
    _data['avatar'] = avatar;
    _data['avatar_path'] = avatarPath;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String slug;
  late final String createdAt;
  late final String updatedAt;

  Role.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class RoleAccess {
  RoleAccess({
    required this.id,
    required this.roleId,
    required this.pageId,
    required this.name,
    required this.slug,
    required this.parent,
    required this.createdAt,
  });
  late final String id;
  late final String roleId;
  late final String pageId;
  late final String name;
  late final String slug;
  late final String parent;
  late final String createdAt;

  RoleAccess.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    roleId = json['role_id'];
    pageId = json['page_id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['role_id'] = roleId;
    _data['page_id'] = pageId;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['parent'] = parent;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class Office {
  Office({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.provinsiId,
    required this.provinsiName,
    required this.kabkoId,
    required this.kabkoName,
    required this.kecamatanId,
    required this.kecamatanName,
    required this.kelurahanId,
    required this.kelurahanName,
    required this.phone,
    required this.email,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String type;
  late final String address;
  late final String provinsiId;
  late final String provinsiName;
  late final String kabkoId;
  late final String kabkoName;
  late final String kecamatanId;
  late final String kecamatanName;
  late final String kelurahanId;
  late final String kelurahanName;
  late final int phone;
  late final String email;
  late final String createdAt;

  Office.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    type = json['type'];
    address = json['address'];
    provinsiId = json['provinsi_id'];
    provinsiName = json['provinsi_name'];
    kabkoId = json['kabko_id'];
    kabkoName = json['kabko_name'];
    kecamatanId = json['kecamatan_id'];
    kecamatanName = json['kecamatan_name'];
    kelurahanId = json['kelurahan_id'];
    kelurahanName = json['kelurahan_name'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['address'] = address;
    _data['provinsi_id'] = provinsiId;
    _data['provinsi_name'] = provinsiName;
    _data['kabko_id'] = kabkoId;
    _data['kabko_name'] = kabkoName;
    _data['kecamatan_id'] = kecamatanId;
    _data['kecamatan_name'] = kecamatanName;
    _data['kelurahan_id'] = kelurahanId;
    _data['kelurahan_name'] = kelurahanName;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['created_at'] = createdAt;
    return _data;
  }
}
