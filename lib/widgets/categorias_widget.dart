import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urubamba_uide/Model/danza_models.dart';
import 'package:urubamba_uide/Provider/danza_provider.dart';

class CategoriasWidgets extends StatelessWidget {
  const CategoriasWidgets({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Categorias',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(217, 34, 34, 34))),
            // Text(
            //   'VER MAS',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 15,
            //     color: Color.fromARGB(255, 77, 126, 248),
            //   ),
            // )
          ],
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       ...List.generate(3, (index) => Container(
        //         margin: const EdgeInsets.symmetric(horizontal: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        //         width: 150,
        //         decoration:  BoxDecoration(
        //           color: Color.fromARGB(255, 138, 58, 152).withOpacity(.9),
        //           borderRadius: BorderRadius.all(Radius.circular(12)),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.black.withOpacity(.8),
        //               offset: Offset(10,5),
        //               blurRadius: 7,
        //               spreadRadius: 1,
        //               blurStyle: BlurStyle.normal
        //             )
        //           ]
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children:  [
                   
        //             Text(
        //              '',//danza[index].title.toString(),
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 15),
        //             ),
        //           ],
        //         ),
        //       ),
        //      )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
