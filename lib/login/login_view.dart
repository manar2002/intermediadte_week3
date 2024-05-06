import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> userFormState = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  bool isDarkModeActive = false;
  bool isValidate = false;

  submit() {
    setState(() {
      if(userFormState.currentState!.validate()){
        isValidate = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkModeActive ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Sign IN', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white)),
            centerTitle: true,
            leading: Switch(
              activeTrackColor: Colors.black38,
              inactiveTrackColor: Colors.white70,
              activeColor: Colors.teal,
              inactiveThumbColor: Colors.white,
              value: isDarkModeActive,
              onChanged: (val) {
                setState(() {
                  isDarkModeActive = val;
                });
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Form(
              key: userFormState,
              child: Column(
                children: [
                    Image.asset("assets/images/login.png",
                      height: 300,
                      fit: BoxFit.contain,),
                  TextFormField(
                    validator: (userName) {
                      if (userName!.isEmpty) {
                        return "Username Cannot be empty ";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                  TextFormField(
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Password Cannot be empty ";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: submit,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            child: isValidate ? const Icon(Icons.lock_open_rounded) : const Icon(Icons.lock),
          ),
        ),
      ),
    );
  }
}