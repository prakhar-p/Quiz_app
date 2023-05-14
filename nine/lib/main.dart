import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nine/screens/welcome/welcome_screen.dart';
import 'package:http/http.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyStatefulWidget(),
    );
  }
}






class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void sign(String mail,String password) async{
    try{
      Response response=await post(Uri.parse("https://reqres.in/api/register"),body: {'email':mail,'password':password});
      if(response.statusCode==200){
        print('Created Sucessfully');
      }else{
        print('failed');
      }
    }catch(e){
      print(e);
      // ScaffoldMessengerState.of(context).showSnackBar(SnackBar(content: Text('Not Valid')));
    }
  }

  void login(String mail,String password) async{
    try{
      Response response=await post(Uri.parse("https://reqres.in/api/login"),body: {'email':mail,'password':password});
      if(response.statusCode==200){
        print('login Sucessfully');
        setState(() {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>WelcomeScreen()));
        });
      }else{
        print("Failed");
      }
    }catch(e){
      print(e);
      // ScaffoldMessengerState.of(context).showSnackBar(SnackBar(content: Text('Not Valid')));
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Color(0xff252C4A),

          padding: const EdgeInsets.all(10),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Welcome",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w800),),
                        Text(" , to sign-in",style: TextStyle(fontSize: 29,color: Colors.grey,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Text("Continue",style: TextStyle(fontSize: 30,color: Colors.grey,fontWeight: FontWeight.w600),),
                  ],

                ),
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign-in',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),
                  )),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),

                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.white)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.white)),
                      labelText: 'Password', labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                  height: 50,
                  width: 150,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    child: const Text('Sign-in',style: TextStyle(color: Color(0xff0D47A1)),),
                    onPressed: () {

                      login(nameController.text.toString(),
                          passwordController.text.toString());

                    },
                  )
              ),
              SizedBox(height: 10,),
              /*Container(
                  height: 50,
                  width: double.infinity,

                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[200]
                    ),
                    child: const Text('Sign-up'),
                    onPressed: () {
                      sign(nameController.text.toString(),passwordController.text.toString());
                    },
                  )
              ),*/

              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot your Password?',style: TextStyle(color: Colors.white),),
              ),

            ],
          )),
    );
  }
}