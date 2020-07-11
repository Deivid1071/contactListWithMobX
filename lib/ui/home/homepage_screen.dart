
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
  HomeStore homeStore = HomeStore();


  @override
  void initState() {
    homeStore.setListContacts();
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
            actions: <Widget>[
              PopupMenuButton(itemBuilder: (context) => <PopupMenuEntry< dynamic >>[
                const PopupMenuItem( child: Text('Odernar de A-Z'), value: 0, ),
                const PopupMenuItem( child: Text('Odernar de Z-A'), value: 1, )
              ],
              onSelected: homeStore.orderList,
              )
            ],
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              homeStore.showContactPage(context: context);
            },
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
                    return _contactCard(contact, index);
                  });
            },
          )),
    );
  }

  Widget _contactCard(Contact contact, int index) {
    return GestureDetector(
      onTap: () {
        print(contact);
        homeStore.showOptions(contact, context, index);
      },
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
                    image: contact.image != null && contact.image != ''
                        ? FileImage(File(contact.image))
                        : AssetImage('images/person.png'),
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
