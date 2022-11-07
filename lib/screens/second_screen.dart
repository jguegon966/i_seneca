import 'package:flutter/material.dart';
import 'package:i_seneca/screens/login_screen.dart';

class SecondScreen extends StatelessWidget {
  final String? username;

  const SecondScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text('$username', style: const TextStyle(fontSize: 20),),
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
              Text('C:E:I:P: Maestro Eduardo Lobillo', style: TextStyle(fontSize: 20, color: Colors.blue),)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Perfil Profesorado', style: TextStyle(fontSize: 20, color: Colors.blue),)],
          ),
          Row(children: [
            Column(
              children: const[
                Icon(Icons.access_alarms_rounded),
                Text('Perfil Profesorado', style: TextStyle(fontSize: 20, color: Colors.blue),)
              ],
            ),
            Column(
              children: const[
                //Color(Colors.amberAccent),
                Icon(Icons.handshake),
                Text('Perfil Profesorado', style: TextStyle(fontSize: 20, color: Colors.blue),)
              ],
            )
          ],)

        ],
      ),
    );
  }
}
