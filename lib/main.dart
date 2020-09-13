import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'monster.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'DQW討伐管理アプリ';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: title),
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
  final dbHelper = DatabaseHelper.instance;

  final Map<int, String> _selectItems = {
    1: "図鑑虹まだ+こころSまだ",
    2: "図鑑虹まだ",
    3: "こころSまだ",
    4: "全て"
  };

  int _searchType = 1;

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
                value: _searchType,
                iconSize: 32,
                style: TextStyle(color: Colors.black, fontSize: 24),
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.black,
                ),
                onChanged: (int newSearchType) {
                  setState(() {
                    _searchType = newSearchType;
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
                  future: dbHelper.findBySearchType(_searchType),
                  builder: (ctx, snapshot) {
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
