//import 'package:blogapp/Pages/HomePage.dart';
import 'package:code_assignement/Controller/NetworkHandler.dart';
import 'package:code_assignement/Model/petModel.dart';
import 'package:code_assignement/View/Pages/HomePage.dart';
import 'package:code_assignement/View/Pages/petStatus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import '../Widgets/overlayCard.dart';

///import 'package:kofti/Agriculteur/pages/MySellingPoints.dart';
class AddPet extends StatefulWidget {
  const AddPet({
    Key? key,
  }) : super(key: key);

  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _pname = TextEditingController();

  ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;
  IconData iconphoto = Icons.image;
  String? _status;
  NetworkHandler networkHandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              if (_imageFile?.path != null &&
                  _globalkey.currentState!.validate()) {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => OverlayCard(
                        imagefile: _imageFile,
                        title: _pname.text,
                      )),
                );
              }
            },
            child: const Text(
              "Preview",
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          )
        ],
      ),
      body: Form(
        key: _globalkey,
        child: ListView(
          children: <Widget>[
            pnameTextField(),
            petstatus(),
            const SizedBox(
              height: 20,
            ),
            addButton(),
          ],
        ),
      ),
    );
  }

  Widget pnameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        controller: _pname,
        validator: (value) {
          if (value!.isEmpty) {
            return "Title can't be empty";
          } else if (value.length > 100) {
            return "Title length should be <=100";
          }
          return null;
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff7be495),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff7be495),
              width: 2,
            ),
          ),
          labelText: "Add Image and Title",
          prefixIcon: IconButton(
            icon: Icon(
              iconphoto,
              color: const Color(0xff7be495),
            ),
            onPressed: takeCoverPhoto,
          ),
        ),
        maxLength: 100,
        maxLines: null,
      ),
    );
  }

  Widget petstatus() {
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _status,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.black,
      items: <String>[
        'available',
        'pending',
        'sold',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      hint: const Text(
        "Please choose a status",
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onChanged: (String? value) {
        setState(() {
          _status = value;
        });
      },
    );
  }

  Widget addButton() {
    return InkWell(
      onTap: () async {
        if (_imageFile != null && _globalkey.currentState!.validate()) {
          Pet pet = Pet(petName: _pname.text, status: _status.toString());
          var response = await networkHandler.post1("/pet", pet);
          print(response.body);

          if (response.statusCode == 200 || response.statusCode == 201) {
            String id = json.decode(response.body)["data"];
            var imageResponse = await networkHandler.patchImage(
                "/pet/$id/uploadImage", _imageFile!.path);
            print(imageResponse.statusCode);
            if (imageResponse.statusCode == 200 ||
                imageResponse.statusCode == 201) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (route) => false);
            }
          }
        }
      },
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff7be495)),
          child: Center(
              child: Text(
            "Add Blog",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  void takeCoverPhoto() async {
    final coverPhoto = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = coverPhoto;
      iconphoto = Icons.check_box;
    });
  }
}
