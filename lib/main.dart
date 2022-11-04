import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarouselSliderDemo(),
    );
  }
}

// ! constants
// Repositório de imagens via network
// imagens de interiores de casas, e da parte externa da casa.

// apenas externas
// ToDo: passar para issue no Github e obter link das imagens...
final List<String> imgRepExtList = [
  'https://unsplash.com/photos/0tKCSyLXqQM',
  'https://unsplash.com/photos/2keCPb73aQY',
  'https://unsplash.com/photos/MAnVoJlQUvg',
  'https://unsplash.com/photos/2gDwlIim3Uw',
  'https://unsplash.com/photos/XGvwt544g8k',
  'https://unsplash.com/photos/pmhdkgRCbtE',
  'https://unsplash.com/photos/TVcj-so0GDs',
  'https://www.pexels.com/pt-br/foto/casa-de-madeira-marrom-durante-a-neve-950058/',
  'https://www.pexels.com/pt-br/foto/casa-de-madeira-preta-e-marrom-1105754/',
  'https://www.pexels.com/pt-br/foto/brown-house-on-field-2351649/',
  'https://www.pexels.com/pt-br/foto/luzes-da-casa-ligadas-106399/',
  'https://www.pexels.com/pt-br/foto/casa-pintada-em-marrom-e-cinza-na-frente-da-estrada-1396122/',
  'https://www.pexels.com/pt-br/foto/casa-branca-de-2-andares-perto-de-arvores-1115804/',
];

// apenas internas
final List<String> imgRepIntList = [
  'https://user-images.githubusercontent.com/48485199/199876971-998dba1f-5026-48da-a664-dabdacef508f.png',
  'https://user-images.githubusercontent.com/48485199/199876825-8e734499-dc99-4230-b259-e07ae3071faf.png',
  'https://user-images.githubusercontent.com/48485199/199876775-0a2966e3-1a67-4bd0-8180-9cf08a66ddec.png',
  'https://user-images.githubusercontent.com/48485199/199876741-3dcd44d1-e189-45df-b20d-b1ac54eb6a34.png',
  'https://user-images.githubusercontent.com/48485199/199876614-8168934a-4ec9-409d-84e8-d57ebebdf49a.png',
  'https://user-images.githubusercontent.com/48485199/199876559-fbbd8ce7-0a42-4c26-a3c2-791f05876c13.png',
  'https://user-images.githubusercontent.com/48485199/199876518-4354b241-63ae-4c11-bdcb-42f7f646df4e.png',
  'https://user-images.githubusercontent.com/48485199/199876484-576de165-eb8b-4992-aabf-7755f1bef23d.png',
  'https://user-images.githubusercontent.com/48485199/199876430-42f9f925-52fa-422e-912e-e8095c399b43.png',
  'https://user-images.githubusercontent.com/48485199/199876355-cfaa0efc-32ee-41fe-94c3-d7dbb5927666.png',
  'https://user-images.githubusercontent.com/48485199/199876300-5243e9b5-7faa-4bb4-b7a9-41c5ff6ff064.png',
  'https://user-images.githubusercontent.com/48485199/199876253-672d0fd3-c6bb-4f3d-8719-3dea92a464d8.png',
  'https://user-images.githubusercontent.com/48485199/199876130-aa20f9f1-fb1d-4957-9394-d28ef7c21e1f.png',
];

// * IMAGE SLIDER WIDGET
class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Slider'),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(),
          items: imgRepIntList
              .map(
                (item) => Container(
                  child: Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgRepIntList
    .map(
      (item) => Container(
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgRepIntList.indexOf(item)} image',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

// * CAROUSEL SLIDER WIDGET
// ToDo: Carousel Horizontal Slider
class CarouselSliderDemo extends StatefulWidget {
  const CarouselSliderDemo({Key? key}) : super(key: key);

  @override
  _CarouselSliderDemoState createState() => _CarouselSliderDemoState();
}

class _CarouselSliderDemoState extends State<CarouselSliderDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Slider'),
      ),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgRepIntList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
