import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(
          title: 'My Expenses'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter += 4;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Messias Soares',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Beautiful app with Flutter',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
                _expensesRow(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _expensesRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        IconButton(
            icon: Icon(
                Icons.check_box,
                color: Colors.green
            ),
            onPressed: () {}
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              "R\$ 30.00 - Saque",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "31/03/2020"
            ),
          ],
        ),
      ],
    );
  }
}
