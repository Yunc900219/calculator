import 'dart:developer';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString valueString = ''.obs;
  RxString calculation = ''.obs;
  bool equalExcute = false;

  void clear() {
    valueString.value = '';
    calculation.value = '';
    log('value: $valueString');
  }

  void changeSign() {
    equalExcute = false;
    double temp = double.parse(valueString.value);
    temp = -temp;
    valueString.value = temp.toString();
    log('value: $valueString');
  }

  void percent() {}

  void divide() {
    equalExcute = false;
    detectMultiOperator();
    valueString.value = valueString + '/';
    log('value: $valueString');
  }

  void multiply() {
    equalExcute = false;
    detectMultiOperator();
    valueString.value = valueString + '*';
    log('value: $valueString');
  }

  void minus() {
    equalExcute = false;
    detectMultiOperator();
    valueString.value = valueString + '-';
    log('value: $valueString');
  }

  void plus() {
    equalExcute = false;
    detectMultiOperator();
    valueString.value = valueString + '+';
    log('value: $valueString');
  }

  void numberPressed(String number) {
    if (equalExcute) {
      valueString.value = '';
      calculation.value = '';
      equalExcute = false;
    }
    valueString.value = valueString.value + number.toString();
    log('value: $valueString');
  }

  void detectMultiOperator() {
    List<String> valueList = valueString.split(
      RegExp(r'(?<=[^\d.])|(?=[^\d.])'),
    );
    bool isNumber = double.tryParse(valueList.last) != null;
    if (!isNumber) {
      valueList.removeLast();
      valueString.value = valueList.join();
    }
  }

  void equal() {
    equalExcute = true;
    valueString.value = valueString.replaceAll(' ', '');
    List<String> valueList = valueString.split(
      RegExp(r'(?<=[^\d.])|(?=[^\d.])'),
    );
    calculation.value = valueList.join();

    //---- find * or / ----//
    int multiplyCount = valueList.where((item) => item == '*').length;
    int divideCount = valueList.where((item) => item == '/').length;
    int totalOperatorCount = multiplyCount + divideCount;
    while (totalOperatorCount > 0) {
      int currOperatorIndex = valueList.indexWhere(
        (item) => item == '*' || item == '/',
      );
      operation(valueList, valueList[currOperatorIndex], currOperatorIndex);
      totalOperatorCount--;
    }

    int otherOprationCount =
        valueList.where((item) => item == '+' || item == '-').length;

    while (otherOprationCount > 0) {
      int currOperatorIndex = valueList.indexWhere(
        (item) => item == '+' || item == '-',
      );
      operation(valueList, valueList[currOperatorIndex], currOperatorIndex);

      otherOprationCount--;
    }

    String formattedValue = (double.parse(valueList[0]) % 1 == 0)
        ? double.parse(valueList[0]).toStringAsFixed(0)
        : double.parse(
            valueList[0],
          ).toStringAsFixed(5).replaceFirst(RegExp(r'\.?0+$'), '');

    // log('$valueList');
    valueString.value = formattedValue;
    // valueString.value = valueList[0];
  }

  void operation(List<String> valueList, String operationSymbol, int index) {
    double operationResult = 0.0;
    switch (operationSymbol) {
      case '*':
        operationResult = double.parse(valueList[index - 1]) *
            double.parse(valueList[index + 1]);
        break;
      case '/':
        operationResult = double.parse(valueList[index - 1]) /
            double.parse(valueList[index + 1]);
        break;
      case '+':
        operationResult = double.parse(valueList[index - 1]) +
            double.parse(valueList[index + 1]);
        break;
      case '-':
        operationResult = double.parse(valueList[index - 1]) -
            double.parse(valueList[index + 1]);
        break;
    }
    operationDone(valueList, operationResult, index);
  }

  void operationDone(List<String> valueList, double result, int index) {
    valueList.replaceRange(index - 1, index + 2, [result.toString()]);
  }
}
