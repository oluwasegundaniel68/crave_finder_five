import 'package:crave_finder_three/features/pages/forget_password.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class BackEmailPage extends StatefulWidget {
  const BackEmailPage({super.key});

  @override
  State<BackEmailPage> createState() => _BackEmailPageState();
}

class _BackEmailPageState extends State<BackEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 295,left: 147,right: 146),
            child: Image.asset('images/img_5.png',
            ),
          ),
          Text('Success',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff374151),
          ),
          ),
          SizedBox(height: 8,),
          Text("You've successfully changed your password\n                  continue to"
              " the home page",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff6B7280),
            ),
          ),
          SizedBox(height: 28,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Can't get email?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6B7280),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context, MaterialPageRoute(builder: (context) =>ForgetPassword()),
                );},
                child: Text("Resubmit",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff32B768),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 210,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()),
              );
            },
            child: Container(
              height: 49,
              width: 256,
              decoration: BoxDecoration(
                color:Color(0xff32B768),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
