import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreensComponents/AuthButtons.dart';
import 'package:tournament_organizer/Components/DropDown.dart';
import 'package:tournament_organizer/Screens/ActiveTournamentDetailsScreen.dart';

class CreateTournament extends StatefulWidget {
  static String id = "CreateTournament";
  const CreateTournament({Key? key}) : super(key: key);

  @override
  State<CreateTournament> createState() => _CreateTournamentState();
}

class _CreateTournamentState extends State<CreateTournament> {
  final _firestore = FirebaseFirestore.instance;
  late String _name;
  late String _description;
  late String _location;
  late String _roompassword;
  final String _type = "Singles";
  late List<String> _teams;
  DateTime? _dateandtime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((value) => setState(() {
          _dateandtime = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Create Tournament",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              /// -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage("images/tournament.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff0165fe).withOpacity(0.8),
                      ),
                      child: const Icon(Icons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              /// -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        _name = value;
                      },
                      decoration: const InputDecoration(
                        label: Text('Tournament Name'),
                        prefixIcon: Icon(Icons.emoji_events),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        _description = value;
                      },
                      decoration: const InputDecoration(
                        label: Text('Description'),
                        prefixIcon: Icon(Icons.description),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        _teams = value.split(",");
                      },
                      decoration: const InputDecoration(
                          label: Text('Coma Separated Teams'),
                          hintText: "Example: Eagles, Lions",
                          prefixIcon: Icon(Icons.numbers_outlined)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        DropDown(
                          items: ["Singles", "Doubles"],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                        customAuthButton(
                          onTap: () {
                            setState(() {
                              _showDatePicker();
                            });
                          },
                          text: "Starting Date",
                          color: Colors.blue.withOpacity(0.8),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        _roompassword = value;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text('Room Password'),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.password), onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        _location = value;
                      },
                      decoration: const InputDecoration(
                        label: Text('Location'),
                        prefixIcon: Icon(Icons.location_on_outlined),
                      ),
                    ),

                    /// -- Form Submit Button
                    customAuthButton(
                      onTap: () {
                        try {
                          _firestore.collection('Tournaments').add({
                            'name': _name,
                            'description': _description,
                            'location': _location,
                            'roompassword': _roompassword,
                            'teams': _teams,
                            'type': _type,
                            'dateandtime': _dateandtime
                          }).then((value) => Navigator.popAndPushNamed(
                              context, ActiveTournamentDetailsScreen.id));
                        } catch (e) {
                          print(e);
                        }
                      },
                      text: "Submit",
                      color: Colors.blue,
                      width: deviceWidth * 0.90,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
