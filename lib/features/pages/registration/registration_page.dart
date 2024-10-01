import 'package:crave_finder_three/features/pages/forget_password.dart';
import 'package:crave_finder_three/features/pages/home_page.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showBottomSheet(int initialIndex) {
    setState(() {
      _tabController.index = initialIndex;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => CustomBottomSheet(tabController: _tabController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 45),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 135),
              Image.asset('images/img_3.png'),
              SizedBox(height: 55),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 34,
                  color: Color(0xff1F2937),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Discover the best dining options on campus. Stay updated with real-time restaurant availability and menus tailored just for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff4B5563),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 75),
              GestureDetector(
                onTap: () => _showBottomSheet(0), // Open Create Account tab
                child: Container(
                  height: 49,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Color(0xff32B768),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _showBottomSheet(1), // Open Login tab
                child: Container(
                  height: 49,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Color(0xffD1FAE5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff10B981),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  text: 'By logging in or registering, you have agreed to the ',
                  style: TextStyle(
                    color: Color(0xff242323),
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        color: Color(0xff32B768),
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: Color(0xff242323),
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xff32B768),
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

class CustomBottomSheet extends StatefulWidget {
  final TabController tabController;

  const CustomBottomSheet({Key? key, required this.tabController})
      : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  bool isCreateAccountFilled = false;
  bool isLoginFilled = false;

  @override
  void initState() {
    super.initState();


    _fullNameController.addListener(_checkCreateAccountFilled);
    _emailController.addListener(_checkCreateAccountFilled);
    _passwordController.addListener(_checkCreateAccountFilled);

    _loginEmailController.addListener(_checkLoginFilled);
    _loginPasswordController.addListener(_checkLoginFilled);
  }

  void _checkCreateAccountFilled() {
    setState(() {
      isCreateAccountFilled = _fullNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _checkLoginFilled() {
    setState(() {
      isLoginFilled = _loginEmailController.text.isNotEmpty &&
          _loginPasswordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 576,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          TabBar(
            controller: widget.tabController,
            tabs: [
              Tab(text: 'Create Account'),
              Tab(text: 'Login'),
            ],
            labelColor: Color(0xff32B768),
            unselectedLabelColor: Color(0xff4B5563),
            indicatorColor: Color(0xff32B768),
            indicatorWeight: 3.0,
          ),
          Expanded(
            child: TabBarView(
              controller: widget.tabController,
              children: [
                // Content for Create Account tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 45),
                        Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1F2937),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xff32B768)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                          ),
                          cursorColor: Colors.black, // Set cursor color to black
                        ),
                        SizedBox(height: 16),
                        // Email Address label and TextFormField
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Change this value to adjust the radius
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Ensure this matches the above for consistency
                              borderSide: BorderSide(color: Color(0xff32B768)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Ensure this matches the above for consistency
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          cursorColor: Colors.black, // Set cursor color to black
                        ),
                        SizedBox(height: 16),
                        // Password label and TextFormField
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1F2937),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xff32B768)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                          ),
                          cursorColor: Colors.black, //
                        ),
                        SizedBox(height: 32),
                        GestureDetector(
                          onTap: isCreateAccountFilled
                              ? () {
                            // Handle create account action
                            print('Create account tapped');
                          }
                              : null,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            },
                            child: Container(
                              height: 49,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isCreateAccountFilled
                                    ? Color(0xff32B768)
                                    : Color(0xffD1FAE5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isCreateAccountFilled
                                        ? Colors.white
                                        : Color(0xff10B981),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Content for Login tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 45),
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
                          controller: _loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Eg namaemail@emailkamu.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Change this value to adjust the radius
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Ensure this matches the above for consistency
                              borderSide: BorderSide(color: Color(0xff32B768)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Ensure this matches the above for consistency
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          cursorColor: Colors.black, // Set cursor color to black
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1F2937),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _loginPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xff32B768)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffBEC5D1)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                          ),
                          cursorColor: Colors.black, // Set cursor color to black
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()),
                              );
                            },
                            child: Text('Forget Password?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff32B768),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        GestureDetector(
                          onTap: isLoginFilled
                              ? () {
                          }
                              : null,
                          child: GestureDetector(
                            onTap: (){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                              },
                            child: Container(
                              height: 49,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isLoginFilled
                                    ? Color(0xff32B768)
                                    : Color(0xffD1FAE5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isLoginFilled
                                        ? Colors.white
                                        : Color(0xff10B981),
                                  ),
                                ),
                              ),
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
        ],
      ),
    );
  }
}
