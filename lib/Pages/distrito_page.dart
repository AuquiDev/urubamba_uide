import 'package:flutter/material.dart';
import 'package:urubamba_uide/Model/distrito_models.dart';

class DistritoPage extends StatelessWidget {
  DistritoPage({Key? key, required this.data}) : super(key: key);

  Distrito data;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.58,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(42.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(data.imagen),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(42.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              height: 1.2,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.white70,
                                            size: 18.0,
                                          ),
                                          const SizedBox(
                                            width: 4.0,
                                          ),
                                          Text(
                                            "${data.id}, 1",
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "MUNICIPALIDAD PROVINCIAL",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16.0),
                                      ),
                                      const Text(
                                        "DIVICION DE TURISMO",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "HISTORIA",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        data.descripcion,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 120,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 255, 255, 255),
                      blurRadius: 40,
                      offset: Offset(0, -40),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      data.id,
                      (index) => const Icon(
                        Icons.star,
                        color: Color(0xffFEAA36),
                        size: 22.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        data.id.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " (${data.id} reviews)",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
