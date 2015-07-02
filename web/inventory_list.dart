import 'dart:html';
import 'dart:math';

import 'package:option/option.dart';

import 'package:polymer/polymer.dart';
import 'package:dartson/dartson.dart';

import 'package:core_elements/core_input.dart';

import 'coffee_item.dart';

@CustomTag('inventory-list')
class InventoryList extends PolymerElement {
  @observable List<CoffeeItem> items = toObservable([null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]);
  @observable num money;

  List<int> itemSelection = [];

  InventoryList.created() : super.created() {
    loadData();
  }

  void loadData() {
    itemSelection = [];
    var url = "http://localhost:8080/api/102";
    //var url = "invdata.html";
    HttpRequest.getString(url).then(onDataLoaded);
  }

  void onDataLoaded(String responseText) {
    var dson = new Dartson.JSON();

    items = toObservable([null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]);

    UserStateDto myCoffee = dson.decode(responseText, new UserStateDto());
    for (var aa in myCoffee.inventory) {
      items[aa.index] = new CoffeeItem.fromDto(aa.item);
    }
    money = myCoffee.money;
  }

  void handleItemToggle(Event e, var detail, Node target) {
    if (detail["isChecked"]) {
      itemSelection.add(detail["index"]);
    } else {
      itemSelection.remove(detail["index"]);
    }
  }

  void mineCommand() {
    var url = "http://localhost:8080/api/102/mine";
    HttpRequest.request(url, method: 'POST').whenComplete(loadData);
  }

  void craftCommand() {
    var url = "http://localhost:8080/api/102/craft";
    HttpRequest.request(url, method: 'POST', sendData: itemSelection.toString() + "\n", requestHeaders: {'Content-type': 'application/json'})
    .whenComplete(loadData);
  }

  void sellCommand() {
    var url = "http://localhost:8080/api/102/sell";
    HttpRequest.request(url, method: 'POST', sendData: itemSelection.toString() + "\n", requestHeaders: {'Content-type': 'application/json'})
    .whenComplete(loadData);
  }
}
