import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new MyHomePage(),
          '/new': (BuildContext context) => new NewMonsterPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class NewMonsterPage extends StatefulWidget {
  NewMonsterPage({Key key}) : super(key: key);

  @override
  _NewMonsterPageState createState() => _NewMonsterPageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  final Map<int, String> _selectItems = {
    1: "図鑑虹まだ+こころSまだ",
    2: "図鑑虹まだ",
    3: "こころSまだ",
    4: "図鑑虹なし",
    5: "こころSなし",
    6: "全て"
  };

  int _searchType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: 'モンスター追加',
              onPressed: () => {Navigator.of(context).pushNamed('/new')},
            )
          ],
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
                            child: FittedBox(
                                child: DataTable(
                                    headingRowHeight: 30,
                                    horizontalMargin: 10,
                                    columns: const <DataColumn>[
                                      DataColumn(
                                          label: Text('No.',
                                              style: TextStyle(fontSize: 20))),
                                      DataColumn(
                                          label: Text('名前',
                                              style: TextStyle(fontSize: 20))),
                                      DataColumn(
                                          label: Text('図鑑虹',
                                              style: TextStyle(fontSize: 20))),
                                      DataColumn(
                                          label: Text('こころＳ',
                                              style: TextStyle(fontSize: 20)))
                                    ],
                                    rows: snapshot.data
                                        .map<DataRow>((monster) =>
                                            DataRow(cells: <DataCell>[
                                              DataCell(Text(monster.idMessage,
                                                  style:
                                                      TextStyle(fontSize: 20))),
                                              DataCell(Text(monster.name,
                                                  style:
                                                      TextStyle(fontSize: 20))),
                                              DataCell(Text(monster.killMessage,
                                                  style:
                                                      TextStyle(fontSize: 20))),
                                              DataCell(Text(
                                                  monster.heartMessage,
                                                  style:
                                                      TextStyle(fontSize: 20)))
                                            ]))
                                        .toList())))
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }))
        ]));
  }
}

class _NewMonsterPageState extends State<NewMonsterPage> {
  final dbHelper = DatabaseHelper.instance;

  final _formKey = GlobalKey<FormState>();

  int _id;
  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('モンスター追加')),
        body: Builder(builder: (BuildContext context) {
          return Form(
              key: _formKey,
              child: Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      new TextFormField(
                        enabled: true,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(labelText: '図鑑No.'),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '必須入力です';
                          }

                          int id = int.parse(value);
                          return id > 0 ? null : '1以上です';
                        },
                        onSaved: (String value) {
                          this._id = int.parse(value);
                        },
                      ),
                      new TextFormField(
                        maxLength: 30,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(labelText: '名前'),
                        validator: (String value) {
                          return value.isEmpty ? '必須入力です' : null;
                        },
                        onSaved: (String value) {
                          this._name = value;
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (this._formKey.currentState.validate()) {
                            this._formKey.currentState.save();
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                            print(this._id);
                            print(this._name);
                          }
                        },
                        child: Text('追加'),
                      )
                    ],
                  )));
        }));
  }
}
