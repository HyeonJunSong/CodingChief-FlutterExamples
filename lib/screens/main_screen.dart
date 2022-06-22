import 'package:chatting_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatting_app/config/palette.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";

class LogInScreen extends StatefulWidget {
  const LogInScreen({ Key? key }) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _authentication = FirebaseAuth.instance;

  bool isSignUpScreen = true;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  String userName = '';
  String email = '';
  String passWord = '';

  
  void _tryValidate(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              //배경
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image : AssetImage(
                        "img/background.jpg",
                      ),
                      fit: BoxFit.fill,
                    )
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      left: 20.0
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: "Welcome",
                            style: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: isSignUpScreen ? " to Narum Talk!" : " back~!",
                                style: const TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,  
                                )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          isSignUpScreen ? "sign up to continue" : "LogIn to continue",
                          style: const TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
              //박스
              AnimatedPositioned(
                duration: const Duration(microseconds: 500),
                curve: Curves.easeIn,
                top: 180.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.all(20.0),
                  height: isSignUpScreen ? 280.0 : 250.0,
                  width: MediaQuery.of(context).size.width-40,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15.0,
                        spreadRadius: 5.0,
                      )
                    ]
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignUpScreen ? Palette.activeColor : Palette.textColor1,
                                    ),
                                  ),
                                  if(!isSignUpScreen)
                                  Container(
                                    height: 2.0,
                                    width: 55.0,
                                    color: Colors.orange,
                                    margin: const EdgeInsets.only(top: 3.0),
                                  ),
                                ],
                              ),
                              onTap: (){
                                setState(() {
                                  isSignUpScreen = false;
                                });
                              },
                            ),
                            GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignUpScreen ? Palette.activeColor : Palette.textColor1,                              ),
                                  ),
                                  if(isSignUpScreen)
                                  Container(
                                    height: 2.0,
                                    width: 55.0,
                                    color: Colors.orange,
                                    margin: const EdgeInsets.only(top: 3.0),
                                  ),
                                ],
                              ),
                              onTap: (){
                                setState(() {
                                  isSignUpScreen = true;
                                });
                              },
                            ),
                          ],
                        ),
                        if(isSignUpScreen)
                        Container(
                          margin: const EdgeInsets.only(top : 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  key: const ValueKey(1),
                                  onSaved: (value){
                                    userName = value!;
                                  },
                                  onChanged: (value){
                                    userName = value;
                                  },
                                  validator: (value){
                                    if(value!.isEmpty || value.length < 4){
                                      return "Please Enter At Least 4 Characters";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),
                                    hintText: "User Name",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: Palette.textColor1,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                  ),
                                ),
                  
                                const SizedBox(height: 8.0,),
                  
                                TextFormField(
                                  key: const ValueKey(2),
                                  onSaved: (value){
                                    email = value!;
                                  },
                                  onChanged: (value){
                                    email = value;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value){
                                    if(value!.isEmpty || !value.contains('@')){
                                      return "Please check your email if it is valid";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Palette.iconColor,
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: Palette.textColor1,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                  ),
                                ),
                  
                                const SizedBox(height: 8.0,),
                  
                                //if(isSignUpScreen)
                  
                                TextFormField(
                                  key: const ValueKey(3),
                                  onSaved: (value){
                                    passWord = value!;
                                  },
                                  onChanged: (value){
                                    passWord = value;
                                  },
                                  validator: (value){
                                    if(value!.isEmpty || value.length < 6){
                                      return "PassWord must be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                      size: isSignUpScreen ? 24.0 : 0.0,
                                    ),
                                    hintText: "PassWord",
                                    hintStyle: const TextStyle(
                                      fontSize: 14.0,
                                      color: Palette.textColor1,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),              
                        if(!isSignUpScreen)
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  key: const ValueKey(4),
                                  onSaved: (value){
                                    userName = value!;
                                  },
                                  onChanged: (value){
                                    email = value;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value){
                                    if(value!.isEmpty || value.length < 4){
                                      return "Please check your email if it is valid";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),
                                    hintText: "User Name",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: Palette.textColor1,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                  ),
                                ),
                  
                                const SizedBox(height: 8.0,),
                  
                                TextFormField(
                                  key: const ValueKey(5),
                                  onSaved: (value){
                                    passWord = value!;
                                  },
                                  onChanged: (value){
                                    passWord = value;
                                  },
                                  obscureText: true,
                                  validator: (value){
                                    if(value!.isEmpty || value.length < 6){
                                      return "PassWord must be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Palette.iconColor,
                                    ),
                                    hintText: "PassWord",
                                    hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: Palette.textColor1,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              //버튼
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignUpScreen ? 420.0 : 390.0,
                right: 0.0,
                left: 0.0,
                child: Center(
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async{
                        setState(() {
                          showSpinner = true;
                        });
                        
                        if(isSignUpScreen){
                          _tryValidate();
      
                          try{
                            final newUser = await _authentication.createUserWithEmailAndPassword(
                              email: email,
                              password: passWord
                            );
      
                            if(newUser.user != null){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const ChatScreen();
                              }));

                              setState(() {
                                showSpinner = false;  
                              });
                            }
                          }
                          catch(e){
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please Check Your Email and Password",
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                        }
                        else{
                          _tryValidate();
      
                          try{
                            final newUser = await _authentication.signInWithEmailAndPassword(
                              email: email,
                              password: passWord
                            );
      
                            if(newUser.user != null){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const ChatScreen();
                              }));
                            }
                          }catch(e){
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please Check Your Email and Password",
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Colors.orange,
                              Colors.red,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              //구글 로그인 버튼
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignUpScreen ? MediaQuery.of(context).size.height - 125 : MediaQuery.of(context).size.height - 155,
                right: 0.0,
                left: 0.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      isSignUpScreen ? "or SignUp with" : "or LogIn with",
                    ),
                    const SizedBox(height: 10.0,),
                    TextButton.icon(
                      onPressed : (){},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size(155.0, 40.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Palette.googleColor,
                      ),
                      label: const Text(
                        "Google"
                      ),
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}