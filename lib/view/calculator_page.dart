import 'package:calculator_v1/controller/calculator_controller.dart';
import 'package:calculator_v1/model/button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final CalculatorController ctrl = Get.put(CalculatorController());
  late List<ButtonModel> buttons;

  @override
  void initState() {
    buttons = [
      ButtonModel(
        text: 'AC',
        textColor: Colors.white,
        backgroundColor: Colors.grey[700]!,
        func: () => ctrl.clear(),
      ),
      ButtonModel(
        text: '+/-',
        textColor: Colors.white,
        backgroundColor: Colors.grey[700]!,
        func: () => ctrl.changeSign(),
      ),
      ButtonModel(
        text: '%',
        textColor: Colors.white,
        backgroundColor: Colors.grey[700]!,
        func: () => ctrl.percent(),
      ),
      ButtonModel(
        text: '÷',
        textColor: Colors.white,
        backgroundColor: Colors.amber[700]!,
        func: () => ctrl.divide(),
      ),
      ButtonModel(
        text: '7',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('7'),
      ),
      ButtonModel(
        text: '8',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('8'),
      ),
      ButtonModel(
        text: '9',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('9'),
      ),
      ButtonModel(
        text: '×',
        textColor: Colors.white,
        backgroundColor: Colors.amber[700]!,
        func: () => ctrl.multiply(),
      ),
      ButtonModel(
        text: '4',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('4'),
      ),
      ButtonModel(
        text: '5',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('5'),
      ),
      ButtonModel(
        text: '6',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('6'),
      ),
      ButtonModel(
        text: '-',
        textColor: Colors.white,
        backgroundColor: Colors.amber[700]!,
        func: () => ctrl.minus(),
      ),
      ButtonModel(
        text: '1',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('1'),
      ),
      ButtonModel(
        text: '2',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('2'),
      ),
      ButtonModel(
        text: '3',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('3'),
      ),
      ButtonModel(
        text: '+',
        textColor: Colors.white,
        backgroundColor: Colors.amber[700]!,
        func: () => ctrl.plus(),
      ),
      ButtonModel(
        text: '',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () {},
      ),
      ButtonModel(
        text: '0',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('0'),
      ),
      ButtonModel(
        text: '.',
        textColor: Colors.white,
        backgroundColor: Colors.grey[900]!,
        func: () => ctrl.numberPressed('.'),
      ),
      ButtonModel(
        text: '=',
        textColor: Colors.white,
        backgroundColor: Colors.amber[700]!,
        func: () => ctrl.equal(),
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.format_list_bulleted_rounded),
          color: Colors.amber[700],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      () => Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          ctrl.calculation.value,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          ctrl.valueString.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 每行4個
                  childAspectRatio: 1.0, // 寬高比，1.0 表示正方形
                  mainAxisSpacing: 10.h, // 行間距
                  crossAxisSpacing: 10.w, // 列間距
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: buttons[index].func,
                    child: Container(
                      decoration: BoxDecoration(
                        color: buttons[index].backgroundColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          buttons[index].text.toString(),
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: buttons[index].textColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: buttons.length,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
