import 'package:edutrashgo_mobile/register.dart';
// import 'package:edutrashgo_mobile/homepage.dart';
// import 'package:edutrashgo_mobile/admin/homepageadmin.dart';
import 'package:flutter/material.dart';
import 'package:edutrashgo_mobile/homescreen.dart';

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
    {'username': 'user', 'password': 'pass', 'role': 'user'},
    {'username': '1', 'password': '1', 'role': 'user'},
    {'username': 'admin', 'password': 'admin', 'role': 'admin'},
    {'username': '2', 'password': '2', 'role': 'admin'},
  ];

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Find user
    final user = _users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {}
    );

    final role = user['role'];

    if (_users.any((user) => user['username'] == username && user['password'] == password)) {
      // Successful login
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Selamat Datang!')),
      // );
      // Navigate to HomeScreen
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        if (role == 'admin') {
        // Navigate to HomeScreenAdmin
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => const HomeScreenAdmin()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selamat Datang Admin!')),
        );
      } else if (role == 'user') {
        // Navigate to HomeScreen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selamat Datang!')),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        // Failed login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username dan Password Salah.')),
        );
      }
      
    } else {
      // Failed login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan Password Salah.')),
      );
    }
    
    // if (role == 'admin') {
    //   // Navigate to HomeScreenAdmin
    //   // Navigator.pushReplacement(
    //   //     context, MaterialPageRoute(builder: (context) => const HomeScreenAdmin()));
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Selamat Datang Admin!')),
    //   );
    // } else if (role == 'user') {
    //   // Navigate to HomeScreen
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    // } else {
    //   // Failed login
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Username dan Password Salah.')),
    //   );
    // }

    // if (_users.any((user) => user['username'] == username && user['password'] == password)) {
    //   // Successful login
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Selamat Datang!')),
    //   );
    //   // Navigate to HomeScreen
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    // } else {
    //   // Failed login
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Username dan Password Salah.')),
    //   );
    // }
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
                        'Again!',
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
                        'Selamat Datang Kembali\ndi edutrashgo.com',
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
                    top: 80,
                    left: 33,
                    right: 33,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: const Text(
                          'Username*',
                          style: TextStyle(
                            fontFamily: 'Poppins',
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
                      const SizedBox(height: 21),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
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
                          backgroundColor: const Color(0xFF333333),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to RegisterPage
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                        },
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

