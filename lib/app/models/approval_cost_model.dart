class ApprovalCostModel {
  ApprovalCostModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final DataApproval? data;

  factory ApprovalCostModel.fromJson(Map<String, dynamic> json) {
    return ApprovalCostModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : DataApproval.fromJson(json["data"]),
    );
  }
}

class DataApproval {
  DataApproval({
    required this.page,
    required this.totalPage,
    required this.totalData,
    required this.dataListApproval,
  });

  final int? page;
  final int? totalPage;
  final int? totalData;
  final List<DataListApproval> dataListApproval;

  factory DataApproval.fromJson(Map<String, dynamic> json) {
    return DataApproval(
      page: json["page"],
      totalPage: json["total_page"],
      totalData: json["total_data"],
      dataListApproval: json["data"] == null
          ? []
          : List<DataListApproval>.from(
              json["data"]!.map((x) => DataListApproval.fromJson(x))),
    );
  }
}

class DataListApproval {
  DataListApproval({
    required this.id,
    required this.invoice,
    required this.typeData,
    required this.title,
    required this.description,
    required this.value,
    required this.marketingId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final Invoice? invoice;
  final String? typeData;
  final String? title;
  final String? description;
  final int? value;
  final String? marketingId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataListApproval.fromJson(Map<String, dynamic> json) {
    return DataListApproval(
      id: json["_id"],
      invoice:
          json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
      typeData: json["type_data"],
      title: json["title"],
      description: json["description"],
      value: json["value"],
      marketingId: json["marketing_id"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Invoice {
  Invoice({
    required this.id,
    required this.invoiceNum,
    required this.assetId,
    required this.officeId,
    required this.auctionId,
    required this.bookingId,
    required this.buyerName,
    required this.buyerEmail,
    required this.buyerPhone,
    required this.buyerAddress,
    required this.valueInvoice,
    required this.status,
    required this.dataEraId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? invoiceNum;
  final String? assetId;
  final String? officeId;
  final String? auctionId;
  final String? bookingId;
  final String? buyerName;
  final String? buyerEmail;
  final String? buyerPhone;
  final String? buyerAddress;
  final int? valueInvoice;
  final Status? status;
  final String? dataEraId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json["_id"],
      invoiceNum: json["invoice_num"],
      assetId: json["asset_id"],
      officeId: json["office_id"],
      auctionId: json["auction_id"],
      bookingId: json["booking_id"],
      buyerName: json["buyer_name"],
      buyerEmail: json["buyer_email"],
      buyerPhone: json["buyer_phone"],
      buyerAddress: json["buyer_address"],
      valueInvoice: json["value_invoice"],
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      dataEraId: json["data_era_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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
