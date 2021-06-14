import 'package:entrega2/db/operation.dart';
import 'package:entrega2/models/patente.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const String ROUTE = "/";

  @override
  Widget build(BuildContext context) {
    Operation.patentes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado"),
      ),
      body: Container(
        child: _MyList(),
      ),
    );
  }
}

class _MyList extends StatefulWidget {
  @override
  __MyListState createState() => __MyListState();
}

class __MyListState extends State<_MyList> {
  List<Patente> patentes = [];

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patentes.length,
      itemBuilder: (_, i) => _createIteam(i),
    );
  }

  _loadData() async {
    List<Patente> auxpatente = await Operation.patentes();

    setState(() {
      patentes = auxpatente;
    });
  }

  _createIteam(int i) {
    return ListTile(
      title: Text(patentes[i].patente),
    );
  }
}
