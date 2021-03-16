import 'package:aachi_flutter/widgets/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Add_product.dart';

class custom_typeahead extends StatelessWidget {

  double _width;
  double _pixelRatio;
  bool large;
  bool medium;
  final TextEditingController _typeAheadController;

  custom_typeahead(this._typeAheadController);


  @override
  Widget build(BuildContext context) {

    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Container(
      height: 50.0,
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        elevation: large? 12 : (medium? 10 : 8),
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
  }



}
