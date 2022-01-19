import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_project/widgets/drawer.dart';
import 'package:intl/intl.dart';

class addAssetScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final listOfName = ['Raket', 'Bulu Tangkis', 'Net', 'Kasut', 'Grip'];
  late DateTime _selectedDate = DateTime.now();

  String dropdownValue = 'Raket';
  late String asset_no;
  late String asset_name;
  late String asset_subName;
  late String asset_registered;
  late String asset_location;
  late String asset_status;





/////////////////////////////////////
  ///     FUNCTION
/////////////////////////////////////


  var _isInit = true;
  var _isLoading = false;

/////////////////////////////////////
  ///     WIDGET FORM
/////////////////////////////////////

  Widget _buildName() {
    return DropdownButtonFormField(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      style: const TextStyle(color: Colors.deepPurple),
      elevation: 16,
      decoration: InputDecoration(
        labelText: "Select Asset Name",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: listOfName.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please Select Pet';
        }
        return null;
      },
    );
  }

  Widget _buildSubName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'sub name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Subname is reqired';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  // Widget _buildRegistered(BuildContext context) {
  //   return 
          
  // }

  Widget _buildLocation() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'asset location'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'location is reqired';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buildStatus() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'status'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'status is reqired';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buildNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'no'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'no is reqired';
        }
        return null;
      },
      onSaved: (value) {
        asset_subName = value!;
      },
    );
  }

  Widget _buttonSubmit() {
    return FlatButton(
      child: Text("Submit"),
      textColor: Colors.white,
      color: Colors.blueAccent,
      onPressed: () {
        // if (_formKey.currentState.validate()) {
        //   _formKey.currentState.save();
        // }
      },
    );
  }

///////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildName(),
                        _buildSubName(),
                        //_buildRegistered(),
                        _buildLocation(),
                        _buildStatus(),
                        _buttonSubmit(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void setState(Null Function() param0) {}
}
