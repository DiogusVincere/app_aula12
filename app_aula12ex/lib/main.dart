import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercícios Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Exercise1Screen(),
                  ),
                );
              },
              child: const Text('Exercício 1 - Comidas Típicas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Exercise2Screen(),
                  ),
                );
              },
              child: const Text('Exercício 2 - Formulário de Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela do Exercício 1
class Exercise1Screen extends StatefulWidget {
  const Exercise1Screen({super.key});

  @override
  _Exercise1ScreenState createState() => _Exercise1ScreenState();
}

class _Exercise1ScreenState extends State<Exercise1Screen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _countries = [
    {'name': 'Brasil', 'food': 'Feijoada', 'image': 'assets/feijoada.jpg'},
    {'name': 'Itália', 'food': 'Pizza', 'image': 'assets/pizza.jpg'},
    {'name': 'Japão', 'food': 'Sushi', 'image': 'assets/sushi.jpg'},
    {'name': 'México', 'food': 'Tacos', 'image': 'assets/tacos.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comidas Típicas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _countries[_currentIndex]['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              _countries[_currentIndex]['food']!,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            _buildImage(_countries[_currentIndex]['image']!),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Brasil'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Itália'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Japão'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'México'),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: 200,
      height: 200,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Column(
          children: [
            const Icon(Icons.error, size: 50, color: Colors.red),
            Text('Erro ao carregar:\n$imagePath'),
          ],
        );
      },
    );
  }
}

// Tela do Exercício 2
class Exercise2Screen extends StatefulWidget {
  const Exercise2Screen({super.key});

  @override
  _Exercise2ScreenState createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  String? _gender;
  String? _maritalStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua idade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _professionController,
                decoration: const InputDecoration(labelText: 'Profissão'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua profissão';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Sexo:'),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Masculino'),
                    value: 'Masculino',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Feminino'),
                    value: 'Feminino',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Estado Civil:'),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Solteiro'),
                    value: 'Solteiro',
                    groupValue: _maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        _maritalStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Casado'),
                    value: 'Casado',
                    groupValue: _maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        _maritalStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Divorciado'),
                    value: 'Divorciado',
                    groupValue: _maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        _maritalStatus = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Viúvo'),
                    value: 'Viúvo',
                    groupValue: _maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        _maritalStatus = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _gender != null &&
                      _maritalStatus != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => UserDataScreen(
                              name: _nameController.text,
                              age: _ageController.text,
                              profession: _professionController.text,
                              gender: _gender!,
                              maritalStatus: _maritalStatus!,
                            ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, preencha todos os campos'),
                      ),
                    );
                  }
                },
                child: const Text('Concluir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDataScreen extends StatelessWidget {
  final String name;
  final String age;
  final String profession;
  final String gender;
  final String maritalStatus;

  const UserDataScreen({
    super.key,
    required this.name,
    required this.age,
    required this.profession,
    required this.gender,
    required this.maritalStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dados do Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: $name', style: const TextStyle(fontSize: 18)),
            Text('Idade: $age', style: const TextStyle(fontSize: 18)),
            Text(
              'Profissão: $profession',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Sexo: $gender', style: const TextStyle(fontSize: 18)),
            Text(
              'Estado Civil: $maritalStatus',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
