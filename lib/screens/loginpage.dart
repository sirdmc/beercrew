import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {

  List<String> _dropitems = ['IPA', 'LAGER', 'AMBAR', 'STOUT'];
  String _SelectdType = 'Seleccione su Cerveza';
  String _name;
  String _phone;
  String _mail;//se le peude pasar un objeto
  final fb = Firestore.instance;
  SharedPreferences share;

  void initSharePreference() async {
    share = await SharedPreferences.getInstance();
    bool registrado = share.getBool('registrado');
    print(registrado);
    if (registrado != null) {
      if (registrado == false) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  void initState() {  //primer metodo que se hace cuando se implementa, se hace antes de activar el widge
    super.initState(); //siempre al final
    initSharePreference();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('LOGIN', style: TextStyle(color: Colors.white),), backgroundColor: Colors.black,),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.network('https://www.creativefabrica.com/wp-content/uploads/2020/03/08/Beer-icon-Graphics-3394022-1-1-580x386.jpg', fit: BoxFit.fill,),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 30,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              onChanged: (nombre) {
                                _name = nombre;
                              },
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  labelText: 'Nombre y Apellido',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1
                                      )
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1
                                      )
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 30,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (mail) {
                            _mail = mail;
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Mail',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1
                                  )
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1
                                  )
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 300,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (phone) {
                            _phone = phone;
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: 'Teléfono',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1
                                  )
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1
                                  )
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 50,
                        child: DropdownButton<String>(
                            items:_dropitems.map((String val){
                              return DropdownMenuItem<String>(
                                value: val,
                                child: new Text(val),
                              );
                            }).toList(),
                            hint:Text(_SelectdType, style: TextStyle(color: Colors.white),),
                            onChanged:(String val){
                              _SelectdType= val;
                              print(_SelectdType);
                              setState(() {});
                            }),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 300,
                          child: RaisedButton(
                            splashColor: Colors.grey[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            color: Colors.black,
                            child: Text('Login', style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              fb.collection('login').add({
                                "name" : _name,
                                "mail" : _mail,
                                "phone" : _phone,
                                "type" : _SelectdType
                              }).then((value) => print(value.documentID));
                              share.setBool('registrado', true);
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                        )
                      ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
