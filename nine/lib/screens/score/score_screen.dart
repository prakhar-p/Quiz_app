import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nine/constants.dart';
import 'package:nine/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import '../welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(

                "Congrulation",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,fontSize: 50),
              ),
              Text(
                "your Score",
                style:  TextStyle(color: kSecondaryColor,fontWeight: FontWeight.w600,fontSize: 30)
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Container(

                height: 80,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ));
                    },
                    icon: Icon(Icons.restart_alt,size: 60,color: Colors.white,)

                  //color: AppColor.secondaryColor,
                  //padding: EdgeInsets.all(18.0),
                ),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
