import 'package:cash_app/db/db_instance.dart';
import 'package:cash_app/main.dart';
import 'package:cash_app/pages/main_page.dart';
import 'package:cash_app/shared/constant.dart';
import 'package:cash_app/shared/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String errorMessage = '';
  var usernameColor = neutral200;
  var passworColor = neutral200;

  void _loadPage(
      String errorMessage, var usernameColor, var passwordColor) async {
    setState(() {
      this.errorMessage = errorMessage;
      this.usernameColor = usernameColor;
      this.passworColor = passworColor;
    });
  }

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/logo.png',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          "CASHY APP",
                          style: headingBold1,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username tidak boleh kosong.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary900,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: primary900,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 5,
                                  ),
                                  hintText: 'Username',
                                  hintStyle: bodyMedium2Grey,
                                ),
                                style: bodyRegular1,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password tidak boleh kosong.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: primary900),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: primary900),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // ignore: prefer_const_constructors
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: neutral500,
                                    focusColor: primary900,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: bodyMedium2Grey,
                                ),
                                obscureText: _secureText,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: bodyRegular1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary900,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () async {
                            await _login();
                          },
                          child: Text(
                            'Login',
                            style: subHeadingSemiBold2White,
                          ),
                          // Text(
                          //   'Sign In',
                          //   style: subHeadingSemiBold2White,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    var state = await DbInstance.login(
      _usernameController.text,
      _passwordController.text,
    );
    if (state.isNotEmpty) {
      _loadPage('', neutral200, neutral200);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => MainPage(
            userId: state[0]['id'],
          ),
        ),
        (route) => false,
      );
    } else if (_usernameController.text == '' &&
        _passwordController.text == '') {
      _loadPage(
          'Username dan Password tidak boleh kosong!!', errorColor, errorColor);
    } else if (_usernameController.text == '') {
      _loadPage('Username tidak boleh kosong!!', errorColor, errorColor);
    } else if (_passwordController.text == '') {
      _loadPage('Password tidak boleh kosong!!', errorColor, errorColor);
    } else {
      _loadPage('Login gagal, Username atau Password tidak sesuai!', exit300,
          exit400);
    }
  }
}
