import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urubamba_uide/utils/colors.dart';
import 'package:urubamba_uide/widgets/restaurant_num.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key? key}) : super(key: key);

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationControllertile1;
  late AnimationController _animationControllertile2;

  final List<String> _images = [
    "https://media-cdn.tripadvisor.com/media/photo-s/12/0f/16/42/tierra-restaurante.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/07/28/2a/72/restaurante-el-huerto.jpg",
    "https://cache.marriott.com/content/dam/marriott-renditions/CUZTL/cuztl-hawa-5195-hor-clsc.jpg",
    "https://bestofperutravel.com/wp-content/uploads/2013/01/Wayra-Restaurant-Urubamba-Dining-Room.jpg",
    "https://cdn0.matrimonio.com.pe/vendor/5053/3_2/960/jpg/banquetes_11_1922-1559162401.jpeg",
    "https://media-cdn.tripadvisor.com/media/photo-s/12/53/65/c1/desayuno-en-tambo-condor.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/10/b8/f6/44/mexican-picnic.jpg",
  ];
  late ScrollController _controller;

  void _scrollListner() {
    if (_controller.offset >= 100) {
      setState(() {
        print("scroll started");
        // _secDot = 10;
        _boxHeight = 350;
        _topPickHight = 340;

        _imageSize = 200;
        // _animationController2.repeat();
      });
    }
    if (_controller.offset <= 10) {
      setState(() {
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            print("reached top");
            _boxHeight = 460;
            _topPickHight = 450;
            _imageSize = 250;
          });
        });
      });
    }
  }

  double _boxHeight = 460;
  double _imageSize = 250;
  double _topPickHight = 450;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationControllertile1.dispose();
    _animationControllertile2.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = ScrollController();
    _controller.addListener(_scrollListner);
    _animationController1 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController1.forward();
    });
    _animationController2 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 1), () {
      _animationController2.forward();
    });
    _animationController3 = AnimationController(
        //
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        animationBehavior: AnimationBehavior.preserve)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 1), () {
      _animationController3.forward();
    });

    // * tile 1 animation
  }

  double _secDot = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: _boxHeight,
          width: double.infinity,
          // color: Colors.amber,
          child: Stack(
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: _topPickHight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.restaurantguru.com/c451-Don-Angel-Inka-Casona-Restaurant-Urubamba-design.jpg')),
                      // color: kPrimaryColor,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            // Color.fromARGB(255, 37, 110, 39),
                            kPrimaryColor.withOpacity(1),
                            kPrimaryColor.withOpacity(1),
                          ]),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(
                          60,
                        ),
                      ),
                    ),
                    child: Stack(children: [
                      // * app bar
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 60, right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Recomendaciones Urubamba",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(.3)),
                                  child: const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color:
                                const Color.fromARGB(255, 96, 52, 52).withOpacity(.5),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(60),
                            )),
                      ),

                      // * plant image
                      Positioned(
                        right: 100,
                        bottom: 80,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: _imageSize,
                          width: 220,
                          child: Image.network(
                              "https://static.vecteezy.com/system/resources/previews/001/209/288/non_2x/fork-png.png"),
                        ),
                      ),
                      // * top picks
                      const Positioned(
                        bottom: 30,
                        left: 20,
                        child: Text(
                          "Visita\n nuestros restaurantes",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
          
            ],
          ),
        ),
        // * top picks container

        // * menu bar
        const SizedBox(
          height: 10,
        ),
       
        Expanded(
            child: ListView(
          controller: _controller,
          padding: EdgeInsets.zero,
          children: [
            FadeInRight(
              child: PlantTileWidget(
                  plantName: "Hawa Restaurante\n", imgUrl: _images[3]),
            ),

             FadeInRight(
              child: PlantTileWidget(
                  plantName: "Casa Colonial Restaurant\n", imgUrl: _images[1]),
            ),

             FadeInRight(
              child: PlantTileWidget(
                  plantName: "Kampu\n", imgUrl: _images[2]),
            ),
             FadeInRight(
              child: PlantTileWidget(
                  plantName: "Cuchara Llena\n", imgUrl: _images[4]),
            ),
           
          ],
        ))

     
      ]),
    );
  }
}

class PlantTileWidget extends StatefulWidget {
  final String plantName;
  final String imgUrl;
  const PlantTileWidget({
    Key? key,
    required this.plantName,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<PlantTileWidget> createState() => _PlantTileWidgetState();
}

class _PlantTileWidgetState extends State<PlantTileWidget> {
  double _boxWidth = 400;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _boxWidth = 350;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 250,
                width: _boxWidth,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: kPrimaryColor),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 85, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.plantName,
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 23,
                              fontWeight: FontWeight.w700),
                        ), 
                       Container(
                        width: 200,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'MVRJ+4V4, Av. Ferrocarril s/n, Urubamba, Cusco, Av. Ferrocarril, Urubamba',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                             Text(
                              'Horas: Cerrado ⋅ Abre a las 12:30\nTeléfono: (084) 581777 Anexo 6550',
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            IconWidget(icon: Icons.gps_fixed_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            IconWidget(icon: Icons.edit),
                            SizedBox(
                              width: 10,
                            ),
                            IconWidget(icon: Icons.call),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
             
                ]),
              ),
            ),
            Positioned(
              left: 10,
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
                ),
                child: ZoomIn(
                    duration: const Duration(seconds: 2),
                    child: Image.network(widget.imgUrl)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.7)),
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white.withOpacity(.7),
      ),
    );
  }
}
