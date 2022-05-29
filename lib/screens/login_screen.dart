import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextEditingController(); //usuario
    final txtPass = TextEditingController(); //contraseña
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              new Image.asset(
                'assets/opamin logo.jpeg',
              width: 900.0,
              height: 100.0,
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.white,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: '',
                    labelText: 'Usuario',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0,)),
                    suffixIcon: Icon(Icons.person)),
                controller: txtUser,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa un usuario';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                obscureText: true, //para ocultar la contraseña
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: '*',
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    suffixIcon: Icon(Icons.lock_outline)),
                controller: txtPass,
                validator: (value) {
                  if (value!.length < 3) {
                    return 'La contraseña debe tener minimo 3 caracteres';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 30),
              Container(
                child: OutlineButton(
                  child: const Text('INGRESAR', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
                  color: Color.fromARGB(255, 50, 54, 99),
                  textColor: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Validando...'),
                        backgroundColor: Colors.blueAccent,
                      ));
                      // VALIDANDO
                      if (txtUser.text == 'opamin' && txtPass.text == '12345') {
                        Navigator.pushReplacementNamed(context, 'ruta_principal'); //para pasarlo a otra pantalla
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Credencias incorrectas...'),
                          backgroundColor: Colors.blueAccent,
                        ));
                      }
                    }
                  },
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}