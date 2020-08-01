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
              color: Colors.black,
            ),
            child: Text(
              'BEER CREW',
              style: TextStyle(
                color: Colors.white,
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
