import 'dart:convert';

class AssetModel {
  final String? status;
  final String? message;
  final Data? data;

  AssetModel({
    this.status,
    this.message,
    this.data,
  });

  factory AssetModel.fromJson(String str) =>
      AssetModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssetModel.fromMap(Map<String, dynamic> json) => AssetModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final int? page;
  final int? totalPage;
  final int? totalData;
  final List<Datum>? data;

  Data({
    this.page,
    this.totalPage,
    this.totalData,
    this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        page: json["page"],
        totalPage: json["total_page"],
        totalData: json["total_data"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "total_page": totalPage,
        "total_data": totalData,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final String? id;
  final String? listingId;
  final User? user;
  final Office? office;
  final String? title;
  final String? klasifikasiAsset;
  final String? description;
  final String? address;
  final Kabko? provinsi;
  final Kabko? kabko;
  final Kabko? kecamatan;
  final Kabko? kelurahan;
  final int? luasBangunan;
  final int? luasTanah;
  final int? kamarTidur;
  final int? kamarMandi;
  final int? price;
  final int? initialPrice;
  final Images? images;
  final dynamic sertifikat;
  final String? type;
  final Status? status;
  final bool? statusEkslusif;
  final String? nomorObjekPajak;
  final String? namaPic;
  final String? telpPic;
  final String? alamatPic;
  final int? feeEra;
  final double? feeEraPercentage;
  final StatusSertifikat? statusSertifikat;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.listingId,
    this.user,
    this.office,
    this.title,
    this.klasifikasiAsset,
    this.description,
    this.address,
    this.provinsi,
    this.kabko,
    this.kecamatan,
    this.kelurahan,
    this.luasBangunan,
    this.luasTanah,
    this.kamarTidur,
    this.kamarMandi,
    this.price,
    this.initialPrice,
    this.images,
    this.sertifikat,
    this.type,
    this.status,
    this.statusEkslusif,
    this.nomorObjekPajak,
    this.namaPic,
    this.telpPic,
    this.alamatPic,
    this.feeEra,
    this.feeEraPercentage,
    this.statusSertifikat,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        listingId: json["listing_id"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        office: json["office"] == null ? null : Office.fromMap(json["office"]),
        title: json["title"],
        klasifikasiAsset: json["klasifikasi_asset"],
        description: json["description"],
        address: json["address"],
        provinsi:
            json["provinsi"] == null ? null : Kabko.fromMap(json["provinsi"]),
        kabko: json["kabko"] == null ? null : Kabko.fromMap(json["kabko"]),
        kecamatan:
            json["kecamatan"] == null ? null : Kabko.fromMap(json["kecamatan"]),
        kelurahan:
            json["kelurahan"] == null ? null : Kabko.fromMap(json["kelurahan"]),
        luasBangunan: json["luas_bangunan"],
        luasTanah: json["luas_tanah"],
        kamarTidur: json["kamar_tidur"],
        kamarMandi: json["kamar_mandi"],
        price: json["price"],
        initialPrice: json["initial_price"],
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        sertifikat: json["sertifikat"],
        type: json["type"],
        status: json["status"] == null ? null : Status.fromMap(json["status"]),
        statusEkslusif: json["status_ekslusif"],
        nomorObjekPajak: json["nomor_objek_pajak"],
        namaPic: json["nama_pic"],
        telpPic: json["telp_pic"],
        alamatPic: json["alamat_pic"],
        feeEra: json["fee_era"],
        feeEraPercentage: json["fee_era_percentage"]?.toDouble(),
        statusSertifikat: json["status_sertifikat"] == null
            ? null
            : StatusSertifikat.fromMap(json["status_sertifikat"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "listing_id": listingId,
        "user": user?.toMap(),
        "office": office?.toMap(),
        "title": title,
        "klasifikasi_asset": klasifikasiAsset,
        "description": description,
        "address": address,
        "provinsi": provinsi?.toMap(),
        "kabko": kabko?.toMap(),
        "kecamatan": kecamatan?.toMap(),
        "kelurahan": kelurahan?.toMap(),
        "luas_bangunan": luasBangunan,
        "luas_tanah": luasTanah,
        "kamar_tidur": kamarTidur,
        "kamar_mandi": kamarMandi,
        "price": price,
        "initial_price": initialPrice,
        "images": images?.toMap(),
        "sertifikat": sertifikat,
        "type": type,
        "status": status?.toMap(),
        "status_ekslusif": statusEkslusif,
        "nomor_objek_pajak": nomorObjekPajak,
        "nama_pic": namaPic,
        "telp_pic": telpPic,
        "alamat_pic": alamatPic,
        "fee_era": feeEra,
        "fee_era_percentage": feeEraPercentage,
        "status_sertifikat": statusSertifikat?.toMap(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Images {
  final String? id;
  final String? assetId;
  final String? caption;
  final String? filename;
  final String? path;
  final DateTime? createdAt;
  final int? v;

  Images({
    this.id,
    this.assetId,
    this.caption,
    this.filename,
    this.path,
    this.createdAt,
    this.v,
  });

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        id: json["_id"],
        assetId: json["asset_id"],
        caption: json["caption"],
        filename: json["filename"],
        path: json["path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "asset_id": assetId,
        "caption": caption,
        "filename": filename,
        "path": path,
        "created_at": createdAt?.toIso8601String(),
        "__v": v,
      };
}

class Kabko {
  final int? active;
  final String? id;
  final String? lokasiId;
  final String? lokasiKode;
  final String? lokasiNama;
  final String? lokasiPropinsi;
  final String? lokasiKabupatenkota;
  final DateTime? createdAt;
  final String? lokasiKecamatan;
  final String? lokasiKelurahan;
  final String? kodePos;

  Kabko({
    this.active,
    this.id,
    this.lokasiId,
    this.lokasiKode,
    this.lokasiNama,
    this.lokasiPropinsi,
    this.lokasiKabupatenkota,
    this.createdAt,
    this.lokasiKecamatan,
    this.lokasiKelurahan,
    this.kodePos,
  });

  factory Kabko.fromJson(String str) => Kabko.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kabko.fromMap(Map<String, dynamic> json) => Kabko(
        active: json["active"],
        id: json["_id"],
        lokasiId: json["lokasi_id"],
        lokasiKode: json["lokasi_kode"],
        lokasiNama: json["lokasi_nama"],
        lokasiPropinsi: json["lokasi_propinsi"],
        lokasiKabupatenkota: json["lokasi_kabupatenkota"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        lokasiKecamatan: json["lokasi_kecamatan"],
        lokasiKelurahan: json["lokasi_kelurahan"],
        kodePos: json["kode_pos"],
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "_id": id,
        "lokasi_id": lokasiId,
        "lokasi_kode": lokasiKode,
        "lokasi_nama": lokasiNama,
        "lokasi_propinsi": lokasiPropinsi,
        "lokasi_kabupatenkota": lokasiKabupatenkota,
        "created_at": createdAt?.toIso8601String(),
        "lokasi_kecamatan": lokasiKecamatan,
        "lokasi_kelurahan": lokasiKelurahan,
        "kode_pos": kodePos,
      };
}

class Office {
  final String? id;
  final String? name;
  final String? type;
  final String? address;
  final String? provinsiId;
  final String? provinsiName;
  final String? kabkoId;
  final String? kabkoName;
  final String? kecamatanId;
  final String? kecamatanName;
  final String? kelurahanId;
  final String? kelurahanName;
  final String? phone;
  final String? email;
  final DateTime? createdAt;

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
    this.phone,
    this.email,
    this.createdAt,
  });

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
        phone: json["phone"],
        email: json["email"],
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
        "phone": phone,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Status {
  final String? id;
  final String? name;
  final String? alias;
  final String? description;
  final DateTime? createdAt;
  final int? v;

  Status({
    this.id,
    this.name,
    this.alias,
    this.description,
    this.createdAt,
    this.v,
  });

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        id: json["_id"],
        name: json["name"],
        alias: json["alias"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "alias": alias,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "__v": v,
      };
}

class StatusSertifikat {
  final String? id;
  final String? name;
  final String? alias;
  final DateTime? createdAt;

  StatusSertifikat({
    this.id,
    this.name,
    this.alias,
    this.createdAt,
  });

  factory StatusSertifikat.fromJson(String str) =>
      StatusSertifikat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusSertifikat.fromMap(Map<String, dynamic> json) =>
      StatusSertifikat(
        id: json["_id"],
        name: json["name"],
        alias: json["alias"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "alias": alias,
        "created_at": createdAt?.toIso8601String(),
      };
}

class User {
  final String? id;
  final String? name;
  final String? username;
  final String? phone;
  final String? email;
  final Role? role;
  final String? device;
  final String? fcmToken;
  final bool? approve;

  User({
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.role,
    this.device,
    this.fcmToken,
    this.approve,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"] == null ? null : Role.fromMap(json["role"]),
        device: json["device"],
        fcmToken: json["fcm_token"],
        approve: json["approve"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "username": username,
        "phone": phone,
        "email": email,
        "role": role?.toMap(),
        "device": device,
        "fcm_token": fcmToken,
        "approve": approve,
      };
}

class Role {
  final String? id;
  final String? name;
  final String? slug;
  final DateTime? createdAt;
  final int? v;
  final DateTime? updatedAt;

  Role({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.v,
    this.updatedAt,
  });

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
