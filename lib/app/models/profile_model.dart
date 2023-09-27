// ignore_for_file: no_leading_underscores_for_local_identifiers

class ProfileModel {
  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final DataProfile data;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = DataProfile.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataProfile {
  DataProfile({
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

  DataProfile.fromJson(Map<String, dynamic> json) {
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
