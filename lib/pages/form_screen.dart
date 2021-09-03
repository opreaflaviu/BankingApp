import 'package:banking_app/bloc/form/form_bloc.dart';
import 'package:banking_app/bloc/form/loan_info_state.dart';
import 'package:banking_app/bloc/utils/text_strings.dart';
import 'package:banking_app/pages/base_pages/base_stateful_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormScreen extends BaseStatefulPage {
  FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends BaseStatefulPageState {

  @override
  Widget layout(BuildContext context, double widthPx, double heightPx) {
    return Material(
      child: BlocProvider(
          create: (_) => FormBloc(),
          child: BlocBuilder<FormBloc, LoanInfoState>(
            builder: (context, loanInfo) => Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: SafeArea(
                      minimum: EdgeInsets.only(top:140),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(TextStrings.CALCULATE_YOUR_CREDIT,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 25.0, top: 100),
                              child: Row(
                                children: [
                                  Text(
                                    TextStrings.I_NEED,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    "${loanInfo.amount} ${TextStrings.RON}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ],
                              )),
                          Slider(
                            value: loanInfo.amount,
                            min: 100,
                            max: 1000,
                            divisions: 18,
                            label: loanInfo.amount.toString(),
                            onChanged: (newAmount) {
                              context
                                  .read<FormBloc>()
                                  .onAmountChanged(newAmount);
                            },
                            activeColor: Theme.of(context).primaryColorDark,
                            inactiveColor: Colors.black87,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Row(children: [
                                Text(
                                  TextStrings.DURING,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87),
                                ),
                                DropdownButtonHideUnderline(
                                    child: DropdownButton<int>(
                                        items: context
                                            .read<FormBloc>()
                                            .numberOfMonths
                                            .map((e) => buildMenuItem(e))
                                            .toList(),
                                        value: loanInfo.periodOfMonths,
                                        onChanged: (value) => {
                                              context
                                                  .read<FormBloc>()
                                                  .onPeriodChanged(value!)
                                            }))
                              ])),
                          Padding(padding: EdgeInsets.only(top: 40)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(TextStrings.TOTAL_PAYMENT,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87)),
                                  Text(
                                    loanInfo.totalDebt.toString(),
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(TextStrings.MONTHLY_RATE,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87)),
                                  Text(
                                    loanInfo.monthlyRate.toString(),
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 50, right: 25),
                            alignment: Alignment.centerRight,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorDark)),

                            child: Text(TextStrings.NEXT,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/personal_info_page');
                            },
                          )),
                        ],
                      )
                  ),
                )
            ),
          )
      ),
    );
  }

  DropdownMenuItem<int> buildMenuItem(int noOfMonths) {
    String text = "";
    if (noOfMonths == 1) {
      text = "$noOfMonths ${TextStrings.MONTH}";
    } else {
      text = "$noOfMonths ${TextStrings.MONTHS}";
    }
    return DropdownMenuItem(
      value: noOfMonths,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}
