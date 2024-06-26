import 'package:edutrashgo_mobile/login.dart';
import 'package:edutrashgo_mobile/homescreen.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  // Dummy data
  final List<Map<String, String>> _users = [];

  void _register() {
    final String namalengkap = _namaLengkapController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    

    if (_users.any((user) => user['username'] == username)) {
      // Username already exists
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username already exists.')),
      );
      return;
    }

    // Register the user
    _users.add({
      'namalengkap' : namalengkap,
      'username': username, 
      'password': password});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful!')),
    );
    // Navigate to HomeScreen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06825f),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      margin: const EdgeInsets.only(left: 35, top: 54),
                      child: const Text(
                        'Hello',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 46,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, left: 35),
                      child: const Text(
                        'New User!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.yellow,
                          fontSize: 46,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 44, left: 34, right: 34),
                      width: double.infinity,
                      child: const Text(
                        'Registrasi Untuk Melanjutkan\nke edutrashgo.com',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 550,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/loginbawah.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 33,
                    right: 33,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only( bottom: 6),
                        child: const Text(
                          'Nama Lengkap*',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _namaLengkapController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Masukkan nama lengkap',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only( bottom: 6, top : 12),
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
                          hintText: 'Masukkan username',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6, top: 12),
                        child: const Text(
                          'Password*',
                          style: TextStyle(
                            fontFamily: 'Poppins',
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
                          hintText: 'Masukkan password',
                        ),
                      ),
                      const SizedBox(height: 26),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF333333),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: _register,
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 7, top: 10),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: const Color(0x40000000),
                                margin: const EdgeInsets.only(right: 8),
                                width: 140,
                                height: 2,
                              ),
                              const Text(
                                'atau',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                color: const Color(0x40000000),
                                margin: const EdgeInsets.only(left: 8),
                                width: 140,
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF06C167),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to Login
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}