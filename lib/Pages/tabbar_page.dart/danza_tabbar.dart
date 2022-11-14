
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urubamba_uide/Model/danza_models.dart';
import 'package:urubamba_uide/Model/distrito_models.dart';
import 'package:urubamba_uide/Provider/danza_provider.dart';



class DanzaBar extends StatefulWidget {

  @override
  State<DanzaBar> createState() => _DanzaBarState();
}

class _DanzaBarState extends State<DanzaBar> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                     margin: const EdgeInsets.only(top: 30),
                     child: TabBar(
                      controller: _tabController,
                      indicatorColor: const Color.fromARGB(255, 146, 33, 146),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 1,
                      tabs: [
                        Tab( child: Text('Grupo1', style: _textstyleTab(Colors.black),), ),
                         Tab(child: Text('Grupo2',style: _textstyleTab(Colors.black45),), ),
                        Tab( child: Text('Grupo3',style: _textstyleTab(Colors.black45),),),
                        Tab( child: Text('Grupo4',style: _textstyleTab(Colors.black45),),)
                       ]
                      ),
                    ),
        
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      width: double.infinity,
                      height: 800,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                           Grupo1Tab(index_image: 0,),
                           Grupo1Tab(index_image: 1,),
                           Grupo1Tab(index_image: 2,),
                           Grupo1Tab(index_image: 3,),
                        ],
                      ),
                    ),
                  ),

                 ]
              ),
            ),
         
          ],
        );
  }

  TextStyle _textstyleTab(Color? color) => TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 15);

}

class Grupo1Tab extends StatelessWidget {
   Grupo1Tab({
    Key? key,required this.index_image
  }) : super(key: key);
  int index_image;
  @override
  Widget build(BuildContext context) {

    final danzaProvider = Provider.of<DanzaProvider>(context,listen: true);
    final List<Danza> danza = danzaProvider.danzaList;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
         danza[0].title.toString(),
         textAlign: TextAlign.center,
         style: const TextStyle( 
          fontWeight: FontWeight.bold,
          fontSize: 22),),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage(
                  danza[index_image].images.toString()
                ) )
            ),
            height: 200,
            width: double.infinity,
          ),
          ...List.generate(danza.length, (index) => Text(danza[index].danzaDeViento1.toString()))
      ],
    );
  }
}
