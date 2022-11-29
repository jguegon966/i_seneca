import 'package:flutter/material.dart';
import 'package:i_seneca/providers/data_provider.dart';
import 'package:i_seneca/theme/app_theme.dart';
import 'package:i_seneca/widgets/custom_login.dart';
import 'package:provider/provider.dart';

import 'second_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'username': 'chechu',
      'password': '1234',
    };

    return Scaffold(
      body: Stack(children: [
        const Background(),
        Center(
          child: login(myFormKey, formValues, context),
        )
      ]),
    );
  }

  SingleChildScrollView login(GlobalKey<FormState> myFormKey,
      Map<String, String> formValues, BuildContext context) {

        final userProvider = Provider.of<ProveedorDatos>(context, listen: true);
        
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              const Image(
                  image: NetworkImage(
                      "https://media.discordapp.net/attachments/922814405882818570/1037708121142988800/iseneca.png")),
              const SizedBox(
                height: 30,
              ),
              CustomLogin(
                hinText: 'Usuario',
                formProperty: 'username',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomLogin(
                isPass: true,
                hinText: 'Contraseña',
                formProperty: 'password',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shadowColor: Colors.cyanAccent,
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600)),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormKey.currentState!.validate()) {
                      print('Datos no validos');
                      print(userProvider.toString());
                      return;
                    } else if (formValues['username'] == 'chechu' &&
                        formValues['password'] == 'admin') {
                          print(userProvider.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SecondScreen(username: formValues['username'], password: formValues['password'])),
                      );
                      print(formValues);
                    }
                    print(formValues);
                  },
                  child: const SizedBox(
                    width: 400,
                    height: 50,
                    child: Center(
                      child: Text('Iniciar Sesion'),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.8],
          colors: [Color(0xFFEC407A), Color(0xFF651FFF)],
        ),
      ),
    );
  }
}
