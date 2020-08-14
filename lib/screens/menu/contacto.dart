import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';


class HomeContacto  extends StatefulWidget{ //

  @override
  _HomeContactoState createState() => _HomeContactoState();
}

class _HomeContactoState extends State<HomeContacto> {
  List<String> attachment;

  final _recipientController = TextEditingController(
    text: 'franco.andres.mena.ch@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachment,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    //if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {

    final Widget imagePath = Text(attachment ?? '');

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CONTACTANOS!'),
        actions: <Widget>[
          IconButton(
            onPressed: send,
            icon: Icon(Icons.send),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(43, 43, 43, 1)),
          height: 604, //cambiar por variable del dispositivo
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _recipientController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Para',
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _subjectController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Asunto',
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _bodyController,
                      maxLines: 10,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Mensaje',
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
                  imagePath,
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
