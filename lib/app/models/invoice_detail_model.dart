class DetailInvoiceModel {
  DetailInvoiceModel({
    required this.status,
    required this.message,
    required this.dataDetailInvoice,
  });

  final String? status;
  final String? message;
  final Data? dataDetailInvoice;

  factory DetailInvoiceModel.fromJson(Map<String, dynamic> json) {
    return DetailInvoiceModel(
      status: json["status"],
      message: json["message"],
      dataDetailInvoice:
          json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.asset,
    required this.auction,
    required this.booking,
    required this.invoiceNum,
    required this.buyerName,
    required this.buyerEmail,
    required this.buyerPhone,
    required this.buyerAddress,
    required this.valueInvoice,
    required this.payment,
    required this.sisaHutang,
    required this.cost,
    required this.commission,
    required this.dataEraId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final Asset? asset;
  final Auction? auction;
  final Booking? booking;
  final String? invoiceNum;
  final String? buyerName;
  final String? buyerEmail;
  final String? buyerPhone;
  final String? buyerAddress;
  final int? valueInvoice;
  final List<dynamic> payment;
  final int? sisaHutang;
  final List<Cost> cost;
  final Commission? commission;
  final String? dataEraId;
  final Status? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["_id"],
      asset: json["asset"] == null ? null : Asset.fromJson(json["asset"]),
      auction:
          json["auction"] == null ? null : Auction.fromJson(json["auction"]),
      booking:
          json["booking"] == null ? null : Booking.fromJson(json["booking"]),
      invoiceNum: json["invoice_num"],
      buyerName: json["buyer_name"],
      buyerEmail: json["buyer_email"],
      buyerPhone: json["buyer_phone"],
      buyerAddress: json["buyer_address"],
      valueInvoice: json["value_invoice"],
      payment: json["payment"] == null
          ? []
          : List<dynamic>.from(json["payment"]!.map((x) => x)),
      sisaHutang: json["sisa_hutang"],
      cost: json["cost"] == null
          ? []
          : List<Cost>.from(json["cost"]!.map((x) => Cost.fromJson(x))),
      commission: json["commission"] == null
          ? null
          : Commission.fromJson(json["commission"]),
      dataEraId: json["data_era_id"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Asset {
  Asset({
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
    required this.feeEra,
    required this.feeEraPercentage,
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
  final List<Image> images;
  final List<dynamic> sertifikat;
  final String? type;
  final Status? status;
  final bool? statusEkslusif;
  final String? nomorObjekPajak;
  final String? namaPic;
  final String? telpPic;
  final String? alamatPic;
  final int? feeEra;
  final int? feeEraPercentage;
  final StatusSertifikat? statusSertifikat;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
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
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      sertifikat: json["sertifikat"] == null
          ? []
          : List<dynamic>.from(json["sertifikat"]!.map((x) => x)),
      type: json["type"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      statusEkslusif: json["status_ekslusif"],
      nomorObjekPajak: json["nomor_objek_pajak"],
      namaPic: json["nama_pic"],
      telpPic: json["telp_pic"],
      alamatPic: json["alamat_pic"],
      feeEra: json["fee_era"],
      feeEraPercentage: json["fee_era_percentage"],
      statusSertifikat: json["status_sertifikat"] == null
          ? null
          : StatusSertifikat.fromJson(json["status_sertifikat"]),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Image {
  Image({
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

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
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
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? alias;
  final String? description;
  final DateTime? createdAt;
  final int? v;
  final DateTime? updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json["_id"],
      name: json["name"],
      alias: json["alias"],
      description: json["description"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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

class Auction {
  Auction({
    required this.id,
    required this.assetId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.status,
    required this.penjualLelangId,
    required this.linkLelang,
    required this.pengumumanLelang,
    required this.kpknl,
    required this.createdAt,
    required this.v,
    required this.tglPelaksanaanLelang,
    required this.updatedAt,
  });

  final String? id;
  final String? assetId;
  final String? userId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? price;
  final String? status;
  final String? penjualLelangId;
  final String? linkLelang;
  final String? pengumumanLelang;
  final String? kpknl;
  final DateTime? createdAt;
  final int? v;
  final DateTime? tglPelaksanaanLelang;
  final DateTime? updatedAt;

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
      id: json["_id"],
      assetId: json["asset_id"],
      userId: json["user_id"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      price: json["price"],
      status: json["status"],
      penjualLelangId: json["penjual_lelang_id"],
      linkLelang: json["link_lelang"],
      pengumumanLelang: json["pengumuman_lelang"],
      kpknl: json["kpknl"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
      tglPelaksanaanLelang:
          DateTime.tryParse(json["tgl_pelaksanaan_lelang"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Booking {
  Booking({
    required this.id,
    required this.userId,
    required this.officeId,
    required this.assetId,
    required this.auctionId,
    required this.bookingNum,
    required this.buyerName,
    required this.buyerEmail,
    required this.buyerPhone,
    required this.buyerAddress,
    required this.value,
    required this.status,
    required this.createdAt,
    required this.v,
  });

  final String? id;
  final String? userId;
  final String? officeId;
  final String? assetId;
  final String? auctionId;
  final String? bookingNum;
  final String? buyerName;
  final String? buyerEmail;
  final String? buyerPhone;
  final String? buyerAddress;
  final int? value;
  final String? status;
  final DateTime? createdAt;
  final int? v;

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json["_id"],
      userId: json["user_id"],
      officeId: json["office_id"],
      assetId: json["asset_id"],
      auctionId: json["auction_id"],
      bookingNum: json["booking_num"],
      buyerName: json["buyer_name"],
      buyerEmail: json["buyer_email"],
      buyerPhone: json["buyer_phone"],
      buyerAddress: json["buyer_address"],
      value: json["value"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
    );
  }
}

class Commission {
  Commission({
    required this.id,
    required this.marketing,
    // required this.fee,
    // required this.feePercentage,
    required this.status,
    required this.createdAt,
  });

  final String? id;
  final Marketing? marketing;
  // final int? fee;
  // final int? feePercentage;
  final String? status;
  final String? createdAt;

  factory Commission.fromJson(Map<String, dynamic> json) {
    return Commission(
      id: json["_id"],
      marketing: json["marketing"] == null
          ? null
          : Marketing.fromJson(json["marketing"]),
      // fee: json["fee"],
      // feePercentage: json["fee_percentage"],
      status: json["status"],
      createdAt: json["created_at"],
    );
  }
}

class Marketing {
  Marketing({required this.json});
  final Map<String, dynamic> json;

  factory Marketing.fromJson(Map<String, dynamic> json) {
    return Marketing(json: json);
  }
}

class Cost {
  Cost({
    required this.id,
    required this.invoiceId,
    required this.typeData,
    required this.title,
    required this.description,
    required this.value,
    required this.marketingId,
    required this.status,
    required this.createdAt,
    required this.v,
  });

  final String? id;
  final String? invoiceId;
  final String? typeData;
  final String? title;
  final String? description;
  final int? value;
  final String? marketingId;
  final String? status;
  final DateTime? createdAt;
  final int? v;

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      id: json["_id"],
      invoiceId: json["invoice_id"],
      typeData: json["type_data"],
      title: json["title"],
      description: json["description"],
      value: json["value"],
      marketingId: json["marketing_id"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      v: json["__v"],
    );
  }
}
