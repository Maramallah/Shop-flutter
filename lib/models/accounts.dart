import 'package:shop/models/account.dart';
import 'package:flutter/material.dart';

class Accounts extends ChangeNotifier {
  List<Account> accounts = [];
  late Account currAccount;
  int nextId = 0;
 bool addAccount(String name, String email, String password) {
    for (Account account in accounts) {
      if (account.getEmail() == email) {
        return false;
      }
    }
    accounts.add(
      Account(
        name: name,
        email: email,
        password: password,
        id: nextId.toString(),
      ),
    );
    currAccount = accounts.last;
    nextId++;
    notifyListeners();
    return true;
  }

  void deleteAccount() {
    accounts.removeWhere((account) => account.getid() == currAccount.getid());
    currAccount = Account(name: '', email: '', password: '', id: '');
    notifyListeners();
    return;
  }

  bool login(String email, String password) {
    for (Account account in accounts) {
      if (account.getEmail() == email && account.getPassword() == password) {
        currAccount = account;
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  void logout() {
    currAccount = Account(
      name: '',
      email: '',
      password: '',
      id: '',
    );
    notifyListeners();
  }

  String getCurrentAccountName() {
    return currAccount.getName();
  }
}
