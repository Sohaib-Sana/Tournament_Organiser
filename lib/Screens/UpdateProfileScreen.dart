import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tournament_organizer/AuthScreensComponents/AuthButtons.dart';
import 'package:tournament_organizer/Components/Profile_Strings.dart';

class UpdateProfileScreen extends StatefulWidget {
  static String id = "UpdateProfileScreen";
  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _name;
  String? _email;
  String? _phone;
  String? _occupation;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: Text('Edit Profile',
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
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage("images/solo-removebg.png"),
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
              const SizedBox(height: 50),

              /// -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        _name = value;
                      },
                      decoration: const InputDecoration(
                        label: Text('Full Name'),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      onChanged: (value) {
                        _email = value;
                      },
                      decoration: const InputDecoration(
                          label: Text('Email'), prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      onChanged: (value) {
                        _phone = value;
                      },
                      decoration: const InputDecoration(
                          label: Text('Phone Number'),
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      onChanged: (value) {
                        _occupation = value;
                      },
                      decoration: const InputDecoration(
                        label: Text('Occupation'),
                        prefixIcon: Icon(Icons.sensor_occupied_outlined),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// -- Form Submit Button
                    customAuthButton(
                        onTap: () async {
                          if (_name == null &&
                              _email == null &&
                              _phone == null &&
                              _occupation == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "Please fill at-least one field",
                              style: TextStyle(color: Colors.redAccent),
                            )));
                          } else {
                            await _fireStore
                                .collection('Users')
                                .doc(_auth.currentUser!.email)
                                .set({
                              "name": _name,
                              "email": _email,
                              "phone": _phone,
                              "occupation": _occupation
                            }, SetOptions(merge: true)).then((value) => {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Updating! Please Wait."))),
                                      Navigator.pop(context)
                                    });
                          }
                        },
                        text: "Update",
                        color: Colors.blue,
                        width: deviceWidth * 0.90),
                    const SizedBox(height: 20),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "$tJoined: ",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: JoinedAt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Your account is Deleted Permanantly.")));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text('Delete'),
                        ),
                      ],
                    )
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
