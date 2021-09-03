
import 'package:banking_app/bloc/personal_information/api_response_type.dart';
import 'package:banking_app/bloc/personal_information/personal_info_bloc.dart';
import 'package:banking_app/bloc/personal_information/personal_info_state.dart';
import 'package:banking_app/bloc/utils/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_pages/base_stateful_page.dart';

class PersonalInformationScreen extends BaseStatefulPage {
  PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends BaseStatefulPageState {
  @override
  Widget layout(BuildContext context, double widthPx, double heightPx) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocProvider(
          create: (_) => PersonalInfoBloc(),
          child: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
              builder: (context, personInfoState) {
            return Stack(
              children: [
                _showProgress(personInfoState),
                _showContent(context, personInfoState)
              ],
            );
          })),
    );
  }

  Widget _showProgress(PersonalInfoState personalInfoState) {
    double opacity = 0;
    if (personalInfoState.showLoadingWheel) {
      opacity = 1;
    }
    return Opacity(
      opacity: opacity,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _showContent(
          BuildContext context, PersonalInfoState personalInfoState) =>
      Container(
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

              child: SafeArea(
                  minimum: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TextStrings.COMPLETE_FORM,
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: TextField(
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                context
                                    .read<PersonalInfoBloc>()
                                    .onFirstNameChanged(value);
                              },
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                labelText: TextStrings.FIRST_NAME_QUESTION,
                                labelStyle: TextStyle(color: Colors.black87),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: TextField(
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                context
                                    .read<PersonalInfoBloc>()
                                    .onLastNameChanged(value);
                              },
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                labelText: TextStrings.LAST_NAME_QUESTION,
                                labelStyle: TextStyle(color: Colors.black87),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: TextField(
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                context
                                    .read<PersonalInfoBloc>()
                                    .onJobTitleChanged(value);
                              },
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                labelText: TextStrings.JOB_TITLE_QUESTION,
                                labelStyle: TextStyle(color: Colors.black87),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: TextField(
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                context
                                    .read<PersonalInfoBloc>()
                                    .onSalaryChanged(double.parse(value));
                              },
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                )),
                                labelText: TextStrings.SALARY_QUESTION,
                                labelStyle: TextStyle(color: Colors.black87),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(TextStrings.ARE_YOU_WORKING,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 20)),
                                Switch(
                                  thumbColor: MaterialStateProperty.all<Color>(
                                      Theme.of(context).primaryColorDark),
                                  trackColor: MaterialStateProperty.all<Color>(
                                      Theme.of(context).accentColor),
                                  value: personalInfoState.isEmployed,
                                  onChanged: (value) {
                                    context
                                        .read<PersonalInfoBloc>()
                                        .onIsEmployedChange(value);
                                  },
                                )
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(TextStrings.PHOTO_OF_INVOICE,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 20))),
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Theme.of(context).primaryColorDark)),
                                  child: Text(TextStrings.UPLOAD,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white)),
                                  onPressed: () {
                                    context.read<PersonalInfoBloc>().getImage();
                                  },
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white)),
                                      child: Text(
                                          "${context.read<PersonalInfoBloc>().getImageName(personalInfoState.imagePath)}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black87)),
                                      onPressed: () {
                                        context
                                            .read<PersonalInfoBloc>()
                                            .previewImage();
                                      },
                                    ))
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).backgroundColor)),
                            child: Text(TextStrings.SEE_YOUR_CREDIT_SCORE,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                            onPressed: () {
                              doneButtonPressed(context);
                            },
                          ),
                        )
                      ]))));

  void _showAlertDialog({String title = "", String message = ""}) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              content: Text(message, style: TextStyle(fontSize: 20)),
              actions: [
                TextButton(
                  child: Text(TextStrings.OK,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
        barrierDismissible: true);
  }

  void doneButtonPressed(BuildContext context) {
    if (context.read<PersonalInfoBloc>().formIsNotValid()) {
      _showAlertDialog(message: TextStrings.COMPLETE_ALL_FIELDS_MESSAGE);
    } else if (!context.read<PersonalInfoBloc>().isEmployed()) {
      _showAlertDialog(message: TextStrings.YOU_NEED_TO_HAVE_A_JOB_MESSAGE);
    } else {

      context.read<PersonalInfoBloc>().generateScore().then((responseWrapper) {
        switch (responseWrapper.apiResponseType) {
          case ApiResponseType.success:
            var response = responseWrapper.requestResult as List<int>;
            _showAlertDialog(message: "${TextStrings.YOUR_CREDIT_SCORE_IS_MESSAGE} ${response.first}");
            break;
          case ApiResponseType.error:
            _showAlertDialog(
                message: TextStrings.CANNOT_CALCULATE_SCORE_MESSAGE);
            break;
          case ApiResponseType.networkError:
            _showAlertDialog(
                title: TextStrings.NO_CONNECTION,
                message: TextStrings.CONNECT_TO_ETHERNET_MESSAGE);
            break;
        }
      });
    }
  }
}
