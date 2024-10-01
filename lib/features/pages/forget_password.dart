import 'package:crave_finder_three/features/pages/back_email_page.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  bool isForgotPasswordFilled = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {

        isForgotPasswordFilled = _emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 117),
              Text(
                'Forget Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Enter your registered email below',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff9CA3AF),
                ),
              ),
              SizedBox(height: 56),
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1F2937),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Eg namaemail@emailkamu.com',
                  hintStyle: TextStyle(
                    color: Color(0xffBEC5D1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color(0xffBEC5D1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color(0xff9CA3AF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color(0xffBEC5D1)),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: 'Remember the password?',
                  style: TextStyle(
                    color: Color(0xff9CA3AF),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign in',
                      style: TextStyle(
                        color: Color(0xff32B768),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 370,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>BackEmailPage()),
                  );
                },
                child: Container(
                  height: 49,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isForgotPasswordFilled
                        ? Color(0xff32B768)
                        : Color(0xffD1FAE5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isForgotPasswordFilled
                            ? Colors.white
                            : Color(0xff10B981),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
