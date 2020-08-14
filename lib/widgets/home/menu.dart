import 'package:beercrew/screens/loginpage.dart';
import 'package:beercrew/screens/menu/contacto.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://www.creativefabrica.com/wp-content/uploads/2020/03/08/Beer-icon-Graphics-3394022-1-1-580x386.jpg'),
                  fit: BoxFit.cover
              )
            ),
            child: Text(
              'BEER CREW',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Contactanos'),
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeContacto(),
                  )
              )

          },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Quienes Somos'),
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginHome(),
                  )
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
          ),
        ],
      ),
    );
  }
}
