import 'package:contactlistmobx/helpers/contact_helper.dart';
import 'package:contactlistmobx/store/contacstore/contact_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

class ContactScreen extends StatefulWidget {
  final Contact contact;

  const ContactScreen({this.contact});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  ContactStore contactStore = ContactStore();
  final _textFocus = FocusNode();

  @override
  void initState() {
    contactStore.seedContact(widget.contact);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Future<bool> boolStatus = contactStore.backPage(context);
        return boolStatus;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Observer(
              builder: (_) {
                print(contactStore.editedContact.name);
                return Text(contactStore.name ?? "Novo Contato");
              },
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(contactStore.name != null && contactStore.name.isNotEmpty ){
                Navigator.pop(context,contactStore.editedContact);
              }else{
                FocusScope.of(context).requestFocus(_textFocus);
              }
            },
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                   ImagePicker().getImage(source: ImageSource.gallery).then((file) {
                     if(file == null) return;
                      contactStore.userAddImage(file.path);
                   });
                  },
                  child: Observer(builder: (_){
                    return Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                          contactStore.image != null && contactStore.image != ''
                              ? FileImage(File(contactStore.image))
                              : AssetImage('images/person.png'),
                        ),
                      ),
                    );
                  },)
                ),
                TextFormField(
                  initialValue: contactStore.name,
                  focusNode: _textFocus,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  onChanged: contactStore.userEditing,
                ),
                TextFormField(
                  initialValue: contactStore.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: contactStore.userAddemail,
                ),
                TextFormField(
                  initialValue: contactStore.phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                  onChanged: contactStore.userAddPhone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
