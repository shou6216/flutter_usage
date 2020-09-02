import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int no;
  final String name;
  final int killRainbow;
  final int heartRankS;

  ListItem(this.no, this.name, this.killRainbow, this.heartRankS);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(mainAxisSize: MainAxisSize.max, children: [
      Text(this.no.toString().padLeft(3, "0")),
      Expanded(flex: 2, child: ListTile(title: Text(this.name))),
      Expanded(flex: 1, child: Text(this.killRainbowMsg())),
      Expanded(flex: 1, child: Text(this.heartRankSMsg()))
    ]));
  }

  String killRainbowMsg() {
    switch (this.killRainbow) {
      case 1:
        return '達成';
      case 2:
        return 'ボスのみ';
      default:
        return '';
    }
  }

  String heartRankSMsg() {
    switch (this.heartRankS) {
      case 1:
        return '達成';
      case 2:
        return 'こころなし';
      default:
        return '';
    }
  }
}
