
import 'package:aula01/drawer_list.dart';
import 'package:aula01/pages/hello_listview.dart';
import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/bue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
//widget em cada arquivo
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //permite que utilize outros widgets do material design dentro dele
    //cada tela tem o seu Scaffold com o seu appBar
    return DefaultTabController(//para usar o TabBar
      length: 3,//quantidade de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1",),
            Tab(text: "TAB 2",),
            Tab(text: "TAB 3",),
          ]),
        ),
        body: TabBarView(children: [//body filhos
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          )
        ]) ,//para as abas funcionarem e poder alterar o conteudo
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){// é o botão de + ,faz parte do Scaffold
              _onClickFab();
            },
        ),
        drawer: DrawerList(// menu lateral

        ),
      ),
    );
  }

  _onClickFab() {
    print("Adicionar");
  }

  _body(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
         child: Column(
           //deixa a coluna no centro
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons()
          ],
        ),
      );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
           height: 300,
           child: PageView(
             children: <Widget>[
               _img("assets/images/dog1.png"),
               _img("assets/images/dog2.png"),
               _img("assets/images/dog3.png"),
               _img("assets/images/dog4.png"),
               _img("assets/images/dog5.png")
             ],
           ),
         );
  }

  _buttons() {
    return Builder(builder: (BuildContext context) {// outro contexto criado dentro de Scaffold linha 15 para o SnackBar funcionar, não precisa do contexto vindo de buttons
      return Column(
        children: <Widget>[
          Row(
            //deixa espacos do mesmo tamanho
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("ListView", onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButton("Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton("Page 3", onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", onPressed: () =>  _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () =>  _onClickDialog(context)),
              BlueButton("Toast", onPressed: _onClickToast)
            ],
          )
        ],
      );
    },) ;
  }



  //quando usar o awaint tem que usar o async
  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
          textColor: Colors.yellow,
          label: "Ok",onPressed: (){
        print("Ok!");
      }),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(context: context,
        barrierDismissible: false, //ao clicar fora do dialog não fecha o dialog
        builder: (context){
      return WillPopScope( // quando o scope for fazer o pop pela seta de voltar do android ele vai negar
          onWillPop: () async => false, // não fecha o popup pela seta de voltar do android
        child: AlertDialog(
          title: Text("Flutter é muito legal"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);// desempilha o alert, desempilha as telas o push empilha as telas ex: mostra o popup
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                print("OK !!!");
              },
            )
          ],
        ),
      );
    });

  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal",
        toastLength: Toast.LENGTH_LONG,// fica 5sec porém no ios não fica
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,// para controlar os sec no ios
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Text _text() {
    return Text(
      "Hello Mundo",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _img(String img) {
    //tem que declarar o caminho dos arquivos no pubspec.yaml
    return Container(
     // margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        //a imagem é redimencionada
        fit: BoxFit.cover,
      ),
    );
  }



}