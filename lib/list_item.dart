import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int _no;
  final String _name;
  final int _killRainbow;
  final int _heartRankS;

  ListItem(this._no, this._name, this._killRainbow, this._heartRankS);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(mainAxisSize: MainAxisSize.max, children: [
      Text(this._no.toString().padLeft(3, "0")),
      Expanded(flex: 2, child: ListTile(title: Text(this._name))),
      Expanded(flex: 1, child: Text(this._killRainbowMsg())),
      Expanded(flex: 1, child: Text(this._heartRankSMsg()))
    ]));
  }

  String _killRainbowMsg() {
    switch (this._killRainbow) {
      case 1:
        return '達成';
      case 2:
        return 'ボスのみ';
      default:
        return null;
    }
  }

  String _heartRankSMsg() {
    switch (this._heartRankS) {
      case 1:
        return '達成';
      case 2:
        return 'こころなし';
      default:
        return null;
    }
  }
}
