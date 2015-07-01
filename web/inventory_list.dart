import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:dartson/dartson.dart';
import 'package:dartson/transformers/date_time.dart';

import 'coffee_item.dart';

@CustomTag('inventory-list')
class InventoryList extends PolymerElement {
  @observable List<CoffeeItem> items = toObservable([]);

  InventoryList.created() : super.created() {
    loadData();
    xxx();
  }

  void xxx() {
    var url = "http://localhost:8080/";
    HttpRequest.request(url, method: 'POST', sendData: "[1,2,3]")
    .then((HttpRequest resp) {
      print(resp);
    });

  }

  void loadData() {
    var url = "http://localhost:8080/api/102";
    // call the web server asynchronously
    HttpRequest.getString(url).then(onDataLoaded);
  }

  void onDataLoaded(String responseText) {
    var dson = new Dartson.JSON();

    UserStateDto myCoffee = dson.decode(responseText, new UserStateDto());
    for (var aa in myCoffee.inventory) {
      print(aa.item);
    }
    var cs = myCoffee.inventory.map((x) => new CoffeeItem.fromDto(x.item)).toList();
    for (var cc in cs) {
      items.add(cc);
    }
  }

  doSubmit(Event e, var detail, Node target) {
    e.preventDefault();

    print("OI");
  }
}
