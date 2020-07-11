import 'package:contactlistmobx/helpers/contact_helper.dart';
import 'package:contactlistmobx/ui/home/contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  ContactHelper helper = ContactHelper();

  ObservableList<Contact> contacts = ObservableList();

  @action
  Future<void> setListContacts() async {
    contacts.removeRange(0, contacts.length);
    await helper.getAllContacts().then((value) => value.forEach((e) => contacts.add(e)));

  }

  @action
  Future<void> showContactPage({Contact contact, context}) async {
    Contact recContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ContactScreen(
                  contact: contact,
                )));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
        setListContacts();
      } else {
        await helper.saveContact(recContact);
        setListContacts();
      }
    }
  }

  void showOptions(contact,context, index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            launch('tel:${contact.phone}');
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Ligar',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showContactPage(contact: contact, context: context);

                          },
                          child: Text(
                            'Editar',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            helper.deleteContact(contact.id);
                            contacts.removeAt(index);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Excluir',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                    ),
                  ],
                ),
              );
            },
          );
        });

  }
  @action
  orderList(int){
    if(int == 0){
      contacts.sort((a,b)=> a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }else{
      contacts.sort((a,b)=> b.name.toLowerCase().compareTo(a.name.toLowerCase()));
    }

  }
}
