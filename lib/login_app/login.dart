import 'package:firebaselogin/my_button/my_button.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        elevation: 0.2,
      ),

      body: _buildButton(),
    );
  }
}

Widget _buildButton(){  //이름 앞에 _를 붙이면 private 됨. => 같은 파일 내에서만 _buildButton을 부를 수 있음.
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        MyButton(
          image: Image.asset(
            "assets/logo_GG.png",
            height: 25.0,
          ),
          text: const Text(
            "Login with Google",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          color: Colors.white,
          radius: 4.0,
          onPressed: (){},
        ),        

        ButtonTheme(
          height: 50.0,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
        
                Image(
                  image: AssetImage("assets/logo_FB.png"),
                  height: 25.0,
                ),
        
                Text(
                  "Login with Facebook",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                Opacity(
                  opacity: 0.0,
                  child: Image(
                    image: AssetImage("assets/logo_GG.png"),
                    height: 25.0,
                  ),
                ),
        
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF485992),
            ),
            onPressed: (){},
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            )
          ),
        ),

        ButtonTheme(
          height: 50.0,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
        
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),

                Text(
                  "Login with Email",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                Opacity(
                  opacity: 0.0,
                  child: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: (){},

          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            )
          ),
        ),

      ],
    ),
  );
}