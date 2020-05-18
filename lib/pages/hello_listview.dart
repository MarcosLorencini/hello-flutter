import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';

import 'dog_page.dart';


class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

//StatefulWidget são widgets que mantem o estado onde seria uma variavel na classe um objeto e mudando os valores nas variáveis o flutter redesenha a tela

class HelloListView extends StatefulWidget {//converteu stateless para statful

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[//array de widget podendo coloar qualquer widiget na AppBar
          IconButton(icon: Icon(Icons.list),onPressed: (){
            print("Lista");
            setState(() {//quando clica no icone do AppBar e apos executar esta funçao o flutter vai chamar o métdo build novamente e redesenhar toda a tela
              _gridView = false;
            });
          },),
          IconButton(icon: Icon(Icons.grid_on),onPressed: () {
            print("Grid");
            setState(() {
              _gridView = true;
            });
          })
        ],
      ),
      body: _body(),
    );
  }

  _body() {

    List<Dog> dogs = [
      Dog("vira-lata", "assets/images/dog1.png"),
      Dog("Labrador Bege", "assets/images/dog2.png"),
      Dog("Labrador Preto", "assets/images/dog3.png"),
      Dog("Labrador Filhote", "assets/images/dog4.png"),
      Dog("Pug", "assets/images/dog5.png"),

    ];
    if(_gridView){
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length, //tamanho do array
          //itemExtent: 300, //define o tamanho das imagens
          itemBuilder: (BuildContext context, int index){//responsavel por retornar o widget(layout da celula)
            return _itemView(dogs, index);
          });
    } else {
      return ListView.builder(
        itemExtent: 350,
          itemCount: dogs.length, //tamanho do array
          //itemExtent: 300, //define o tamanho das imagens
          itemBuilder: (BuildContext context, int index){//responsavel por retornar o widget(layout da celula)
            return _itemView(dogs, index);
          });
    }

   }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];//percorre cada imagem e retorna

    return GestureDetector(//tem possui vários eventos de gestos
      onTap: () {
        push(context, DogPage(dog)); // vai para outro pagina
      },
      child: Stack(//coloca um widget sobre o outro. no caso o texto sobre a imagem
        fit: StackFit.expand, //expande ate 300 detinido no LIstWiew
        children: <Widget>[ //tbm recebe um array de children
          _img(dog.foto),
          Container(// para mudar  alimamento dos widget tem que envolvoer o texto com o Container e tem outras funcoes
            alignment: Alignment.topLeft,//posiciona os widgets dentro da Stack
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Text(dog.nome, style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    //tem que declarar o caminho dos arquivos no pubspec.yaml
    return Image.asset(
      img,
      //a imagem é redimencionada
      fit: BoxFit.cover,
    );
  }
}
