import 'package:flutter/material.dart';

main(List<String> args) {
  return runApp(ExpansionTileSample());
}

class ExpansionTileSample extends StatelessWidget {
  const ExpansionTileSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ExpansionTile'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const<Entry>[]]);
}

final List<Entry> data = <Entry>[
  new Entry('Chapter A',
    <Entry>[
      new Entry('Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry('Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('Chapter C',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry('Section C2',
        <Entry>[
          new Entry('Item C2.0'),
          new Entry('Item C2.1'),
          new Entry('Item C2.2'),
          new Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];


class EntryItem extends StatelessWidget {
  final Entry entry;

  const EntryItem(this.entry);

  Widget _buildTiles(Entry root){
    if(root.children.isEmpty)
    return new ListTile(title: Text(root.title),);
    return ExpansionTile(
      title: Text(root.title),
      key: PageStorageKey<Entry>(root),
      children: root.children.map(_buildTiles).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}