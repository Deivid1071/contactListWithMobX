import 'dart:io';

import 'package:contactlistmobx/helpers/contact_helper.dart';
import 'package:contactlistmobx/store/homestore/home_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  ContactHelper helper = ContactHelper();
  HomeStore homeStore = HomeStore();
  List<Contact> contacts = List();

  @override
  void initState() {
    helper.getAllContacts().then((list) => homeStore.setListContacts(list));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Contatos'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
          ),
          body: Observer(
            builder: (_) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: homeStore.contacts.length,
                  itemBuilder: (context, index) {
                   Contact contact = homeStore.contacts[index];
                    return _contactCard(contact);
                  });
            },
          )),
    );
  }

  Widget _contactCard(Contact contact) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contact.image != null
                        ? FileImage(File(contact.image))
                        : Image.asset('images/person.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name ?? "",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contact.email ?? "",
                      style:
                      TextStyle(fontSize: 18),
                    ),
                    Text(
                      contact.phone ?? "",
                      style:
                      TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
