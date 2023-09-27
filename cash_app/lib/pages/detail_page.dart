import 'dart:convert';

import 'package:cash_app/db/db_instance.dart';
import 'package:cash_app/db/format.dart';
import 'package:cash_app/main.dart';
import 'package:cash_app/pages/main_page.dart';
import 'package:cash_app/shared/constant.dart';
import 'package:cash_app/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Map<String, dynamic>> _transactions = [];

  void _loadPageTransaction() async {
    final data = await DbInstance.fetchTransactions();
    setState(() {
      _transactions = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPageTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .14,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          "Detail Cashflow",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 56),
                        child: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 25.0),
                    width: 370,
                    height: 100,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            _transactions[index]['category'] == 'pemasukan'
                                ? Icons.add
                                : Icons.minimize,
                            color:
                                _transactions[index]['category'] == 'pemasukan'
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Rp",
                                      style: TextStyle(
                                        color: _transactions[index]
                                                    ['category'] ==
                                                'pemasukan'
                                            ? successColor
                                            : errorColor,
                                        fontSize: 20,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Text(
                                      Format.convertToIdr(
                                          _transactions[index]['nominal'], 0),
                                      style: TextStyle(
                                        color: _transactions[index]
                                                    ['category'] ==
                                                'pemasukan'
                                            ? successColor
                                            : errorColor,
                                        fontSize: 20,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _transactions[index]['description'],
                                  style: bodyRegular1,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _transactions[index]['date'],
                                  style: bodyLatin1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              _transactions[index]['category'] == 'pemasukan'
                                  ? Icons.arrow_back
                                  : Icons.arrow_forward,
                              color: _transactions[index]['category'] ==
                                      'pemasukan'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: _transactions.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
