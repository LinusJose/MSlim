import 'dart:convert';

Partymasterdetailsresponse partymasterdetailsresponseFromJson(String str) =>
    Partymasterdetailsresponse.fromJson(json.decode(str));
// String partymasterdetailsresponseToJson(Partymasterdetailsresponse data) =>
//     json.encode(data.toJson());

class Partymasterdetailsresponse {
  Partymasterdetailsresponse({
    this.sessionId,
    required this.errorCode,
    required this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int errorCode;
  String errorMessage;
  Data data;

  factory Partymasterdetailsresponse.fromJson(Map<String, dynamic> json) =>
      Partymasterdetailsresponse(
        sessionId: json["SessionId"] ?? "",
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
        data: Data.fromJson(json["Data"]),
      );
  // Map<String, dynamic> toJson() => {
  //       "SessionId": sessionId,
  //       "ErrorCode": errorCode,
  //       "ErrorMessage": errorMessage,
  //       "Data": data.toJson(),
  //     };
}

class Data {
  Data({
    required this.table,
    required this.table1,
    required this.table2,
  });
  TableData table;
  TableData1 table1;
  List<Rows> table2;
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: TableData.fromJson(json["Table"] ?? []),
        table1: TableData1.fromJson(json["Table1"] ?? []),
        table2: List<Rows>.from(json["Table2"] != json
            ? json["Table2"].map((x) => Rows.fromJson(x))
            : []),
      );
  // Map<String, dynamic> toJson() =>
  //     {"Table": List<dynamic>.from({}), "Table1": List<dynamic>.from({})};
}

class Element {
  Element({
    required this.title,
    required this.value,
  });
  String title;
  String value;
}

class TableData {
  TableData({
    required this.element,
  });
  List<Element> element;
  factory TableData.fromJson(List<dynamic> json) {
    Map map = json[0];
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return TableData(
        element: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}

class TableData1 {
  TableData1({
    required this.element1,
  });
  List<Element> element1;
  factory TableData1.fromJson(List<dynamic> json) {
    Map map = json[0];
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return TableData1(
        element1: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}

class Rows {
  Rows({
    required this.elements,
  });
  List<Element> elements = [];
  factory Rows.fromJson(Map<String, dynamic> map) {
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return Rows(
        elements: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}


// class Table1 {
//   Table1({
//     required this.element1,
//   });
//   List<Element> element1;
//   factory Table1.fromJson(List<dynamic> json) {
//     Map map = json[0];
//     List keyList = map.keys.toList();
//     List valueList = map.values.toList();
//     return Table1(
//         element1: List<Element>.generate(keyList.length, (index) {
//       return Element(
//           title: keyList[index].toString(), value: valueList[index].toString());
//     }));
//   }
// }