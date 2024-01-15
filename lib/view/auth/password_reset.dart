import 'package:flutter/material.dart';
import 'package:gym/utils/custom_buttons.dart';
import 'package:gym/utils/custom_textfields.dart';
import 'package:gym/utils/styles.dart';

class PasswordReset extends StatefulWidget {
  final bool isForgotten;
  const PasswordReset({super.key, this.isForgotten = false});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool _loading = false;
  bool _showNewPass = false;
  bool _showConfPass = false;
  @override
  void initState() {
    super.initState();
    if (widget.isForgotten) {
      _passController.text = "reset";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text.rich(TextSpan(
                          text: 'New Password\n',
                          style: poppinsBold.copyWith(fontSize: 30),
                          children: [
                            TextSpan(
                                text:
                                    'Your new password must be different from previously used password',
                                style: poppinsMedium.copyWith(fontSize: 15))
                          ])),
                    ),
                  ]),
                ),
              ),
              Flexible(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.isForgotten
                        ? const SizedBox.shrink()
                        : const Align(
                            alignment: Alignment.center,
                            child: Text('New Password'),
                          ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      validator: (value) {
                        try {
                          if (value == null || value.isEmpty) {
                            return "Enter new Password";
                          } else if (value.length < 8) {
                            return "Minimum password characters is 8";
                          } else if (_confirmPasswordController.text !=
                              _newPasswordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        } catch (e) {
                          print(e);
                          return null;
                        }
                      },
                      toggleVisibility: () {
                        setState(() {
                          _showNewPass = !_showNewPass;
                        });
                      },
                      inputType: TextInputType.text,
                      controller: _newPasswordController,
                      obscured: !_showNewPass,
                      showSuffix: true,
                      hintText: "***********",
                      labelText: "Password",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Confirm Password"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      validator: (value) {
                        try {
                          if (value == null || value.isEmpty) {
                            return "Password is empty";
                          } else if (value.length < 8) {
                            return "Minimum Password characters is 8";
                          } else if (_confirmPasswordController.text !=
                              _newPasswordController.text) {
                            return "Passwords are not a match";
                          }
                          return null;
                        } catch (e) {
                          print(e);
                          return null;
                        }
                      },
                      inputType: TextInputType.text,
                      toggleVisibility: () {
                        setState(() {
                          _showConfPass = !_showConfPass;
                        });
                      },
                      showSuffix: true,
                      obscured: !_showConfPass,
                      controller: _confirmPasswordController,
                      hintText: "**********",
                      labelText: "Confirm Password",
                    ),
                    _loading
                        ? const CircularProgressIndicator()
                        : const CustomButtons(
                            buttonName: "Create New Password",
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
