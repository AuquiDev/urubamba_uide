import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urubamba_uide/Pages/restaurant_page.dart';
import 'package:urubamba_uide/Pages/tabbar_page.dart/datail_page.dart';
import 'package:urubamba_uide/Pages/muni_page.dart';
import 'package:urubamba_uide/Provider/distrito_provider.dart';
import 'package:urubamba_uide/widgets/categorias_widget.dart';
import 'package:urubamba_uide/widgets/distritos_widget.dart';
import 'package:urubamba_uide/widgets/recursos_turisticos_widget.dart';
import 'package:urubamba_uide/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DistritoProvider> listData = [];

  DistritoProvider data = DistritoProvider();

  @override
  void initState() {
    super.initState();
    // initData();
  }

  // Future<void> initData()async{
  //   listData = await data.getDistritoprovider();
  //   setState(() {

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(data.getDistritoprovider());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Imagen Fondo
              Container(
                height: height * .45,
                width: double.infinity,
                decoration: _Decoration_image(),
              ),
              //Tetxto y buscador
              Container(
                height: height * .45,
                width: double.infinity,
                decoration: _decorattionColors(),
                child: Stack(
                  children: [
                    //Texto buscador search
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Urubamba',
                              style: TextStyle(
                                  color: Color.fromARGB(243, 245, 245, 245),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                            Text(
                              'Municipalida Provincial',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(243, 245, 245, 245),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SearchWidget()
                          ],
                        ),
                      ),
                    ),
                    //Subtitle y estrellas
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding:
                            const EdgeInsets.only(right: 15, left: 18, top: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.32),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(45),
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Bienvenidos',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(221, 247, 245, 245)),
                                ),
                                const Text(
                                  'A la Provincia Arqueológica del Perú',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          Color.fromARGB(255, 225, 222, 222)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.where_to_vote_sharp,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Division Turistica de - Urubamba',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color.fromARGB(
                                                        255, 225, 222, 222)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.email,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Correo : turismo@muniurubamba.gob.pe',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color.fromARGB(
                                                        255, 225, 222, 222)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                      'Clima',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 225, 222, 222)),
                                    ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '12.23 ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 225, 222, 222)),
                                    ),
                                    Text(
                                      'ºC',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Color.fromARGB(
                                              255, 225, 222, 222)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Imagen Logo Municialidad
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MunicipalidadPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.home,
                      color: Color.fromARGB(197, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // const SizedBox(height: 20,),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  children: [
                    DistritosWIdget(),
                    const SizedBox(
                      height: 10,
                    ),
                    RecursoTuristicosWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const CategoriasWidgets(),
                    // DetailPage(),
                    ElevatedButton(onPressed: 
                    (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantsPage()));
                    },
                    child: Text('Restaurantes'),
                    )
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _decorattionColors() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(48, 115, 116, 117),
            const Color.fromARGB(184, 28, 40, 40).withOpacity(.3),
            const Color.fromARGB(211, 23, 67, 4).withOpacity(.3),
            const Color.fromARGB(255, 17, 0, 255).withOpacity(.4),
          ]),
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(45),
      ),
    );
  }

  BoxDecoration _Decoration_image() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(45),
      ),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://www.peruforless.com/blog/wp-content/uploads/2021/04/urubamba-viewpoint.jpg'),
      ),
    );
  }
}
