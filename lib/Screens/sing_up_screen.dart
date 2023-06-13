import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../servicess/Api/UserCreat.dart';
import 'loginScreen.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  final emailcontrolor = TextEditingController();
  final namecontrolor = TextEditingController();
  final usernamecontrolor = TextEditingController();
  final passwordcontrolor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LabelScreen(title: 'singup screen',) , 

            
            Textfield(
              hint: 'name',
             label: 'name',
              icon: Icons.person,
              controller: namecontrolor,
             ),

             Textfield(
              hint: 'email',
             label: 'email',
              icon: Icons.person,
              controller: emailcontrolor,
             ),

             Textfield(
              hint: 'password',
             label: 'password',
              icon: Icons.person,
              controller:passwordcontrolor ,
             isPassword:true ,
             ),

             Textfield(
              hint: 'username',
             label: 'username',
             icon: Icons.person,
             controller: usernamecontrolor,
            
             ),
             Center(child: ElevatedButton(onPressed: () async {


              final Map body ={
                'email':emailcontrolor.text ,
                'password': passwordcontrolor.text,
                'username':usernamecontrolor.text ,
                'name': namecontrolor.text,



              };
              final response = await  createUser(body :body);
              if (response.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LogingScreen()),
                          (route) => false);
                    }


             }, child: Text('creat')))

            
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Textfield extends StatefulWidget {
  const Textfield({super.key, required this.hint, required this.label, required this.icon, this.controller, this.isPassword = false,});

  final String hint ;
    final String label ;
    final IconData  icon ;
    final TextEditingController? controller;
     final bool? isPassword ;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  //  final bool isPass ;
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
              padding:  EdgeInsets.all(8.0),
              child: TextField(
                controller:widget.controller ,
               obscureText: widget.isPassword! ? obscurePassword : false,
                enabled: true,
                cursorColor: Colors.red,
                cursorWidth: 10,
                decoration:InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: widget.hint,
                  labelText: widget.label,
                  prefixIcon: Icon(widget.icon),
                 suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                )
              : null,
                   
                   
                   
                  //   IconButton(
                    
                  //   onPressed: (){
                  //     setState(() {
                  //       pass1 = !pass1;
                  //      ;
                        
                  //    });


                      
                  //   } ,
                  // icon: Icon(
                    
                  //   pass1 ? Icons.visibility_off : Icons.visibility)

                  //   ),
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
            
            
                ) ,
              ),
            )


    ],);
  }
}