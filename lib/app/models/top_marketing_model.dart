class TopMarketingModel {
  TopMarketingModel({
    required this.status,
    required this.message,
    required this.dataTopMarketing,
  });

  final String? status;
  final String? message;
  final DataTopMarketing? dataTopMarketing;

  factory TopMarketingModel.fromJson(Map<String, dynamic> json) {
    return TopMarketingModel(
      status: json["status"],
      message: json["message"],
      dataTopMarketing:
          json["data"] == null ? null : DataTopMarketing.fromJson(json["data"]),
    );
  }
}

class DataTopMarketing {
  DataTopMarketing({
    required this.page,
    required this.totalPage,
    required this.totalData,
    required this.dataListTopMarketing,
    required this.dataMonthYear,
  });

  final int? page;
  final int? totalPage;
  final int? totalData;
  final List<DataListTopMarketing> dataListTopMarketing;
  final String? dataMonthYear;

  factory DataTopMarketing.fromJson(Map<String, dynamic> json) {
    return DataTopMarketing(
      page: json["page"],
      totalPage: json["total_page"],
      totalData: json["total_data"],
      dataListTopMarketing: json["data"] == null
          ? []
          : List<DataListTopMarketing>.from(
              json["data"]!.map((x) => DataListTopMarketing.fromJson(x))),
      dataMonthYear: json["data_month_year"],
    );
  }
}

class DataListTopMarketing {
  DataListTopMarketing({
    required this.id,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.kodeMa,
    required this.statusMa,
    required this.phone,
    required this.alamatDomisili,
    required this.provinsi,
    required this.kabko,
    required this.kecamatan,
    required this.kelurahan,
    required this.type,
    required this.avatar,
    required this.avatarPath,
    required this.commissionData,
    required this.commissionTotal,
    required this.invoice,
    required this.totalInvoice,
    required this.office,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? email;
  final DateTime? birthDate;
  final String? kodeMa;
  final String? statusMa;
  final String? phone;
  final String? alamatDomisili;
  final Kabko? provinsi;
  final Kabko? kabko;
  final Kabko? kecamatan;
  final Kabko? kelurahan;
  final String? type;
  final String? avatar;
  final String? avatarPath;
  final List<CommissionDataListTopMarketing> commissionData;
  final int? commissionTotal;
  final List<dynamic> invoice;
  final int? totalInvoice;
  final Office? office;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataListTopMarketing.fromJson(Map<String, dynamic> json) {
    return DataListTopMarketing(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      birthDate: DateTime.tryParse(json["birth_date"] ?? ""),
      kodeMa: json["kode_ma"],
      statusMa: json["status_ma"],
      phone: json["phone"],
      alamatDomisili: json["alamat_domisili"],
      provinsi:
          json["provinsi"] == null ? null : Kabko.fromJson(json["provinsi"]),
      kabko: json["kabko"] == null ? null : Kabko.fromJson(json["kabko"]),
      kecamatan:
          json["kecamatan"] == null ? null : Kabko.fromJson(json["kecamatan"]),
      kelurahan:
          json["kelurahan"] == null ? null : Kabko.fromJson(json["kelurahan"]),
      type: json["type"],
      avatar: json["avatar"],
      avatarPath: json["avatar_path"],
      commissionData: json["commission_data"] == null
          ? []
          : List<CommissionDataListTopMarketing>.from(json["commission_data"]!
              .map((x) => CommissionDataListTopMarketing.fromJson(x))),
      commissionTotal: json["commission_total"],
      invoice: json["invoice"] == null
          ? []
          : List<dynamic>.from(json["invoice"]!.map((x) => x)),
      totalInvoice: json["total_invoice"],
      office: json["office"] == null ? null : Office.fromJson(json["office"]),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class CommissionDataListTopMarketing {
  CommissionDataListTopMarketing({
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
    required this.updatedAt,
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
  final DateTime? updatedAt;

  factory CommissionDataListTopMarketing.fromJson(Map<String, dynamic> json) {
    return CommissionDataListTopMarketing(
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
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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
