import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primera app'),
          backgroundColor: const Color.fromARGB(255, 6, 9, 166),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                style: TextStyle(color: Colors.black, fontSize: 18),
                "Formulario de alumno",
              ),
              const SizedBox(height: 16),
              const TextField(
                style: TextStyle(color: Colors.blue, fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                style: TextStyle(color: Colors.blue, fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Guardar'),
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.alarm, color: Colors.blue, size: 50.0),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.accessibility,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                style: TextStyle(color: Colors.black, fontSize: 18),
                "Esta es mi imagen",
              ),
              const SizedBox(height: 16),
              const Image(
                image: NetworkImage(
                  'https://ik.imagekit.io/mwo1sjmdm/SEO/Itzimn%C3%A1/modelo/image.png?updatedAt=1773943086718',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
