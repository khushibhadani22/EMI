import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double loanAmount = 0, interestRate = 0, loanTenure = 0;
  double ans = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.widgets_outlined,
          color: Colors.white,
        ),
        title: const Center(
            child: Text(
          "EMI Calculator",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        )),
        backgroundColor: const Color(0xff0F2029),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xff0F2027),
          ),
          Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your Loan EMI is",
                    style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF)),
                  )),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${ans.toInt()}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF)),
                  ),
                  const Text(
                    "\nMonth",
                    style: TextStyle(fontSize: 10, color: Color(0xffFFFFFF)),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 600,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text("Loan Amount"),
                      Text(
                        "Loan Amount",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade400),
                      ),
                      Text("${loanAmount.toInt()}"),
                      Slider(
                        min: 0,
                        max: 1000000,
                        divisions: 100,
                        onChanged: (value) {
                          setState(() {
                            loanAmount = value;
                          });
                        },
                        value: loanAmount,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text("Interest Rate"),
                      Text(
                        "Interest Rate",
                        style: TextStyle(
                            fontSize: 25, color: Colors.grey.shade400),
                      ),
                      Text("${interestRate.toInt()}"),
                      Slider(
                          min: 0,
                          max: 20,
                          divisions: 5,
                          onChanged: (value) {
                            setState(() {
                              interestRate = value;
                            });
                          },
                          value: interestRate),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text("Loan Tenure"),
                      Text(
                        "Loan Tenure",
                        style: TextStyle(
                            fontSize: 25, color: Colors.grey.shade400),
                      ),
                      Text("${loanTenure.toInt()}"),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          onChanged: (value) {
                            setState(() {
                              loanTenure = value;
                            });
                          },
                          value: loanTenure),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      backgroundColor: const Color(0xffE7EAFF),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          int P = loanAmount.toInt();
                          double R = interestRate.toInt() / 12 / 100;
                          int N = loanTenure.toInt();

                          ans =
                              (P * R * pow((1 + R), N) / (pow((1 + R), N) - 1));
                        },
                      );
                    },
                    child: const Text(
                      "Calculate",
                      style: TextStyle(
                          color: Color(0xff2C3568),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffEFEFEF),
    );
  }
}
