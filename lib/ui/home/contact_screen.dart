import 'package:contactlistmobx/helpers/contact_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  final Contact contact;

  const ContactScreen({this.contact});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Contact _editedContact;

  @override
  void initState() {
    if(widget.contact == null){
      _editedContact = Contact();
    }else{
      _editedContact = Contact.fromMap(widget.contact.toMap());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.name??"Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){},
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
