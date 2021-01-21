import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 80,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            _showDialog();
          },
          child: Text(
            'Create Account',
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Image.asset('assets/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Text(
              "Login to see your todo's",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 30, left: 30),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, right: 30, left: 30),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Create Account'),
            content: SizedBox(
              height: 130,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      onChanged: (value) => null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) => null,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Register'),
              ),
            ],
          );
        });
  }
}
