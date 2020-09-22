import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'database_helper.dart';
import 'monster.dart';
import 'type.dart';

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
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(),
            missingTranslationHandler: (key, locale) {
              print(
                  "--- Missing Key: $key, languageCode: ${locale.languageCode}");
            },
          ),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('ja'), const Locale('en')],
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

  int _searchType = SearchTypeHelper.getId(SearchType.values.first);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: FlutterI18n.translate(context, 'add_monster'),
              onPressed: () => {
                Navigator.of(context).pushNamed('/new').then((value) {
                  if (value) {
                    setState(() => {print('reloaded search results')});
                  }
                })
              },
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
                items: SearchType.values
                    .map<DropdownMenuItem<int>>((SearchType searchType) {
                  return DropdownMenuItem<int>(
                      value: SearchTypeHelper.getId(searchType),
                      child: I18nText(SearchTypeHelper.getNameKey(searchType)));
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
                                    columns: <DataColumn>[
                                      DataColumn(
                                          label: Text('No.',
                                              style: TextStyle(fontSize: 20))),
                                      DataColumn(
                                          label: I18nText('monster.name',
                                              child: Text('',
                                                  style: TextStyle(
                                                      fontSize: 20)))),
                                      DataColumn(
                                          label: I18nText('monster.kill',
                                              child: Text('',
                                                  style: TextStyle(
                                                      fontSize: 20)))),
                                      DataColumn(
                                          label: I18nText('monster.heart',
                                              child: Text('',
                                                  style:
                                                      TextStyle(fontSize: 20))))
                                    ],
                                    rows: snapshot.data
                                        .map<DataRow>((monster) => DataRow(
                                                key: Key(monster.idMessage),
                                                onSelectChanged:
                                                    (bool selected) {
                                                  if (selected) {
                                                    Navigator.of(context)
                                                        .pushNamed('/new',
                                                            arguments: monster)
                                                        .then((value) {
                                                      if (value) {
                                                        setState(() => {
                                                              print(
                                                                  'reloaded search results')
                                                            });
                                                      }
                                                    });
                                                  }
                                                },
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                      monster.idMessage,
                                                      style: TextStyle(
                                                          fontSize: 20))),
                                                  DataCell(Text(monster.name,
                                                      style: TextStyle(
                                                          fontSize: 20))),
                                                  DataCell(Text(
                                                      monster.killMessage,
                                                      style: TextStyle(
                                                          fontSize: 20))),
                                                  DataCell(Text(
                                                      monster.heartMessage,
                                                      style: TextStyle(
                                                          fontSize: 20)))
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
  int _kill;
  int _heart;

  // 画面遷移後に再読み込みすべきかどうかのフラグ
  bool _shouldReload = false;

  @override
  Widget build(BuildContext context) {
    final Monster monster = ModalRoute.of(context).settings.arguments;

    I18nText appBarTitle;
    I18nText actionTitle;
    I18nText actionResultTitle;
    bool idEnabled;
    if (monster == null) {
      appBarTitle = I18nText('add_monster');
      actionTitle = I18nText('add');
      actionResultTitle = I18nText('db.success.insert');
      idEnabled = true;
    } else {
      appBarTitle = I18nText('update_monster');
      actionTitle = I18nText('update');
      actionResultTitle = I18nText('db.success.update');
      idEnabled = false;
    }

    // 初期表示データ
    final Monster initialMonster = monster ??
        new Monster(
            id: null,
            name: null,
            kill: KillTypeHelper.getId(KillType.values.first),
            heart: HeartTypeHelper.getId(HeartType.values.first));

    // 登録 or 更新処理
    Future<int> Function(Map<String, dynamic>) action =
        (Map<String, dynamic> queryParams) => monster == null
            ? dbHelper.insert(queryParams)
            : dbHelper.update(queryParams);

    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(_shouldReload);
          return Future.value(true);
        },
        child: Scaffold(
            appBar: AppBar(title: appBarTitle),
            body: Builder(builder: (BuildContext context) {
              return Form(
                  key: _formKey,
                  child: Container(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: <Widget>[
                          new TextFormField(
                            enabled: idEnabled,
                            maxLength: 3,
                            initialValue: initialMonster.idMessage,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(labelText: 'No.'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return FlutterI18n.translate(
                                    context, 'required');
                              }

                              int id = int.parse(value);
                              return id > 0
                                  ? null
                                  : FlutterI18n.translate(context, 'min',
                                      translationParams: {'value': '1'});
                            },
                            onSaved: (String value) {
                              this._id = int.parse(value);
                            },
                          ),
                          new TextFormField(
                            maxLength: 30,
                            keyboardType: TextInputType.name,
                            initialValue: initialMonster.name,
                            decoration: InputDecoration(
                                labelText: FlutterI18n.translate(
                                    context, 'monster.name')),
                            validator: (String value) {
                              return value.isEmpty
                                  ? FlutterI18n.translate(context, 'required')
                                  : null;
                            },
                            onSaved: (String value) {
                              this._name = value;
                            },
                          ),
                          new DropdownButtonFormField(
                              value: initialMonster.kill,
                              decoration: InputDecoration(
                                  labelText: FlutterI18n.translate(
                                      context, 'monster.kill')),
                              items: KillType.values.map<DropdownMenuItem<int>>(
                                  (KillType killType) {
                                return DropdownMenuItem<int>(
                                    value: KillTypeHelper.getId(killType),
                                    child: I18nText(
                                        KillTypeHelper.getFullNameKey(
                                            killType)));
                              }).toList(),
                              onSaved: (int value) {
                                this._kill = value;
                              },
                              onChanged: (int newKill) {
                                setState(() {
                                  _kill = newKill;
                                });
                              }),
                          new DropdownButtonFormField(
                              value: initialMonster.heart,
                              decoration: InputDecoration(
                                  labelText: FlutterI18n.translate(
                                      context, 'monster.heart')),
                              items: HeartType.values
                                  .map<DropdownMenuItem<int>>(
                                      (HeartType heartType) {
                                return DropdownMenuItem<int>(
                                    value: HeartTypeHelper.getId(heartType),
                                    child: I18nText(
                                        HeartTypeHelper.getFullNameKey(
                                            heartType)));
                              }).toList(),
                              onSaved: (int value) {
                                this._heart = value;
                              },
                              onChanged: (int newHeart) {
                                setState(() {
                                  _heart = newHeart;
                                });
                              }),
                          RaisedButton(
                            onPressed: () {
                              if (this._formKey.currentState.validate()) {
                                this._formKey.currentState.save();
                                action(new Monster(
                                            id: this._id,
                                            name: this._name,
                                            kill: this._kill,
                                            heart: this._heart)
                                        .toMap())
                                    .then((ret) {
                                  SnackBar snackBar;
                                  if (ret > 0) {
                                    snackBar = new SnackBar(
                                        content: actionResultTitle);
                                    _shouldReload = true;
                                  } else if (ret ==
                                      DatabaseHelper.errorInsertUnique) {
                                    snackBar = new SnackBar(
                                        content: I18nText(
                                            'db.error.insert_unique',
                                            translationParams: {'id': '$_id'}),
                                        backgroundColor: Colors.redAccent);
                                  } else {
                                    snackBar = new SnackBar(
                                        content: I18nText('db.error.unknown'),
                                        backgroundColor: Colors.red);
                                  }
                                  Scaffold.of(context).showSnackBar(snackBar);
                                });
                              }
                            },
                            child: actionTitle,
                          )
                        ],
                      )));
            })));
  }
}
