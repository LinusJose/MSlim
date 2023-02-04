// To parse this JSON data, do
//
//     final quotationResponse = quotationResponseFromJson(jsonString);

import 'dart:convert';

QuotationResponse quotationResponseFromJson(String str) =>
    QuotationResponse.fromJson(json.decode(str));

// String quotationResponseToJson(QuotationResponse data) =>
//     json.encode(data.toJson());

class QuotationResponse {
  QuotationResponse({
    this.sessionId,
    required this.errorCode,
    required this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int errorCode;
  String errorMessage;
  Data data;

  factory QuotationResponse.fromJson(Map<String, dynamic> json) =>
      QuotationResponse(
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

  Table1 table;
  List<Rows1> table1;
  List<Rows2> table2;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: Table1.fromJson(json["Table"] ?? []),
        table1: List<Rows1>.from(json["Table1"] != null
            ? json["Table1"].map((x) => Rows1.fromJson(x))
            : []),
        table2: List<Rows2>.from(json["Table2"] != null
            ? json["Table2"].map((x) => Rows2.fromJson(x))
            : []),
      );

  // Map<String, dynamic> toJson() => {
  //       "Table": List<dynamic>.from({}),
  //       "Table1": List<dynamic>.from(table1.map((x) => x.toJson())),
  //       "Table2": List<dynamic>.from(table2.map((x) => x.toJson())),
  //     };
}

class Element {
  Element({
    required this.title,
    required this.value,
  });
  String title;
  String value;
}

class Table1 {
  Table1({
    required this.element2,
  });
  List<Element> element2;
  factory Table1.fromJson(List<dynamic> json) {
    Map map = json[0];
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return Table1(
        element2: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}

class Rows1 {
  Rows1({
    required this.elements,
  });
  List<Element> elements = [];
  factory Rows1.fromJson(Map<String, dynamic> map) {
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return Rows1(
        elements: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}

class Rows2 {
  Rows2({
    required this.elements1,
  });
  List<Element> elements1 = [];
  factory Rows2.fromJson(Map<String, dynamic> map) {
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return Rows2(
        elements1: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}





// class Table1 {
//   Table1({
//     required this.quotationNo,
//     required this.cType,
//     required this.haz,
//     required this.surch,
//     required this.boxes,
//     required this.frtElement,
//     required this.flag,
//     required this.currency,
//     required this.tariff,
//     required this.qtdRate,
//     required this.collectAgent,
//     required this.frtType,
//   });

//   int quotationNo;
//   String cType;
//   String haz;
//   String surch;
//   int boxes;
//   String frtElement;
//   String flag;
//   String currency;
//   double tariff;
//   double qtdRate;
//   String collectAgent;
//   String frtType;

//   factory Table1.fromJson(Map<String, dynamic> json) => Table1(
//         quotationNo: json["QuotationNo"],
//         cType: json["CType"],
//         haz: json["Haz"],
//         surch: json["Surch"],
//         boxes: json["Boxes"],
//         frtElement: json["FrtElement"],
//         flag: json["Flag"],
//         currency: json["Currency"],
//         tariff: json["Tariff"],
//         qtdRate: json["QtdRate"],
//         collectAgent: json["CollectAgent"],
//         frtType: json["FrtType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "QuotationNo": quotationNo,
//         "CType": cType,
//         "Haz": haz,
//         "Surch": surch,
//         "Boxes": boxes,
//         "FrtElement": frtElement,
//         "Flag": flag,
//         "Currency": currency,
//         "Tariff": tariff,
//         "QtdRate": qtdRate,
//         "CollectAgent": collectAgent,
//         "FrtType": frtType,
//       };
// }

// class Table2 {
//   Table2({
//     required this.quotationNo,
//     required this.expImp,
//     required this.frtElement,
//     required this.defWaiver,
//     required this.addWaiver,
//   });

//   int quotationNo;
//   String expImp;
//   String frtElement;
//   int defWaiver;
//   int addWaiver;

//   factory Table2.fromJson(Map<String, dynamic> json) => Table2(
//         quotationNo: json["QuotationNo"],
//         expImp: json["Exp/Imp"],
//         frtElement: json["FrtElement"],
//         defWaiver: json["Def.Waiver"],
//         addWaiver: json["Add.Waiver"],
//       );

//   Map<String, dynamic> toJson() => {
//         "QuotationNo": quotationNo,
//         "Exp/Imp": expImp,
//         "FrtElement": frtElement,
//         "Def.Waiver": defWaiver,
//         "Add.Waiver": addWaiver,
//       };
// }
