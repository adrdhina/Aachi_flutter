import 'dart:async';

import 'package:aachi_flutter/widgets/custom_typeahead.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:aachi_flutter/widgets/custom_shape.dart';
import 'package:aachi_flutter/widgets/customappbar.dart';
import 'package:aachi_flutter/widgets/responsive_ui.dart';
import 'package:aachi_flutter/widgets/textformfield.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Add_Product extends StatefulWidget {
  @override
  _Add_ProductState createState() => _Add_ProductState();
}

class _Add_ProductState extends State<Add_Product> {
  bool checkBoxValue = false;

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                infoTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.50,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey[200], Colors.blueAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.30,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey[200], Colors.blueAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
            height: _height / 10,
            alignment: Alignment.center,
            child: Text(
              'ADD PRODUCT',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
            custom_typeahead(_typeAheadController),
            SizedBox(height: _height / 60.0),
          ],
        ),
      ),
    );
  }

 /* Widget autocompleted_text() {
    return Container(
      height: 50.0,
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        elevation: _large? 12 : (_medium? 10 : 8),
        child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Select Area',
                  prefixIcon: Icon(Icons.search, color: Colors.orange[200], size: 20),
                ),
                //autofocus: true,
                controller: this._typeAheadController),
            suggestionsCallback: (query) {
              var contacts = [
                AppProfile('Dhina', 'stock@man.com'),
                AppProfile('Karan', 'brian@flutter.io'),
                AppProfile('Anbu', 'fred@google.com'),
                AppProfile('Arun', 'john@flutter.io'),
                AppProfile('Nimal', 'paul@google.com'),
                AppProfile('Rajini', 'thomas@flutter.io')
              ];
              var contactsNames = contacts
                  .map((contact) => "${contact.name} <${contact.email}>")
                  .toList(growable: false);
              if (query.length != 0) {
                var lowercaseQuery = query.toLowerCase();
                return contactsNames.where((contact) {
                  return contact.toLowerCase().contains(lowercaseQuery);
                }).toList(growable: false)
                  ..sort((a, b) => a
                      .toLowerCase()
                      .indexOf(lowercaseQuery)
                      .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
              } else {
                return contactsNames;
              }
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion));
            },
            onSuggestionSelected: (suggestion) {
              this._typeAheadController.text = suggestion;
            }),
      ),
    );
  }*/

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to your account");
        print(_typeAheadController.selection);
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }


  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              //  Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}

class AppProfile {
  String name;
  String email;

  AppProfile(this.name, this.email);
}
