import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/homepage.dart'; 
import 'package:edutrashgo_mobile/register.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduTrashgo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Dummy data
  final List<Map<String, String>> _users = [
    {'username': 'user1', 'password': 'pass1'},
    {'username': 'user2', 'password': 'pass2'},
    {'username': 'user3', 'password': 'pass3'},
  ];

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (_users.any((user) => user['username'] == username && user['password'] == password)) {
      // Successful login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
      // Navigate to HomeScreen

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      // Failed login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFF06825F),
                  padding: const EdgeInsets.only( top: 64),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only( left: 35, right: 35),
                          width: double.infinity,
                          child: const Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 46,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only( bottom: 36, left: 35, right: 35),
                          width: double.infinity,
                          child: const Text(
                            'Again!',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 46,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only( bottom: 54, left: 34, right: 34),
                          width: double.infinity,
                          child: const Text(
                            'Selamat Datang Kembali\ndi edutrashgo.com',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/loginbawah.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.only( top: 93, bottom: 111, left: 33, right: 33),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only( bottom: 6),
                                  child: const Text(
                                    'Username*',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter your username',
                                  ),
                                ),
                                const SizedBox(height: 21),
                                Container(
                                  margin: const EdgeInsets.only( bottom: 6),
                                  child: const Text(
                                    'Password*',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter your password',
                                  ),
                                ),
                                const SizedBox(height: 46),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF06C167),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  onPressed: _login,
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF), fontFamily: 'Poppins-SemiBold', fontWeight: FontWeight.normal),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Container(
                                    margin: const EdgeInsets.only( bottom: 7, top: 10),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: const Color(0x40000000),
                                          margin: const EdgeInsets.only( right: 8),
                                          width: 150,
                                          height: 2,
                                          child: const SizedBox(),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only( right: 8,),
                                          child: const Text(
                                            'atau',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: const Color(0x40000000),
                                          width: 150,
                                          height: 2,
                                          child: const SizedBox(),
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF333333),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  onPressed: () {
                                    // TODO: Implement register logic
                                    Register();
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF), fontFamily: 'Poppins-SemiBold', fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
