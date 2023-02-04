import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:sslim_mobile/api/constant.dart';
import 'package:http/http.dart' as http;
import 'package:sslim_mobile/errorpipes.dart';

import 'package:sslim_mobile/models/agent/agentreferenceresponse.dart';
import 'package:sslim_mobile/models/agent/party/partmasterdetailsresponsebyid.dart';
import 'package:sslim_mobile/models/agent/party/partyroleresponse.dart';
import 'package:sslim_mobile/models/agent/quotation/quotationresponse.dart';
import 'package:sslim_mobile/models/approval/partymaster_deatils_approval/partymasterdetailsapprovalresponse.dart';
import 'package:sslim_mobile/models/approval/quotation_details/QuotationApprovalResponse.dart';
import 'package:sslim_mobile/models/approval/quotation_details/Quotationresponse.dart';
import 'package:sslim_mobile/models/dashboard/response_model.dart';
import 'package:sslim_mobile/models/login/loginResponsemodal.dart';
import 'package:sslim_mobile/models/rejection/partymasterrejection/partymasterrejectresponse.dart';
import 'package:sslim_mobile/models/sidebar/menu_item_response.dart';
import 'package:sslim_mobile/models/waiver/waivercontractdetailResponse.dart';

import '../models/waiver/waiverapproveorrejectresponse.dart';
import '../models/waiver/waivercontractResponse.dart';

import '../models/containar_tracking/containar_tracking_response.dart';

class ApiService {
  Future<Menuitemresponse?>? menuItems(userName) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1002",
              "param": {"UserCode": userName, "CompanyId": "1"}
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    Menuitemresponse? data = menuitemresponseFromJson(responseJson.body);

    return data;
  }

  Future<PendingPartyMasterListingResponse?>? PartyRolePendingList(
      viewValue) async {
    // print(viewValue);
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1006",
              "param": {
                "UserCode": "Vikram",
                "Agent": viewValue != "ALL" ? viewValue : '',
                "Status": "P",
                "PartyId": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    PendingPartyMasterListingResponse? data =
        pendingPartyMasterListingResponseFromJson(responseJson.body);

    return data;
  }

  Future<Partymasterdetailsresponse?>? PartyMasterDetailsById(partyId) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    try {
      final response = await post(Uri.parse(ApiConstants.baseUrl),
              body: jsonEncode({
                "SP_ID": "1006",
                "param": {
                  "UserCode": "Vikram",
                  "Agent": "",
                  "Status": "P",
                  "PartyId": partyId,
                  // "PartyId": partyId
                }
              }),
              headers: headers)
          .timeout(const Duration(seconds: 10));
      print(response);
      responseJson = _returnResponse(response);
      Partymasterdetailsresponse? data =
          partymasterdetailsresponseFromJson(responseJson.body);
      print(data);

      return data;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<AgentRefResponse?>? AgentRef() async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1005",
              "param": {"UserCode": "GIT", "CompanyId": "1"}
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    AgentRefResponse? data = agentRefResponseFromJson(responseJson.body);

    return data;
  }

  Future<Partymasterdetailsapprovalresponse?>? partymasterdetailsapproval(
      partyId) async {
    print("hey sucss");
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1008",
              "param": {
                "UserCode": "Vikram",
                "PartyId": partyId,
                "Status": "A",
                "Remarks": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    Partymasterdetailsapprovalresponse? data =
        partymasterdetailsapprovalresponseFromJson(responseJson.body);
    print(data);
    return data;
  }

  Future<Partymasterdetailsrejectresponse?>? partymasterdetailsreject(
      partyId) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1008",
              "param": {
                "UserCode": "Vikram",
                "PartyId": partyId,
                "Status": "R",
                "Remarks": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    Partymasterdetailsrejectresponse? data =
        partymasterdetailsrejectresponseFromJson(responseJson.body);
    print(data);
    return data;
  }

  Future<waiverApproveorRejectResponse?>? approveButton(
      RequestId, userName) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1010",
              "param": {
                "UserCode": userName,
                "RequestId": RequestId,
                "Status": "A",
                "Remarks": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    waiverApproveorRejectResponse? data =
        waiverApproveorRejectResponseFromJson(responseJson.body);
    print(data);
    return data;
  }

  Future<waiverApproveorRejectResponse?>? RejButton(RequestId, userName) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1010",
              "param": {
                "UserCode": userName,
                "RequestId": RequestId,
                "Status": "R",
                "Remarks": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    waiverApproveorRejectResponse? data =
        waiverApproveorRejectResponseFromJson(responseJson.body);
    print(data);
    return data;
  }

  Future<QuotationApprovalResponse?>? approvOrRejectButton(
      quotNo, userName) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1007",
              "param": {
                "UserCode": userName,
                "QuotationNo": quotNo,
                "Status": "A",
                "Remarks": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    QuotationApprovalResponse? data =
        quotationApprovalResponseFromJson(responseJson.body);
    print(data);
    return data;
  }

  Future<QuotationApprovalResponse?>? QuotationDetailReject(
      quotNo, userName) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    print("test");
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1007",
              "param": {
                "UserCode": userName,
                "QuotationNo": quotNo,
                "Status": "R",
                "Remarks": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    QuotationApprovalResponse? data =
        quotationApprovalResponseFromJson(responseJson.body);
    print(data);
    return data;
  }

  Future<LoginModelResponse?>? loginCall(String userName, password) async {
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};

    final response = await post(
      Uri.parse(ApiConstants.baseUrl),
      body: jsonEncode({
        "SP_ID": "1001",
        "param": {
          "UserCode": userName,
          "CompanyId": errorConstants.companyId,
          "Password": password
        }
      }),
      headers: headers,
    ).timeout(const Duration(seconds: 30));
    print(response);
    LoginModelResponse dataVal = loginModelResponseFromJson(response.body);

    responseJson = _returnResponse(response);
    LoginModelResponse? data = loginModelResponseFromJson(responseJson.body);
    print(data);
    if (data.data.table[0].loginStatus == "SUCCESS") {
      final loginCredentials = json.encode(dataVal.data.table1[0]);
    }
    return data;
  }

  Future<AgentRefResponse?>? primaryAgentDataFetch(userName, viewValue) async {
    // print(viewValue);
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1004",
              "param": {
                "UserCode": userName,
                "Status": "P",
                "Agent": viewValue != "ALL" ? viewValue : '',
                "QuotationNo": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    AgentRefResponse? data = agentRefResponseFromJson(responseJson.body);

    return data;
  }

  Future<WaiverContractResponse?>? primaryWaiverDataFetch(
      userName, viewValue) async {
    // print(viewValue);
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1009",
              "param": {
                "UserCode": userName,
                "Agent": viewValue != "ALL" ? viewValue : '',
                "Status": "P",
                "RequestId": ""
              }
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    WaiverContractResponse? data =
        waiverContractResponseFromJson(responseJson.body);

    return data;
  }

  Future<WaiverContractDetailsResponse> waiverServiceIntgration(
      RequestId, userName) async {
    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(
      Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
      body: jsonEncode({
        "SP_ID": "1009",
        "param": {
          "UserCode": userName,
          "Agent": "",
          "Status": "P",
          "RequestId": RequestId
        }
      }),
      headers: headers,
    ).timeout(const Duration(seconds: 10));

    WaiverContractDetailsResponse dataval =
        waiverContractDetailsResponseFromJson(response.body);
    return dataval;
  }

  Future<QuotationListResponse?>? initialResponse(userName) async {
    // print(viewValue);
    var responseJson;

    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(Uri.parse(ApiConstants.baseUrl),
            body: jsonEncode({
              "SP_ID": "1005",
              "param": {"UserCode": userName, "CompanyId": "1"}
            }),
            headers: headers)
        .timeout(const Duration(seconds: 10));
    print(response);
    responseJson = _returnResponse(response);
    QuotationListResponse? data =
        quotationListResponseFromJson(responseJson.body);

    return data;
  }

  Future<QuotationResponse> selectedQuotationDetails(
      userName, quotationNumber) async {
    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(
      Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
      body: jsonEncode({
        "SP_ID": "1004",
        "param": {
          "UserCode": userName,
          "Status": "P",
          "Agent": "",
          "QuotationNo": quotationNumber
        }
      }),
      headers: headers,
    ).timeout(const Duration(seconds: 10));

    // print(response.body);
    QuotationResponse dataval = quotationResponseFromJson(response.body);

    //  var pary_name=dataval!.data!.table![0]!.agentName;
    return dataval;
  }

  Future<DashBoardResponse> getDashBoardItems(userName) async {
    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(
      Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
      body: jsonEncode({
        "SP_ID": "1002",
        "param": {"UserCode": userName, "CompanyId": "1"}
      }),
      headers: headers,
    ).timeout(const Duration(seconds: 10));

    // print(response.body);
    DashBoardResponse dataval = dashBoardResponseFromJson(response.body);

    //  var pary_name=dataval!.data!.table![0]!.agentName;
    return dataval;
  }

  Future<SampleHttpResponse> getContainerTracking(ContaierNo, type) async {
    var responseJson;
    final headers = {"Content-Type": "application/json", "Accept": "/"};
    final response = await post(
      Uri.parse(ApiConstants.baseUrl),
      body: jsonEncode({
        "SP_ID": "1003",
        "param": {"Type": type, "Value": ContaierNo}
      }),
      headers: headers,
    );
    responseJson = _returnResponse(response);
    print(responseJson);
    SampleHttpResponse data = sampleHttpResponseFromJson(responseJson.body);
    return data;
  }

  dynamic _returnResponse(http.Response response) {
    try {
      if (response.statusCode == 200) {
        print(response);
        return response;
      } else {
        log("no data found");
      }

      return null;
    } on SocketException {
      log("n/w failed");

      throw "server lost";
    } on TimeoutException {
      log("req timeout");
    } catch (e) {
      // log(e.toString());
    }
  }
}
