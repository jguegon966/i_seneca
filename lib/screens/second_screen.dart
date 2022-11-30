import 'package:flutter/material.dart';
import 'package:i_seneca/models/data_response.dart';
import 'package:i_seneca/providers/data_provider.dart';
import 'package:i_seneca/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  final String? username;
  final String? password;

  //final datas = Provider.of<DataproviderScreen>(context);
  //print(moviesProvider.onDisplayMovies);

  const SecondScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ProveedorDatos>(context, listen: true);

    return FutureBuilder(
        future: userProvider.getDataFromGoogleSheet(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            snapshot.data.forEach((user) {
              if (user.usuario.toString() == username && user.clave.toString() == password) {
                print(user.usuario + user.clave + username + password);
                return CargaCompetada(username: username, password: password);
              }
            });
            return const SizedBox(
              height: 400.0,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return const SizedBox(
            height: 400.0,
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}

class CargaCompetada extends StatelessWidget {
  const CargaCompetada({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  final String? username;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ISENECA'),
        elevation: 5,
        actions: [
          IconButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Image(
            image: NetworkImage(
                "https://media.discordapp.net/attachments/922814405882818570/1037708121142988800/iseneca.png"),
            color: Colors.blue,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$username, $password',
                  style: const TextStyle(fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Icon(Icons.people_rounded)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'C:E:I:P: Maestro Eduardo Lobillo',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Perfil Profesorado',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Icon(Icons.access_alarms_rounded),
                  Text(
                    'Perfil Profesorado',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  )
                ],
              ),
              Column(
                children: const [
                  //Color(Colors.amberAccent),
                  Icon(Icons.handshake),
                  Text(
                    'Perfil Profesorado',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
