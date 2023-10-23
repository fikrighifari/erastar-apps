class AssetModel {
  AssetModel({
    required this.status,
    required this.message,
    required this.dataAsset,
  });

  final String? status;
  final String? message;
  final DataAsset? dataAsset;

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      status: json["status"],
      message: json["message"],
      dataAsset: json["data"] == null ? null : DataAsset.fromJson(json["data"]),
    );
  }
}

class DataAsset {
  DataAsset({
    required this.page,
    required this.totalPage,
    required this.totalData,
    required this.data,
  });

  final int? page;
  final int? totalPage;
  final int? totalData;
  final List<DataListAsset> data;

  factory DataAsset.fromJson(Map<String, dynamic> json) {
    return DataAsset(
      page: json["page"],
      totalPage: json["total_page"],
      totalData: json["total_data"],
      data: json["data"] == null
          ? []
          : List<DataListAsset>.from(
              json["data"]!.map((x) => DataListAsset.fromJson(x))),
    );
  }
}

class DataListAsset {
  DataListAsset({
    required this.id,
    required this.listingId,
    required this.user,
    required this.office,
    required this.title,
    required this.klasifikasiAsset,
    required this.description,
    required this.address,
    required this.provinsi,
    required this.kabko,
    required this.kecamatan,
    required this.kelurahan,
    required this.luasBangunan,
    required this.luasTanah,
    required this.kamarTidur,
    required this.kamarMandi,
    required this.price,
    required this.initialPrice,
    required this.images,
    required this.sertifikat,
    required this.type,
    required this.status,
    required this.statusEkslusif,
    required this.nomorObjekPajak,
    required this.namaPic,
    required this.telpPic,
    required this.alamatPic,
    // required this.feeEra,
    // required this.feeEraPercentage,
    required this.statusSertifikat,
    required this.createdAt,
    required this.updatedAt,
  });

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
  final ImagesAsset? images;
  final dynamic sertifikat;
  final String? type;
  final Status? status;
  final bool? statusEkslusif;
  final String? nomorObjekPajak;
  final String? namaPic;
  final String? telpPic;
  final String? alamatPic;
  // final int? feeEra;
  // final double? feeEraPercentage;
  final StatusSertifikat? statusSertifikat;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataListAsset.fromJson(Map<String, dynamic> json) {
    return DataListAsset(
      id: json["_id"],
      listingId: json["listing_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      office: json["office"] == null ? null : Office.fromJson(json["office"]),
      title: json["title"],
      klasifikasiAsset: json["klasifikasi_asset"],
      description: json["description"],
      address: json["address"],
      provinsi:
          json["provinsi"] == null ? null : Kabko.fromJson(json["provinsi"]),
      kabko: json["kabko"] == null ? null : Kabko.fromJson(json["kabko"]),
      kecamatan:
          json["kecamatan"] == null ? null : Kabko.fromJson(json["kecamatan"]),
      kelurahan:
          json["kelurahan"] == null ? null : Kabko.fromJson(json["kelurahan"]),
      luasBangunan: json["luas_bangunan"],
      luasTanah: json["luas_tanah"],
      kamarTidur: json["kamar_tidur"],
      kamarMandi: json["kamar_mandi"],
      price: json["price"],
      initialPrice: json["initial_price"],
      images:
          json["images"] == null ? null : ImagesAsset.fromJson(json["images"]),
      sertifikat: json["sertifikat"],
      type: json["type"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      statusEkslusif: json["status_ekslusif"],
      nomorObjekPajak: json["nomor_objek_pajak"],
      namaPic: json["nama_pic"],
      telpPic: json["telp_pic"],
      alamatPic: json["alamat_pic"],
      // feeEra: json["fee_era"],
      // feeEraPercentage: json["fee_era_percentage"],
      statusSertifikat: json["status_sertifikat"] == null
          ? null
          : StatusSertifikat.fromJson(json["status_sertifikat"]),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class ImagesAsset {
  ImagesAsset({
    required this.id,
    required this.assetId,
    required this.caption,
    required this.filename,
    required this.path,
    required this.createdAt,
    required this.v,
  });

  final String? id;
  final String? assetId;
  final String? caption;
  final String? filename;
  final String? path;
  final DateTime? createdAt;
  final int? v;

  factory ImagesAsset.fromJson(Map<String, dynamic> json) {
    return ImagesAsset(
      id: json["_id"],
      assetId: json["asset_id"],
      caption: json["caption"],
      filename: json["filename"],
      path: json["path"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
    );
  }
}

class Kabko {
  Kabko({
    required this.active,
    required this.id,
    required this.lokasiId,
    required this.lokasiKode,
    required this.lokasiNama,
    required this.lokasiPropinsi,
    required this.lokasiKabupatenkota,
    required this.createdAt,
    required this.lokasiKecamatan,
    required this.lokasiKelurahan,
    required this.kodePos,
  });

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

  factory Kabko.fromJson(Map<String, dynamic> json) {
    return Kabko(
      active: json["active"],
      id: json["_id"],
      lokasiId: json["lokasi_id"],
      lokasiKode: json["lokasi_kode"],
      lokasiNama: json["lokasi_nama"],
      lokasiPropinsi: json["lokasi_propinsi"],
      lokasiKabupatenkota: json["lokasi_kabupatenkota"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      lokasiKecamatan: json["lokasi_kecamatan"],
      lokasiKelurahan: json["lokasi_kelurahan"],
      kodePos: json["kode_pos"],
    );
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

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
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
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.alias,
    required this.description,
    required this.createdAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? alias;
  final String? description;
  final DateTime? createdAt;
  final int? v;

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json["_id"],
      name: json["name"],
      alias: json["alias"],
      description: json["description"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
    );
  }
}

class StatusSertifikat {
  StatusSertifikat({
    required this.id,
    required this.name,
    required this.alias,
    required this.createdAt,
  });

  final String? id;
  final String? name;
  final String? alias;
  final DateTime? createdAt;

  factory StatusSertifikat.fromJson(Map<String, dynamic> json) {
    return StatusSertifikat(
      id: json["_id"],
      name: json["name"],
      alias: json["alias"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.role,
    required this.device,
    required this.fcmToken,
    required this.approve,
  });

  final String? id;
  final String? name;
  final String? username;
  final String? phone;
  final String? email;
  final Role? role;
  final String? device;
  final String? fcmToken;
  final bool? approve;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      name: json["name"],
      username: json["username"],
      phone: json["phone"],
      email: json["email"],
      role: json["role"] == null ? null : Role.fromJson(json["role"]),
      device: json["device"],
      fcmToken: json["fcm_token"],
      approve: json["approve"],
    );
  }
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.v,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? slug;
  final DateTime? createdAt;
  final int? v;
  final DateTime? updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
