
String setEnumToString({required Enum enumData}) {
  String enumToConvertedData = enumData.toString().split('.').last;
  return enumToConvertedData;
}