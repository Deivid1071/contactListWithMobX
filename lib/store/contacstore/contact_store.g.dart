// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactStore on _ContactStore, Store {
  final _$userEditedAtom = Atom(name: '_ContactStore.userEdited');

  @override
  bool get userEdited {
    _$userEditedAtom.reportRead();
    return super.userEdited;
  }

  @override
  set userEdited(bool value) {
    _$userEditedAtom.reportWrite(value, super.userEdited, () {
      super.userEdited = value;
    });
  }

  final _$editedContactAtom = Atom(name: '_ContactStore.editedContact');

  @override
  Contact get editedContact {
    _$editedContactAtom.reportRead();
    return super.editedContact;
  }

  @override
  set editedContact(Contact value) {
    _$editedContactAtom.reportWrite(value, super.editedContact, () {
      super.editedContact = value;
    });
  }

  final _$nameAtom = Atom(name: '_ContactStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_ContactStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_ContactStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$imageAtom = Atom(name: '_ContactStore.image');

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$_ContactStoreActionController =
      ActionController(name: '_ContactStore');

  @override
  void seedContact(Contact value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
        name: '_ContactStore.seedContact');
    try {
      return super.seedContact(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userEditing(String value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
        name: '_ContactStore.userEditing');
    try {
      return super.userEditing(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userAddemail(String value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
        name: '_ContactStore.userAddemail');
    try {
      return super.userAddemail(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userAddPhone(String value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
        name: '_ContactStore.userAddPhone');
    try {
      return super.userAddPhone(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userAddImage(String value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
        name: '_ContactStore.userAddImage');
    try {
      return super.userAddImage(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEdited: ${userEdited},
editedContact: ${editedContact},
name: ${name},
email: ${email},
phone: ${phone},
image: ${image}
    ''';
  }
}
