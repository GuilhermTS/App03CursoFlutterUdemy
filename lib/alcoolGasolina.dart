import 'package:flutter/material.dart';

class alcoolGasolina extends StatefulWidget {
  @override
  _alcoolGasolinaState createState() => _alcoolGasolinaState();
}

class _alcoolGasolinaState extends State<alcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _textoResultado = "aguardando informações...";

  void _calcular(){
    double precAlcool = double.tryParse(_controllerAlcool.text);
    double precGasolina = double.tryParse(_controllerGasolina.text);

    if(precAlcool == null || precGasolina == null){
      setState(() {
        _textoResultado = "Número inválido. Digite números maiores que 0 e utilizando . (ponto)";
      });
    } else {
      if(precAlcool/precGasolina >= 0.7){
        setState(() {
          _textoResultado = "Melhor gasosa!";
        });
      } else{
        setState(() {
          _textoResultado = "Melhor álcool!";
        });
      }

    }

  }

  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Álcool, ex: 1.59"
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.15"
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      color: Colors.lightBlue,
                      onPressed: _calcular,
                    ),
                    RaisedButton(
                      child: Text(
                        "Limpar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      color: Colors.lightBlue,
                      onPressed: _limparCampos,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Resultado:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
