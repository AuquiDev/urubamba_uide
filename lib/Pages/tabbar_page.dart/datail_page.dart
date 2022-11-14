
import 'package:flutter/material.dart';
import 'package:urubamba_uide/Model/distrito_models.dart';
import 'package:urubamba_uide/Pages/tabbar_page.dart/danza_tabbar.dart';



class DetailPage extends StatefulWidget {

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                        Tab( child: Text('Danzas', style: _textstyleTab(Colors.black),), ),
                         Tab(child: Text('Clima',style: _textstyleTab(Colors.black45),), ),
                        Tab( child: Text('Flora Fauna',style: _textstyleTab(Colors.black45),),)
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
                          const DanzaCategory(),
                          const GalleryPage(),
                          const ReviewsPage(),
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

  TextStyle _textstyleTab(Color? color) => TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 20);

  TextStyle _style(Color color){
    return TextStyle(
                    color: color,
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  );
  }
}

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Reviews Santori, Greece',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 19),),

          Expanded(
            child: Container(
              child: ListWheelScrollView.useDelegate(
               physics: const ScrollPhysics(),
                    
                    onSelectedItemChanged: (value) {
                    },
                    squeeze: .8,
                    diameterRatio: .6,
                    itemExtent: 100,
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 20,
                      builder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
                        color: Colors.primaries[index%Colors.primaries.length],
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Reviews ${index}',style: TextStyle(fontSize: 20,color: Colors.primaries[(-index)%Colors.primaries.length]),)),
                      ) ;
                    }, 
                  )
              ),
            ),
          )
        ],
      ));
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Gallery Santori, Greece',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 19),),
          const SizedBox(height: 20,),
          
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 10,
                shrinkWrap: true,
                physics: const ScrollPhysics( ),
                 itemBuilder: (BuildContext context, int index) {
                   return Container(
                    margin: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://www.traveloffpath.com/wp-content/uploads/2021/04/Santorini-Pools.jpg.webp'))
                    ),
                   );
                }, 
              ),
            ),
          )
        ],
      ));
  }
}

class DanzaCategory extends StatelessWidget {
  const DanzaCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DanzaBar()
        ],
      ));
  }
}