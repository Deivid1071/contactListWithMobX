import 'package:contactlistmobx/helpers/contact_helper.dart';
import 'package:mobx/mobx.dart';


part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  @observable
  List<Contact> contacts = List();

  @action
  void setListContacts(List<Contact> value) => contacts = value;



}