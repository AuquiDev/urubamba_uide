import 'package:flutter/material.dart';
import 'package:urubamba_uide/Model/recurso_model.dart';
import 'package:urubamba_uide/Pages/recursos_pages.dart';
import 'package:urubamba_uide/Provider/recursos_provider.dart';
import 'package:provider/provider.dart';

class RecursoTuristicosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recursoProvider =
        Provider.of<RecursosProvider>(context, listen: true);
    final List<Recurso> recurso = recursoProvider.recursoList;
    return Column(
      children: [
         //no cambia
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [  
              Text('Recursos Turisticos de Urubamba',
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
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...recurso.map((e) => RecursoSlider(
                    place: e,
                    onmandarina: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RecursoPage(data: e)));
                    },
                  )).toList()
              // ...List.generate(
              //   recursoProvider.recursoList.length,
              //   (index) => RecursoSlider(recursoProvider: recursoProvider),
              // )
            ],
          ),
        )
      ],
    );
  }
}

class RecursoSlider extends StatelessWidget {
  RecursoSlider({
    Key? key,
    required this.onmandarina,
    required this.place,
  }) : super(key: key);

  Function onmandarina;
  Recurso place;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 135,
      width: 90,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecursoPage(
                            data: place,
                          )));
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 192, 191, 191),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 235, 210, 99),
                      offset: Offset.zero,
                      spreadRadius: 1.5,
                      blurRadius: 0)
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(place.image)),
              ),
            ),
          ),
          Text(
            place.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
