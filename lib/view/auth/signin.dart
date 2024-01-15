import 'package:flutter/material.dart';
import 'package:gym/utils/colors.dart';
import 'package:gym/utils/custom_buttons.dart';
import 'package:gym/utils/custom_textfields.dart';
import 'package:gym/utils/styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text.rich(TextSpan(
                            text: 'Sign In\n',
                            style: poppinsBold.copyWith(fontSize: 30),
                            children: [
                              TextSpan(
                                  text: "  Hi!Welcome Back, you've been missed",
                                  style: poppinsRegular.copyWith(fontSize: 14))
                            ])),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(child: Form(
                key: _formKey, child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    validator: (value){
                      try{
                        if(value==null || value.isEmpty){
                          return "Please provide your email";
                        }
                        return null;
                      }catch(e){
                        print(e);
                        return null;
                      }
                    },
                    inputType:TextInputType.emailAddress,
                    controller: _emailController,
                    hintText: "example@gmail.com",
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    validator: (value){
                      try{
                        if(value== null ||value.isEmpty){
                          return "Please provide password";
                        }
                        return null;
                      }catch(e){
                        print(e);
                        return null;
                      }
                    },
                    inputType: TextInputType.text,
                    controller:_passwordController,
                    toggleVisibility: (){
                      setState(() {
                        _showPassword =!_showPassword;
                      });
                    },
                    obscured: _showPassword,
                    showSuffix: true,
                    hintText: "**************",
                    labelText: "Password",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:TextButton(
                      onPressed: (){},
                      child: Text.rich(TextSpan(
                        text: 'Forgot Password? ',
                        style: poppinsMedium.copyWith(color: kPrimaryColor),
                      )),
                    ) ,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButtons(
                  buttonName: 'SignIn',
                    onPressed: (){},
              )
                ],
              ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
