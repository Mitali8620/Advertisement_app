class LoginModel {
  String? status;
  String? message;
  Result? result;

  LoginModel({this.status, this.message, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? token;
  UserData? user;
  String? refreshToken;
  String? refreshTokenExpiration;
  bool? profileComplete;
  bool? adressComplete;
  bool? documentComplete;

  Result(
      {this.token,
        this.user,
        this.refreshToken,
        this.refreshTokenExpiration,
        this.profileComplete,
        this.adressComplete,
        this.documentComplete});

  Result.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    refreshToken = json['refreshToken'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
    profileComplete = json['profileComplete'];
    adressComplete = json['adressComplete'];
    documentComplete = json['documentComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['refreshToken'] = this.refreshToken;
    data['refreshTokenExpiration'] = this.refreshTokenExpiration;
    data['profileComplete'] = this.profileComplete;
    data['adressComplete'] = this.adressComplete;
    data['documentComplete'] = this.documentComplete;
    return data;
  }
}

class UserData {
  String? id;
  String? userAddressId;
  String? fullName;
  String? type;
  String? email;
  String? phoneNumber;
  String? profileImage;
  num? rating;
  String? defaultLanguage;
  String? myReferralCode;
  String? referralCode;
  num? walletBalance;
  String? created;
  String? lastModified;
  String? status;
  String? shopName;
  bool? profileComplete;
  bool? adressComplete;
  bool? documentComplete;
  UserData(
      {this.id,
        this.userAddressId,
        this.fullName,
        this.type,
        this.email,
        this.phoneNumber,
        this.profileImage,
        this.rating,
        this.defaultLanguage,
        this.myReferralCode,
        this.referralCode,
        this.walletBalance,
        this.created,
        this.lastModified,
        this.status,
        this.shopName,
        this.profileComplete,
        this.adressComplete,
        this.documentComplete
      });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userAddressId = json['userAddressId'];
    fullName = json['fullName'];
    type = json['type'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profileImage = json['profileImage'];
    rating = json['rating'];
    defaultLanguage = json['defaultLanguage'];
    myReferralCode = json['myReferralCode'];
    referralCode = json['referralCode'];
    walletBalance = json['walletBalance'];
    created = json['created'];
    lastModified = json['lastModified'];
    status = json['status'];
    shopName = json['shopName'] ?? "";
    profileComplete = json['profileComplete'] ?? false;
    adressComplete = json['adressComplete'] ?? false;
    documentComplete = json['documentComplete'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userAddressId'] = this.userAddressId;
    data['fullName'] = this.fullName;
    data['type'] = this.type;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['profileImage'] = this.profileImage;
    data['rating'] = this.rating;
    data['defaultLanguage'] = this.defaultLanguage;
    data['myReferralCode'] = this.myReferralCode;
    data['referralCode'] = this.referralCode;
    data['walletBalance'] = this.walletBalance;
    data['created'] = this.created;
    data['lastModified'] = this.lastModified;
    data['status'] = this.status;
    data['shopName'] = this.shopName ?? "";
    data['profileComplete'] = this.profileComplete;
    data['adressComplete'] = this.adressComplete;
    data['documentComplete'] = this.documentComplete;
    return data;
  }
}