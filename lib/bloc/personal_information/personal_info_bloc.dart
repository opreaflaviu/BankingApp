import 'dart:io';

import 'package:banking_app/bloc/personal_information/api_response_type.dart';
import 'package:banking_app/bloc/personal_information/personal_info_state.dart';
import 'package:banking_app/bloc/personal_information/response_wrapper.dart';
import 'package:banking_app/network/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_picker/images_picker.dart';
import 'package:open_file/open_file.dart';

class PersonalInfoBloc extends Cubit<PersonalInfoState> {
  late ApiManager _apiManager;

  var _personalInfoState = PersonalInfoState("", "", true, "", 0, "");

  PersonalInfoBloc() : super(PersonalInfoState("", "", true, "", 0, "")) {
    _apiManager = ApiManager.apiManager;
    emit(_personalInfoState);
  }

  void previewImage() {
    OpenFile.open(_personalInfoState.imagePath);
  }

  Future getImage() async {
    List<Media>? res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
    );
    if (res != null && res.isNotEmpty) {
      var media = res[0];
      _personalInfoState.imagePath = media.path;
      emit(PersonalInfoState(
          "", "", _personalInfoState.isEmployed, "", 0, media.path));
    }
  }

  String getImageName(String path) {
    return path.split("/").last;
  }

  void onIsEmployedChange(bool isEmployed) {
    _personalInfoState.isEmployed = isEmployed;
    emit(PersonalInfoState(
        "", "", isEmployed, "", 0, _personalInfoState.imagePath));
  }

  void onFirstNameChanged(String firstName) {
    _personalInfoState.firstName = firstName;
  }

  void onLastNameChanged(String lastName) {
    _personalInfoState.lastName = lastName;
  }

  void onJobTitleChanged(String jobTitle) {
    _personalInfoState.jobTitle = jobTitle;
  }

  void onSalaryChanged(double salary) {
    _personalInfoState.salary = salary;
  }

  bool formIsNotValid() =>
      _personalInfoState.firstName.isEmpty ||
      _personalInfoState.lastName.isEmpty ||
      _personalInfoState.jobTitle.isEmpty ||
      _personalInfoState.salary <= 0 ||
      _personalInfoState.imagePath.isEmpty;

  bool isEmployed() => _personalInfoState.isEmployed;

  Future<ResponseWrapper> generateScore() {
    _showLoadingWheel(true);
    return _apiManager.generateScore().then((value) {
      _showLoadingWheel(false);
      return ResponseWrapper(ApiResponseType.success, requestResult: value);
    }).catchError((Object obj) {
      _showLoadingWheel(false);
      switch (obj.runtimeType) {
        case SocketException:
          return ResponseWrapper(ApiResponseType.networkError);
        case DioError:
          return ResponseWrapper(ApiResponseType.error);
      }
    });
  }

  void _showLoadingWheel(bool show) {
    emit(PersonalInfoState(
        _personalInfoState.firstName,
        _personalInfoState.lastName,
        _personalInfoState.isEmployed,
        _personalInfoState.jobTitle,
        _personalInfoState.salary,
        _personalInfoState.imagePath,
        showLoadingWheel: show));
  }
}
