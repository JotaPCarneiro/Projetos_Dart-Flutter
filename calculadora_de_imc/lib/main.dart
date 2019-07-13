import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /// @brief Objeto controlador (peso)
  TextEditingController weightController = TextEditingController();

  /// @brief Objeto controlador (altura)
  TextEditingController heightController = TextEditingController();

  /// @brief Variável que armazena o valor do...
  String _infoText = "Informe seus dados!";

  /// @brief Variável do tipo GlobalKey Responsável por verificar os formulários.
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// @brief Método responsável pelo botão Resetar (privado).
  void _resetField() {

    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  /// @brief Método responsável por calcular o IMC.
  void _calculate() {

    /**
     * Como queremos alterar os valores na tela do App, é necessário
     * o uso desse método.
     */
    setState(() {

      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})"; // Precisão
      }else if(imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 40.0) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetField
          )
        ],
      ),

      backgroundColor: Colors.white,

      /*
      * Caso o botão seja muito grande, é necessário colocar esse método.
      * Caso não coloque, ocorrerá um erro (botão e teclado "se batendo").
      * Com esse método, é possível rolar a página para baixo, caso o teclado
      * esteja por cima de alguma informação.
      * */
      body: SingleChildScrollView(

        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

        child: Form(

          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120.0, color: Colors.green),

              TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Insira seu Peso!";
                  }
                },
              ),

              TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Insira sua Altura!";
                  }
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,

                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        _calculate();

                        //Para o teclado sumir quando apertar o botão:
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                    },
                    child: Text("Calcular IMC", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.green,
                  ),
                ),
              ),

              Text(_infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              )

            ],

          ),
        ),
      )

    );
  }
}
