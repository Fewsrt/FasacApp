import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LumpONCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Lump ON',
      apiUrl:
          'https://blynk.honey.co.th/RNNo8kryED5dTVdV9_109PRVELznPq7n/update/V3?value=1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class LumpOFFCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Lump OFF',
      apiUrl:
          'https://blynk.honey.co.th/RNNo8kryED5dTVdV9_109PRVELznPq7n/update/V3?value=0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
