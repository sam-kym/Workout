import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = "Nairobi";
  final dropdownItems = ["Nairobi", "Mombasa", "Kisumu", "Kiambu"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //   dropdown
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 0,
                  style: const TextStyle(color: Colors.black),
                  focusColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  }),
            )
            //   search

            //   categories
            //   Featured workout
            //   top trainer
            //   Nearby Sports club
            //
          ],
        ),
      ),
    );
  }
}
