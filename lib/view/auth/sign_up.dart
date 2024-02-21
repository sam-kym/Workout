import 'package:flutter/material.dart';
import 'package:gym/utils/custom_buttons.dart';
import 'package:gym/utils/custom_textfields.dart';
import 'package:gym/utils/styles.dart';

import '../../utils/custom_checkbox.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _readTerms = false;
  final bool _loading = false;
  bool _showPass = false;

  void checkBoxChecked (bool? value, int index){
    setState(() {
      _readTerms = value!;
    });
  }
 void _registerUser() {
    if (_readTerms) {
      // Proceed with registration logic here
    } else {
      // Show an error message or prompt to accept terms
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms and conditions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text.rich(TextSpan(
                          text: 'Create Account\n',
                          style: poppinsBold.copyWith(fontSize: 30),
                          children: [
                            TextSpan(
                                text:
                                    'Fill your information below or register\n with your social account.',
                                style: poppinsRegular.copyWith(fontSize: 17))
                          ])),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Name'),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      validator: (value) {
                        try {
                          if (value == null || value.isEmpty) {
                            return 'Name is Empty';
                          }
                          return null;
                        } catch (e) {
                          print(e);
                          return null;
                        }
                      },
                      inputType: TextInputType.text,
                      controller: _nameController,
                      hintText: 'John Doe',
                      labelText: 'Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      validator: (value) {
                        try {
                          if (value == null || value.isEmpty) {
                            return "Email is Empty";
                          }
                          return null;
                        } catch (e) {
                          print(e);
                          return null;
                        }
                      },
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                      labelText: 'Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password'),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      validator: (value) {
                        try {
                          if (value == null || value.isEmpty) {
                            return "Please enter a password";
                          } else if (value.length < 8) {
                            return "Minimum Characters are 8";
                          }
                          return null;
                        } catch (e) {
                          print(e);
                          return null;
                        }
                      },
                      toggleVisibility: () {
                        setState(() {
                          _showPass = !_showPass;
                        });
                      },
                      inputType: TextInputType.text,
                      controller: _passwordController,
                      obscured: _showPass,
                      showSuffix: true,
                      hintText: '***********',
                      labelText: 'Password',
                    ),
                    CustomCheckBox(
                      taskComplete: _readTerms,
                      onChanged:(value){
                        setState(() {
                          _readTerms = value!;
                        });
                      },
                      taskName: "Agree with ",
                      richTextName: "Terms & Conditions",
                    ),
                    const SizedBox(
                      height:10,
                    ),
                    _loading
                    ? const CircularProgressIndicator()
                        : CustomButtons(
                      buttonName: "SignUp",
                      onPressed: ()async{

                      },
                     ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    ));
  }
}
