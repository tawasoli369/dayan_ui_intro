// version 3.0 Page intro
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_app_2/cubit/intro_cubit.dart';
import 'package:lottie/lottie.dart';
import 'helper/strings.dart';
import 'home.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<IntroCubit>(
        create: (context) => IntroCubit(),
        child: const IntroPage(),
      ),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // Initial Page Controller
  late PageController _pageController;
  // Initial Current Index Page Controller
  int currentIndex = 0;

  ///***************************************************************
  // Initial Page Controller
  ///***************************************************************
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  ///***************************************************************
  // Dispose Page Controller
  ///***************************************************************
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            ///***************************************************************
            // Slider Widget
            ///***************************************************************
            child: PageView(
              // تابعی که وقتی صفحه عوض شد فراخوانی میشود
              onPageChanged: (int page) {
                BlocProvider.of<IntroCubit>(context).falseEndPageFlag();
                // ست کردن تعداد دات های صفحه بعد از تغییر صفحه
                currentIndex = page;
                setState(() {
                  currentIndex = page;
                });
                // if (page == 5 - 5) {
                //   currentIndex = 1;
                // } else if (page == 5 - 4) {
                //   currentIndex = 2;
                // } else if (page == 5 - 3) {
                //   currentIndex = 3;
                // } else if (page == 5 - 2) {
                //   currentIndex = 5;
                // }
                // وقتی به صفحه آخر میرسیم
                if (page == 5 - 1) {
                  BlocProvider.of<IntroCubit>(context).trueEndPageFlag();
                }
              },
              // کنترولر اسلایدر
              controller: _pageController,
              // اسلایدرها
              children: <Widget>[
                introSlide(
                  jsonAnimation: Strings.slide_1_json_animation,
                  title: Strings.slide_1_title,
                  description: Strings.slide_1_desc,
                ),
                introSlide(
                  jsonAnimation: Strings.slide_2_json_animation,
                  title: Strings.slide_2_title,
                  description: Strings.slide_2_desc,
                ),
                introSlide(
                  jsonAnimation: Strings.slide_3_json_animation,
                  title: Strings.slide_3_title,
                  description: Strings.slide_3_desc,
                ),
                introSlide(
                  jsonAnimation: Strings.slide_4_json_animation,
                  title: Strings.slide_4_title,
                  description: Strings.slide_4_desc,
                ),
                introSlide(
                  jsonAnimation: Strings.slide_5_json_animation,
                  title: Strings.slide_5_title,
                  description: Strings.slide_5_desc,
                ),
              ],
            ),
          ),

          ///***************************************************************
          // Indicator Widget
          ///***************************************************************
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
          ),

          ///***************************************************************
          // Button Skip Widget
          ///***************************************************************
          BlocBuilder<IntroCubit, IntroState>(builder: (context, state) {
            // Not End Page => Show >> Skip Button + Next Button
            if (state.wasEndPage == false) {
              return Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(5 - 1);
                        });
                      },
                      child: Text(
                        Strings.skip,
                        style: const TextStyle(
                          color: Color(0XFF7D818A),
                          fontFamily: 'ShabnamBold',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }
            // End Page => Show >> Done Button
            else if (state.wasEndPage == true) {
              return Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(5 - 1);
                        });
                      },
                      child: Text(
                        Strings.skip,
                        style: const TextStyle(
                          color: Color(0XFF7D818A),
                          fontFamily: 'ShabnamBold',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }
            // Initial State => Show >> Skip Button + Next Button
            else {
              return Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(5 - 1);
                        });
                      },
                      child: Text(
                        Strings.skip,
                        style: const TextStyle(
                          color: Color(0XFF7D818A),
                          fontFamily: 'ShabnamBold',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }
          }),

          ///***************************************************************
          // Next Button Widget
          ///***************************************************************
          BlocBuilder<IntroCubit, IntroState>(
            builder: (context, state) {
              // Not End Page => Show >> Skip Button + Next Button
              if (state.wasEndPage == false) {
                return Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          Strings.next,
                          style: const TextStyle(
                            color: Color(0XFF7D818A),
                            fontFamily: 'ShabnamBold',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }
              // End Page => Show >> Done Button
              if (state.wasEndPage == true) {
                return Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          Strings.next,
                          style: const TextStyle(
                            color: Color(0XFF7D818A),
                            fontFamily: 'ShabnamBold',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }
              // Initial State => Show >> Skip Button + Next Button
              else {
                return Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          Strings.next,
                          style: const TextStyle(
                            color: Color(0XFF7D818A),
                            fontFamily: 'ShabnamBold',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),

          ///***************************************************************
          // Done Button Widget
          ///***************************************************************
          BlocBuilder<IntroCubit, IntroState>(
            builder: (context, state) {
              // Not End Page => Show >> Skip Button + Next Button
              if (state.wasEndPage == false) {
                return Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          Strings.done,
                          style: const TextStyle(
                            color: Color(0XFF7D818A),
                            fontFamily: 'ShabnamBold',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }
              // End Page => Show >> Done Button
              if (state.wasEndPage == true) {
                return Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<IntroCubit>(context),
                                child: const HomePage(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          Strings.done,
                          style: const TextStyle(
                            color: Color(0XFF7D818A),
                            fontFamily: 'ShabnamBold',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }
              // Initial State => Show >> Skip Button + Next Button
              else {
                return Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          Strings.done,
                          style: const TextStyle(
                            color: Color(0XFF7D818A),
                            fontFamily: 'ShabnamBold',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///***************************************************************
  // Initial Intro Slide Widget
  ///***************************************************************
  Widget introSlide({
    required String jsonAnimation,
    title,
    description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 250.0,
          height: 250.0,
          child: Lottie.asset(
            jsonAnimation,
            repeat: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            color: Color(0XFF0B0D0C),
            fontFamily: 'ShabnamBold',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0XFF7D818A),
              fontFamily: 'ShabnamLight',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  ///***************************************************************
  // Initial Indicator Widget
  ///***************************************************************
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      // مدت زمان اجراء انیمیشن
      duration: const Duration(milliseconds: 300),
      // ارتفاع هر دات
      height: 10,
      width: isActive ? 40 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: isActive
          ? BoxDecoration(
              color: const Color(0XFF1597E5),
              borderRadius: BorderRadius.circular(5),
            )
          : BoxDecoration(
              color: const Color(0XFF7D818A),
              borderRadius: BorderRadius.circular(5),
            ),
    );
  }

  ///***************************************************************
  // Initial List of Indicator Widget
  ///***************************************************************
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
