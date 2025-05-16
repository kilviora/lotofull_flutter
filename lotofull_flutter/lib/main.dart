import 'package:flutter/material.dart';

void main() {
  runApp(const LotoFullApp());
}

class LotoFullApp extends StatelessWidget {
  const LotoFullApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LotoFull',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("LotoFull", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(labelText: 'Usuario', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen()));
                },
                child: const Text("Ingresar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text("Menú Principal")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: const [
          MenuButton(title: "Jugar"),
          MenuButton(title: "Reportes"),
          MenuButton(title: "Imprimir"),
          MenuButton(title: "WhatsApp"),
          MenuButton(title: "Escáner"),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;

  const MenuButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title (simulado)'))),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }
}