import 'package:flutter/material.dart';

void main() {
  /* Chamamos a função runApp e como parâmetro, usamos o widget MaterialApp
   * para que o app suporte widgets de Material Design. Em MaterialApp,
   * passamos como parâmetro (são parâmetros do construtor, onde eles são opcionais)
   * 'title', que é o título do app, junto com o seu valor, e o 'home', que é o
   * o widget da nossa tela.
   * Perceba que no widget 'home', existe um 'Container', ou seja, um local onde
   * é possível colocar outros widgets, que nesse caso, colocamos 'color', que é
   * a cor do widget da nossa tela.
   */
  runApp(new MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _infoText = "Pode Entrar!";
  int _people = 0;

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if(_people < 0) {
        _infoText = "Mundo Invertido?!";
      }else if(_people <= 10) {
        _infoText = "Pode Entrar!";
      }else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style:
                        TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style:
                        TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
