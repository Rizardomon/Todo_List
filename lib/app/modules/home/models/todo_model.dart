import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String addres;
  String addres2;
  String addres3;
  String city;
  String computerName;
  String computerScreen;
  String computerType;
  Timestamp createdAt;
  String lockerQuantity;
  String lockerVersion;
  String name;
  String number;
  String homeName;
  String homeNumber;
  String homeRentAmount;
  String homeResidents;
  Timestamp homeStartDate;
  String homeType;

  DocumentReference reference;

  TodoModel({
    this.reference,
    this.addres = '',
    this.addres2 = '',
    this.addres3 = '',
    this.city = '',
    this.computerName = '',
    this.computerScreen = '',
    this.computerType = '',
    this.createdAt,
    this.lockerQuantity = '',
    this.lockerVersion = '',
    this.name = '',
    this.number = '',
    this.homeName = '',
    this.homeNumber = '',
    this.homeRentAmount = '',
    this.homeResidents = '',
    this.homeStartDate,
    this.homeType = '',
  });

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
      addres: doc['addres'],
      addres2: doc['addres2'],
      addres3: doc['addres3'],
      city: doc['city'],
      computerName: doc['computerName'],
      computerScreen: doc['computerScreen'],
      computerType: doc['computerType'],
      createdAt: doc['createdAt'],
      lockerQuantity: doc['lockerQuantity'],
      lockerVersion: doc['lockerVersion'],
      name: doc['name'],
      number: doc['number'],
      homeName: doc['homeName'],
      homeNumber: doc['homeNumber'],
      homeRentAmount: doc['homeRentAmount'],
      homeResidents: doc['homeResidents'],
      homeStartDate: doc['homeStartDate'],
      homeType: doc['homeType'],
      reference: doc.reference,
    );
  }
}
