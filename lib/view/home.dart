import 'package:flutter/material.dart';
import 'package:gym/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = "Nairobi";
  final dropdownItems = ["Nairobi", "Mombasa", "Kisumu", "Kiambu"];
  String searchText = "";

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
            ),
            //   search
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1)),
                child: TextField(
                  autocorrect: true,
                  onChanged: (text) {
                    setState(() {
                      searchText = text;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 24,
                          color: kPrimaryColor,
                        ),
                      ), hintText: "Search Workout, Trainer"),
                ),
              ),
            ),
            //categories
            const ListTile(
              trailing:Text("See all") ,
              title: Text("Categories"),
            ),
            //   Featured workout
            const ListTile(
              trailing:Text("See all") ,
              title: Text("Categories"),
            )
            //   top trainer
            //   Nearby Sports club
            //
          ],
        ),
      ),
    );
  }
}
