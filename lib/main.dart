import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ott_app/utils/data.dart';
import 'package:ott_app/web_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '9hours': (context) => const WebApp(
              urlPath: 'https://www.hotstar.com/in/tv/9-hours/1260103179',
            ),
        'grahan': (context) => const WebApp(
              urlPath: 'https://www.hotstar.com/in/tv/grahan/1260063718',
            ),
        'human': (context) => const WebApp(
              urlPath: 'https://www.hotstar.com/in/tv/human/1260077204',
            ),
        'dahan': (context) => const WebApp(
              urlPath:
                  'https://www.hotstar.com/in/tv/dahan-raakan-ka-rahasya/1260108468',
            ),
        'drishyam': (context) => const WebApp(
              urlPath:
                  'https://www.primevideo.com/detail/0HNZIYOI76383DKI61QMTROL4K/ref=atv_sr_def_c_unkc_1_1_1?sr=1-1&pageTypeIdSource=ASIN&pageTypeId=B0B8J6TCPY&qid=1678718383924',
            ),
        'venom': (context) => const WebApp(
              urlPath:
                  'https://www.primevideo.com/detail/0MW6OCJ4CH4DLXYDV4534UV0DJ/ref=atv_sr_def_c_unkc_1_1_1?sr=1-1&pageTypeIdSource=ASIN&pageTypeId=B07R8WRBWF&qid=1678718719211',
            ),
        'farzi': (context) => const WebApp(
              urlPath:
                  'https://www.primevideo.com/detail/0HDHQAUF5LPWOJRCO025LFJSJI/ref=atv_sr_def_c_unkc_1_1_1?sr=1-1&pageTypeIdSource=ASIN&pageTypeId=B0B8L3D5S1&qid=1678718762271',
            ),
        'varisu': (context) => const WebApp(
              urlPath:
                  'https://www.primevideo.com/detail/0R1YWU12P55RPK4O7W7JFJXTEM/ref=atv_sr_def_c_unkc_1_1_1?sr=1-1&pageTypeIdSource=ASIN&pageTypeId=B0B8LB99YF&qid=1678718743782',
            ),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTT insider",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending OTT's",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WebApp(
                        urlPath: imageList[currentIndex]['path'],
                      ),
                    ),
                  );
                },
                child: CarouselSlider(
                  items: imageList
                      .map((e) => Container(
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(e['image']),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(
                      seconds: 3,
                    ),
                    onPageChanged: (i, result) {
                      setState(() {
                        currentIndex = i;
                      });
                    },
                    autoPlay: true,
                    autoPlayCurve: Curves.easeIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 900),
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Thriller Shows",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    myCon(
                        path: "path",
                        imagepath: "assets/images/9 Hours (1).jpg",
                        pathName: '9hours'),
                    myCon(
                        path: "path",
                        imagepath: "assets/images/Grahan_Hotstar_Poster.jpeg",
                        pathName: 'grahan'),
                    myCon(
                        path: "path",
                        imagepath: "assets/images/human.jpg",
                        pathName: 'human'),
                    myCon(
                        path: "path",
                        imagepath: "assets/images/dahan.jpg",
                        pathName: 'dahan'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Latest & Trending",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    myCon(
                        path: "path",
                        imagepath: "assets/images/Drishyam-2-4.jpg",
                        pathName: 'drishyam'),
                    myCon(
                        path: "path",
                        imagepath: "assets/images/ve.jpg",
                        pathName: 'venom'),
                    myCon(
                        path: "path",
                        imagepath: "assets/images/farzi.jpeg",
                        pathName: 'farzi'),
                    myCon(
                        path: "path",
                        imagepath: "assets/images/varisu-three_four.jpg",
                        pathName: 'varisu'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myCon({
    required String path,
    required String imagepath,
    required String pathName,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(pathName);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage(imagepath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
