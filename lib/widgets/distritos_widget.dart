import 'package:flutter/material.dart';
import 'package:urubamba_uide/Model/distrito_models.dart';
import 'package:urubamba_uide/Pages/distrito_page.dart';
import 'package:urubamba_uide/Provider/distrito_provider.dart';
import 'package:provider/provider.dart';

class DistritosWIdget extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final distritoProvider =
        Provider.of<DistritoProvider>(context, listen: true);
    final List<Distrito> distrito = distritoProvider.distritoList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //no cambia
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [  
              Text('Distritos de Urubamba',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(217, 34, 34, 34))),
              Text(
                'VER MAS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 77, 126, 248),
                ),
              ),
             
            ],
          ),
        ),

        //Slider Horizontal
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...distrito.map((e) => ItemSliderWidget(
                place: e,
                onMandarina: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DistritoPage(data: e,)));
                },
              )).toList(),
                  
            ],
          ),
        ),
      ],
    );
  }
}

class ItemSliderWidget extends StatelessWidget {
 ItemSliderWidget({super.key, required this.onMandarina,required this.place});
  Function onMandarina;
  Distrito place ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
          splashColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(.6),
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  DistritoPage(data: place,)));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 4, vertical: 4),
            height: 110,
            width: 170,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        place.imagen
                        )),
                borderRadius:
                    const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 171, 167, 171)
                          .withOpacity(.5),
                      offset: const Offset(.5, 1.5),
                      blurRadius: 0,
                      spreadRadius: 2)
                ]),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration( 
                   borderRadius:
                    BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3),
                      height: 50,
                      
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(.45),
                          borderRadius:  const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                         place.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                      )),
                )
              ],
            ),
          ),
        );
  }
}
