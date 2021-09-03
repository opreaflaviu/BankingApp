import 'package:banking_app/bloc/personal_information/api_response_type.dart';

class ResponseWrapper {
  ApiResponseType apiResponseType;
  var requestResult;

  ResponseWrapper(this.apiResponseType, {this.requestResult});
}