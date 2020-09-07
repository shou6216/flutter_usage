import 'package:flutter/material.dart';

import 'list_item.dart';

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
  final Map<int, String> _selectItems = {
    1: "図鑑虹まだ+こころSまだ",
    2: "図鑑虹まだ",
    3: "こころSまだ",
    4: "全て"
  };

  final List<ListItem> _listItems = [
    ListItem(1, 'スライム', 1, 1),
    ListItem(233, 'メガザルロック', 1, 1),
    ListItem(3, 'スライム', 1, 1),
    ListItem(4, 'スライム', 1, 1),
    ListItem(5, 'スライム', 1, 1),
    ListItem(6, 'スライム', 1, 1),
    ListItem(7, 'スライム', 1, 1),
    ListItem(1, 'スライム', 1, 1),
    ListItem(2, 'スライム', 1, 1),
    ListItem(3, 'スライム', 1, 1),
    ListItem(4, 'スライム', 1, 1),
    ListItem(5, 'スライム', 1, 1),
    ListItem(6, 'スライム', 1, 1),
    ListItem(7, 'スライム', 1, 1),
    ListItem(1, 'スライム', 1, 1),
    ListItem(2, 'スライム', 1, 1),
    ListItem(3, 'スライム', 1, 1),
    ListItem(4, 'スライム', 1, 1),
    ListItem(5, 'スライム', 1, 1),
    ListItem(6, 'スライム', 1, 1),
    ListItem(7, 'スライム', 1, 1),
    ListItem(1, 'スライム', 1, 1),
    ListItem(2, 'スライム', 1, 1),
    ListItem(3, 'スライム', 1, 1),
    ListItem(4, 'スライム', 1, 1),
    ListItem(5, 'スライム', 1, 1),
    ListItem(6, 'スライム', 1, 1),
    ListItem(7, 'スライム', 1, 1),
    ListItem(1, 'スライム', 1, 1),
    ListItem(2, 'スライム', 1, 1),
    ListItem(3, 'スライム', 1, 1),
    ListItem(4, 'スライム', 1, 1),
    ListItem(5, 'スライム', 1, 1),
    ListItem(6, 'スライム', 1, 1),
    ListItem(7, 'スライム', 1, 1),
    ListItem(1, 'あくましんかん', 1, 1),
    ListItem(299, 'スライム', 1, 1),
    ListItem(399, 'スライム', 1, 1),
    ListItem(499, 'スライム', 1, 1),
    ListItem(599, 'スライム', 1, 1),
    ListItem(699, 'スライム', 1, 1),
    ListItem(799, 'スライム', 1, 1)
  ];

  int _selectValue = 1;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              flex: 1,
              child: DropdownButton<int>(
                value: _selectValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (int newValue) {
                  setState(() {
                    _selectValue = newValue;
                  });
                },
                items: _selectItems.entries
                    .map<DropdownMenuItem<int>>((MapEntry<int, String> entry) {
                  return DropdownMenuItem<int>(
                    value: entry.key,
                    child: Text(entry.value),
                  );
                }).toList(),
              )),
          Expanded(
              flex: 9,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Name',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Age',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Role',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Role2',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                      rows: _listItems
                          .map<DataRow>((item) => DataRow(cells: <DataCell>[
                                DataCell(
                                    Text(item.no.toString().padLeft(3, "0"))),
                                DataCell(Text(item.name)),
                                DataCell(Text(item.killRainbowMsg())),
                                DataCell(Text(item.heartRankSMsg()))
                              ]))
                          .toList())))
        ]));
  }
}
