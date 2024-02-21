import 'package:flutter/material.dart';
import 'package:gym/utils/custom_buttons.dart';
import 'package:gym/utils/custom_textfields.dart';
import 'package:gym/utils/styles.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //  gender
  String selectedGender = "";
  final genderOptions = ["Male", "Female", "Prefer not to Disclose"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment,,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(TextSpan(
                            text: "Complete Your Profile\n",
                            style: poppinsBold.copyWith(
                              fontSize: 30,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "Don't worry, ony you can see your personal data. No one else will be able to see it.",
                                  style: poppinsRegular.copyWith(
                                    fontSize: 15,
                                  ))
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                  child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                              return "Name field is empty";
                            }
                            return null;
                          } catch (e) {
                            print(e);
                            return null;
                          }
                        },
                        inputType: TextInputType.name,
                        controller: _nameController,
                        hintText: "John Doe",
                        labelText: "Name",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Phone Number'),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      CustomTextField(
                        validator: (value) {
                          try {
                            if (value == null || value.isEmpty) {
                              return "Enter Phone Number";
                            }
                            return null;
                          } catch (e) {
                            print(e);
                            return null;
                          }
                        },
                        controller: _phoneController,
                        hintText: "Enter Phone Number",
                        labelText: "Phone Number",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // gender dropdown
                      // DropdownButton(
                      //   value: selectedGender,
                      //   icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      //   items: genderOptions.map((String option) {
                      //     return DropdownMenuItem(
                      //         value: option, child: Text(option));
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       selectedGender = value!;
                      //     });
                      //   },
                      //   hint: Text("Select"),
                      // ),+
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomButtons(
                        buttonName: "Complete Profile",
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
