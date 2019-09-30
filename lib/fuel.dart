import 'package:flutter/material.dart';

class Fuel extends StatefulWidget {
  @override
  _FuelState createState() => _FuelState();
}

class _FuelState extends State<Fuel> {

  TextEditingController _editingAlcool =  TextEditingController();
  TextEditingController _editingGasolina =  TextEditingController();
  var _result = "";

  calcular(){

    double _alcool = double.tryParse(_editingAlcool.text);
    double _gasolina = double.tryParse(_editingGasolina.text);
    String text = "";

    if(_alcool == null || _gasolina == null || _alcool < 0 || _gasolina < 0 ){
      text = "Números inválidos";
    }else if((_alcool / _gasolina) >= 0.7 ){
      text = "Melhor abastecer com gasolina";
    }else{
      text= "Melhor abastecer com Alcool";
    }

    setState(() {
      _result = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"
                ),
                controller: _editingAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.15"
                ),
                controller: _editingGasolina,
              ),
              Padding(
                child: RaisedButton(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: () => calcular(),
                ),
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(this._result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
