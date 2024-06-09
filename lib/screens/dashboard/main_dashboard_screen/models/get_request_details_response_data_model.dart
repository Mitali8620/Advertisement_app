import 'dart:convert';

GetRequestDetailsResponseDataModel getRequestDetailsResponseDataModelFromJson(
        String str) =>
    GetRequestDetailsResponseDataModel.fromJson(json.decode(str));

String getRequestDetailsResponseDataModelToJson(
        GetRequestDetailsResponseDataModel data) =>
    json.encode(data.toJson());

class GetRequestDetailsResponseDataModel {
  final String? status;
  final RequestData? requestData;

  GetRequestDetailsResponseDataModel({
    this.status,
    this.requestData,
  });

  factory GetRequestDetailsResponseDataModel.fromJson(
          Map<String, dynamic> json) =>
      GetRequestDetailsResponseDataModel(
        status: json["status"],
        requestData: json["result"] == null
            ? null
            : RequestData.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": requestData?.toJson(),
      };
}

class RequestData {
  final String? id;
  final String? userId;
  final List<String>? image;

  RequestData({
    this.id,
    this.userId,
    this.image,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        id: json["id"],
        userId: json["userId"],
        image: json["images"] != null
            ? List<String>.from(json["images"])
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "images": image,
      };
}

