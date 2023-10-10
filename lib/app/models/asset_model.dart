import 'dart:convert';

class AssetModel {
  AssetModel({
    required this.status,
    required this.message,
    required this.dataAsset,
  });
  late final String status;
  late final String message;
  late final DataAsset dataAsset;

  AssetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    dataAsset = DataAsset.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = dataAsset.toJson();
    return _data;
  }
}

class DataAsset {
  DataAsset({
    required this.page,
    required this.totalPage,
    required this.totalData,
    required this.dataListAsset,
  });
  late final int? page;
  late final int? totalPage;
  late final int? totalData;
  late final List<DataListAsset> dataListAsset;

  DataAsset.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPage = json['total_page'];
    totalData = json['total_data'];
    dataListAsset =
        List.from(json['data']).map((e) => DataListAsset.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['total_page'] = totalPage;
    _data['total_data'] = totalData;
    // _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataListAsset {
  DataListAsset({
    final String? id,
    final String? listingId,
    this.user,
    // this.office,
    // this.title,
    // this.klasifikasiAsset,
    // this.description,
    // this.address,
    // this.provinsi,
    // this.kabko,
    // this.kecamatan,
    // this.kelurahan,
    // this.luasBangunan,
    // this.luasTanah,
    // this.kamarTidur,
    // this.kamarMandi,
    // this.price,
    // this.initialPrice,
    // this.images,
    // this.sertifikat,
    // this.type,
    // this.status,
    // this.statusEkslusif,
    // this.nomorObjekPajak,
    // this.namaPic,
    // this.telpPic,
    // this.alamatPic,
    // this.feeEra,
    // this.feeEraPercentage,
    // this.statusSertifikat,
    // this.createdAt,
    // this.updatedAt,
  });
  late final String? id;
  late final String? listingId;
  late final User? user;
  // late final Office? office;
  // late final String? title;
  // late final String? klasifikasiAsset;
  // late final String? description;
  // late final String? address;
  // late final Kabko? provinsi;
  // late final Kabko? kabko;
  // late final Kabko? kecamatan;
  // late final Kabko? kelurahan;
  // late final int? luasBangunan;
  // late final int? luasTanah;
  // late final int? kamarTidur;
  // late final int? kamarMandi;
  // late final int? price;
  // late final int? initialPrice;
  // late final Images? images;
  // late final dynamic sertifikat;
  // late final String? type;
  // late final Status? status;
  // late final bool? statusEkslusif;
  // late final String? nomorObjekPajak;
  // late final String? namaPic;
  // late final String? telpPic;
  // late final String? alamatPic;
  // late final int? feeEra;
  // late final double? feeEraPercentage;
  // late final StatusSertifikat? statusSertifikat;
  // late final DateTime? createdAt;
  // late final DateTime? updatedAt;

  DataListAsset.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    listingId = json["listing_id"];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['listing_id'] = listingId;
    _data['data'] = user!.toJson();
    return _data;
  }
}

class User {
  late final String? idUser;
  late final String? name;
  late final String? username;
  late final String? phone;
  late final String? email;
  // final Role? role;
  late final String? device;
  late final String? fcmToken;
  late final bool? approve;

  User({
    this.idUser,
    this.name,
    this.username,
    this.phone,
    this.email,
    // this.role,
    this.device,
    this.fcmToken,
    this.approve,
  });

  // String toJson() => json.encode(toMap());

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['_id'];
    name = json["name"];
    username = json["username"];
    phone = json["phone"];
    email = json["email"];
    // role: json["role"] == null ? null : Role.fromMap(json["role"]),
    device = json["device"];
    fcmToken = json["fcm_token"];
    approve = json["approve"];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = idUser;
    _data['name'] = name;
    _data['username'] = username;
    _data['phone'] = phone;
    _data['email'] = username;
    // _data['role_access'] = roleAccess!.map((e) => e.toJson()).toList();
    _data['device'] = device;
    _data['fcm_token'] = fcmToken;
    _data['approve'] = approve;
    return _data;
  }
}
