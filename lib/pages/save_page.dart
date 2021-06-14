import 'package:entrega2/db/operation.dart';
import 'package:entrega2/models/patente.dart';
import 'package:entrega2/pages/list_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = "/save";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text("listado"),
            onPressed: () {
              Navigator.pushNamed(context, ListPage.ROUTE);
            }),
        appBar: AppBar(
          title: Text("Guardar"),
        ),
        body: Container(
          child: _FormSave(),
        ));
  }
}

class _FormSave extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final patenteController = TextEditingController();
  final marcaController = TextEditingController();
  final precioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: patenteController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Tiene que colocar patente";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "patente", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: marcaController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Tiene que colocar marca";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "marca", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: precioController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Tiene que colocar precio";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "precio", border: OutlineInputBorder()),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
                child: Text("guardar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print("Valido :" +
                        patenteController.text +
                        marcaController.text +
                        precioController.text);

                    Operation.insert(Patente(
                        patente: patenteController.text,
                        marca: marcaController.text,
                        precio: precioController.text));
                  }
                })
          ],
        ),
      ),
    );
  }
}
