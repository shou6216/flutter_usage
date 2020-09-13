import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'monster.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  final Map<int, String> _selectItems = {
    1: "図鑑虹まだ+こころSまだ",
    2: "図鑑虹まだ",
    3: "こころSまだ",
    4: "全て"
  };

  int _selectValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 2.0, right: 5.0, bottom: 2.0, left: 5.0),
              child: DropdownButton<int>(
                value: _selectValue,
                iconSize: 32,
                style: TextStyle(color: Colors.black, fontSize: 24),
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.black,
                ),
                onChanged: (int newValue) {
                  setState(() {
                    _selectValue = newValue;
                  });
                },
                items: _selectItems.entries
                    .map<DropdownMenuItem<int>>((MapEntry<int, String> entry) {
                  return DropdownMenuItem<int>(
                      value: entry.key, child: Text(entry.value));
                }).toList(),
              )),
          Expanded(
              flex: 1,
              child: FutureBuilder<List<Monster>>(
                  future: dbHelper.findBySearchType(_selectValue),
                  builder: (ctx, snapshot) {
                    print(snapshot.data);
                    print(snapshot.hasData);
                    return snapshot.hasData
                        ? SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                                headingRowHeight: 30,
                                horizontalMargin: 10,
                                columns: const <DataColumn>[
                                  DataColumn(
                                      label: Text('No.',
                                          style: TextStyle(fontSize: 15))),
                                  DataColumn(
                                      label: Text('名前',
                                          style: TextStyle(fontSize: 15))),
                                  DataColumn(
                                      label: Text('図鑑',
                                          style: TextStyle(fontSize: 15))),
                                  DataColumn(
                                      label: Text('こころ',
                                          style: TextStyle(fontSize: 15)))
                                ],
                                rows: snapshot.data
                                    .map<DataRow>((monster) =>
                                        DataRow(cells: <DataCell>[
                                          DataCell(Text(monster.id
                                              .toString()
                                              .padLeft(3, "0"))),
                                          DataCell(Text(monster.name)),
                                          DataCell(
                                              Text(monster.kill.toString())),
                                          DataCell(
                                              Text(monster.heart.toString()))
                                        ]))
                                    .toList()))
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }))
        ]));
  }
}
