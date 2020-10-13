import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ShoeStore([Shoe(name: "Nike"), Shoe(name: "Adidas")]),
        ),
      ],
      child: MaterialApp(
        home: Column(
          children: [
            Expanded(child: FirstScreen()),
            Expanded(child: SecondScreen()),
            Expanded(child: ThirdScreen())
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 100,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoeStore>(
      builder: (context, shoeStore, child) => Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 100,
        child: Text("Number of shoes: ${shoeStore.shoes.length}",
            style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoeStore>(
      builder: (context, shoeStore, child) => Container(
        constraints: BoxConstraints.expand(),
        color: Colors.green,
        height: 100,
        child: FlatButton(
          child: Text(
            "Add Shoe",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => shoeStore.addShoe(Shoe(name: "Bugatti")),
        ),
      ),
    );
  }
}

class ShoeStore extends ChangeNotifier {
  List<Shoe> _shoes;

  ShoeStore(List<Shoe> initialValue) {
    _shoes = initialValue;
  }

  List<Shoe> get shoes => _shoes;

  void addShoe(Shoe shoe) {
    _shoes.add(shoe);
    notifyListeners();
  }
}

class Shoe {
  String name;
  Shoe({this.name});
}