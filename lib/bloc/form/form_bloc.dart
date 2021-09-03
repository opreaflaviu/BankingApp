import 'package:flutter_bloc/flutter_bloc.dart';
import 'loan_info_state.dart';

class FormBloc extends Cubit<LoanInfoState> {

  var _loanInfoState = LoanInfoState(0, 1, 0, 100);
  final numberOfMonths = [1, 3, 6, 12, 18, 24];

  FormBloc() : super(LoanInfoState(0, 1, 0, 100)) {
    computeTotalDebt();
  }

  void onAmountChanged(double amount) {
    _loanInfoState.amount = amount;
    computeTotalDebt();
  }

  void onPeriodChanged(int periodOfMonths) {
    _loanInfoState.periodOfMonths = periodOfMonths;
    computeTotalDebt();
  }

  void computeTotalDebt() {
    double interest = _loanInfoState.amount / 100;
    double monthlyRate = _loanInfoState.amount / _loanInfoState.periodOfMonths + interest;
    double totalDebt = _loanInfoState.amount + interest * _loanInfoState.periodOfMonths;

    emit(LoanInfoState(totalDebt.toPrecision(2), _loanInfoState.periodOfMonths,
        monthlyRate.toPrecision(2), _loanInfoState.amount.toPrecision(2)));
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
