// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() => runApp(new MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Form Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flutter Form Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
//   String _color = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new SafeArea(
//           top: false,
//           bottom: false,
//           child: new Form(
//               key: _formKey,
//               autovalidate: true,
//               child: new ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 children: <Widget>[
//                   new TextFormField(
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.person),
//                       hintText: 'Enter your first and last name',
//                       labelText: 'Name',
//                     ),
//                   ),
//                   new TextFormField(
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.calendar_today),
//                       hintText: 'Enter your date of birth',
//                       labelText: 'Dob',
//                     ),
//                     keyboardType: TextInputType.datetime,
//                   ),
//                   new TextFormField(
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.phone),
//                       hintText: 'Enter a phone number',
//                       labelText: 'Phone',
//                     ),
//                     keyboardType: TextInputType.phone,
//                     inputFormatters: [
//                       WhitelistingTextInputFormatter.digitsOnly,
//                     ],
//                   ),
//                   new TextFormField(
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.email),
//                       hintText: 'Enter a email address',
//                       labelText: 'Email',
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   new FormField(
//                     builder: (FormFieldState state) {
//                       return InputDecorator(
//                         decoration: InputDecoration(
//                           icon: const Icon(Icons.color_lens),
//                           labelText: 'Color',
//                         ),
//                         isEmpty: _color == '',
//                         child: new DropdownButtonHideUnderline(
//                           child: new DropdownButton(
//                             value: _color,
//                             isDense: true,
//                             onChanged: (String newValue) {
//                               setState(() {
//                                 newContact.favoriteColor = newValue;
//                                 _color = newValue;
//                                 state.didChange(newValue);
//                               });
//                             },
//                             items: _colors.map((String value) {
//                               return new DropdownMenuItem(
//                                 value: value,
//                                 child: new Text(value),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   new Container(
//                       padding: const EdgeInsets.only(left: 40.0, top: 20.0),
//                       child: new RaisedButton(
//                         child: const Text('Submit'),
//                         onPressed: null,
//                       )),
//                 ],
//               ))),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
