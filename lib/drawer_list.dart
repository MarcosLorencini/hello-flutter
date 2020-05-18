
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(// tira o espaço no top do menu lateral
      child: Drawer(// menu lateral
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Marcos Ferreira"),
              accountEmail: Text("mlorencinif@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage ("assets/images/perfilMarcos2.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () { //o listTile tem o onTap por ex para extrair para uma funcao
                print("Item 1");
                Navigator.pop(context); // o Drawer tbm tem que ser fechado
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () { //todo listTile tem o onTap por ex para extrair para uma funcao
                print("Item 1");
                Navigator.pop(context); // o Drawer tbm tem que ser fechado
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () { //todo listTile tem o onTap por ex para extrair para uma funcao
                print("Item 1");
                Navigator.pop(context); // o Drawer tbm tem que ser fechado
              },
            ),
          ],
        ),
      ),
    );

  }
}
