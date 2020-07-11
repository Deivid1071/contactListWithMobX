import 'package:contactlistmobx/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'contact_store.g.dart';

class ContactStore = _ContactStore with _$ContactStore;

abstract class _ContactStore with Store {

  @observable
  bool userEdited = false;

  @observable
  Contact editedContact;

  @observable
  String name;
  @observable
  String email;
  @observable
  String phone;
  @observable
  String image;

  @action
  void seedContact(Contact value) {
    if(value == null){
      editedContact = Contact();
    }else{
      editedContact = Contact.fromMap(value.toMap());
      name = editedContact.name;
      email = editedContact.email;
      phone = editedContact.phone;
      image = editedContact.image;
    }
  }

  @action
  void userEditing(String value) {
    userEdited = true;
    editedContact.name = value;
    name = value;
  }
  @action
  void userAddemail(String value) => editedContact.email = value;

  @action
  void userAddPhone(String value) => editedContact.phone = value;

  @action
  void userAddImage(String value) {
    editedContact.image = value;
    image = value;
  }

  Future<bool> backPage(context) {
    if(userEdited){
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Descartar alterações?'),
          content: Text('Se sair as alterações serão perdidas'),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Cancelar a saida'),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Sim'),
            ),
          ],
        );
      }
      );
      return Future.value(false);
    }else {
      return Future.value(true);
    }
  }
}