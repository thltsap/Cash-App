import 'package:cash_app/db/db_instance.dart';
import 'package:cash_app/main.dart';
import 'package:cash_app/pages/login_page.dart';
import 'package:cash_app/pages/main_page.dart';
import 'package:cash_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PengeluaranPage extends StatefulWidget {
  const PengeluaranPage({Key? key}) : super(key: key);

  @override
  State<PengeluaranPage> createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Map<String, int> userId =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    int? id = userId["userId"];

    return Scaffold(
      backgroundColor: primary200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primary200,
              height: MediaQuery.of(context).size.height * .14,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 56),
                    child: Center(
                      child: Text(
                        'Tambah Pengeluaran',
                        style: TextStyle(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 56),
                      child: IconButton(
                        color: black,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 56, 14, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: neutral200,
                        ),
                      ),
                      child: TextFormField(
                        cursorColor: primary200,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.calendar_today,
                            color: primary200,
                          ),
                          hintText: 'Tanggal',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: neutral200,
                        ),
                      ),
                      child: TextFormField(
                        cursorColor: primary200,
                        keyboardType: TextInputType.number,
                        controller: _nominalController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Text(
                            'Rp',
                            style: TextStyle(
                              color: primary200,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          hintText: 'Nominal',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: neutral200,
                        ),
                      ),
                      child: TextFormField(
                        cursorColor: primary200,
                        keyboardType: TextInputType.datetime,
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.description,
                            color: primary200,
                          ),
                          hintText: 'Keterangan',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => {Navigator.pop(context)},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: white,
                                border: Border.all(
                                  color: secondaryColor,
                                )),
                            margin: const EdgeInsets.only(top: 12, right: 12),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 28,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Batal',
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await _createTransaction();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MainPage(
                                  userId: id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: secondaryColor,
                            ),
                            margin: const EdgeInsets.only(top: 12),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 28,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Simpan',
                              style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createTransaction() async {
    await DbInstance.createTransaction(
      _dateController.text,
      int.parse(_nominalController.text),
      _descriptionController.text,
      'pengeluaran',
    );
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2330),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }
}
