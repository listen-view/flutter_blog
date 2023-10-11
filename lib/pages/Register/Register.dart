import 'package:flutter/material.dart';
import '../../api/test.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _formData = {
    'userName': '',
    'nickName': '',
    'email': '',
    'password': ''
  };
  void _submit() {
    if (_formKey.currentState!.validate()) {
      TestApi.generateUser(_formData).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('register success!')));
        Navigator.pushNamed(context, '/login');
      });
    }
  }

  Widget _generateInput(String hintText) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(230, 235, 246, 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextFormField(
        onChanged: (value) {
          _formData[hintText] = value;
        },
        obscureText: hintText == 'password' ? true : false,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'content is null';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: const Color(0xffEAFFF8),
          width: double.infinity,
          height: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '注册',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 26),
                        ),
                        _generateInput('userName'),
                        _generateInput('nickName'),
                        _generateInput('email'),
                        _generateInput('password'),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22)),
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: _submit,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff01B27D))),
                              child: const Text('确定')),
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(children: [
                    const Text('已经有账号啦？'),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        '登录',
                        style: TextStyle(color: Color(0xee01B27D)),
                      ),
                    )
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
