import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _showSuggestions = false;
  List<String> _suggestions = ["Gods Glory Canteen", "Green Corner Canteen"];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 20.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Text(
                    "Crave Finder",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff32B768),
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      child: Icon(Icons.people),
                      radius: 20,
                      backgroundImage: AssetImage('images/img_6.png'),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 48,
                        width: 280,
                        child: TextFormField(
                          controller: _searchController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          onTap: () {
                            setState(() {
                              _showSuggestions = true;
                            });
                          },
                        ),
                      ),
                    ),
                    if (_showSuggestions)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _suggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_suggestions[index]),
                                onTap: () {
                                  setState(() {
                                    _searchController.text =
                                    _suggestions[index];
                                    _showSuggestions = false;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    SizedBox(height: 15),

                    // PageView for sliding containers
                    SizedBox(
                      height: 120, // Container height
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset('images/img_7.png',),
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset('images/img_7.png',),
                          ),
                          Container(
                            height: 120,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset('images/img_7.png',),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),

                    // Smooth Page Indicator
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: 3, // Number of pages
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Color(0xff32B768),
                          dotColor: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    const Row(
                      children: [
                        Text(
                          'Open Restaurants',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff32343E),
                          ),
                        ),
                        SizedBox(width: 135),
                        Text('See All'),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffA0A5BA),
                          size: 15,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 137,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff98A8B8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "God's Glory Restaurant",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff181C2E),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('4.7',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Container(
                      height: 137,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff98A8B8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Iya Debo Food Canteen",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff181C2E),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('4.7',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}