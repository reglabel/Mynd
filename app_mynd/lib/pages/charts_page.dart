import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myndlia/pages/musicSection/musicPage.dart';
import 'package:myndlia/pages/widgets/charts_small_card.dart';
import 'detail_page.dart';
import 'notesSection/apresetacao/notas.dart';
import 'widgets/category_boxes.dart';
import 'icons.dart';
import 'widgets/discover_card.dart';
import 'widgets/discover_small_card.dart';
import 'widgets/svg_asset.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xff121421),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 120.h,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryBoxes(
                    text: Text(
                    "Feliz",
                    style: TextStyle(
                        color: Color(0xff515979),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.w),
                  ).data,
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Triste",
                    onPressed: (value) => print(value),
                  ),
                  CategoryBoxes(
                    text: "Cansado",
                    onPressed: (value) => print(value),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Frase do Dia",
                    style: TextStyle(
                        color: Color(0xff515979),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.w),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 80.h,
              child: Center(
                child:Text("Viva sua vida sob os olhos da esperança.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.w,
                      fontWeight: FontWeight.bold))
                      )
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 60.h,
              child: Table(  
                    defaultColumnWidth: FixedColumnWidth(50.0), 
                    children: [
                      TableRow( children: [  
                        Column(children:[Icon(Icons.filter_vintage,color: Colors.white,size: 30.0,)]),  
                        Column(children:[Icon(Icons.filter_drama,color: Colors.white,size: 30.0,)]),  
                        Column(children:[Icon(Icons.hourglass_bottom_rounded,color: Colors.white,size: 30.0,)]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Felizes', style: TextStyle(fontSize: 20.0, color: Colors.white))]),  
                        Column(children:[Text('Tristes', style: TextStyle(fontSize: 20.0, color: Colors.white))]),  
                        Column(children:[Text('Cansativos', style: TextStyle(fontSize: 20.0, color: Colors.white))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('13 dias', style: TextStyle(color: Colors.white))]),  
                        Column(children:[Text('28 dias', style: TextStyle(color: Colors.white))]),  
                        Column(children:[Text('5 dias', style: TextStyle(color: Colors.white))]),  
                      ]),  
                    ],  
                  ),  
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Text(
                "Notícias para você",
                style: TextStyle(
                    color: Color(0xff515979),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.w),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 28.w),
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 19.w, mainAxisExtent:  125.w, mainAxisSpacing: 19.w),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ChartSmallCard(
                    link: 'https://www.napratica.org.br/produtividade-como-ser-mais-produtivo/#:~:text=Em%20um%20de%20seus%20significados,em%20prol%20de%20algum%20resultado.',
                    title: "Produtividade",
                    gradientStartColor: Color.fromARGB(255, 209, 10, 216),
                    gradientEndColor: Color.fromARGB(255, 57, 11, 226),
                  ),
                  ChartSmallCard(
                    link: 'https://g1.globo.com/bemestar/especial-publicitario/a-vida-e-pra-ja/noticia/2022/06/30/do-simples-ao-extraordinario-celebrar-e-bom-demais-e-faz-bem.ghtml',
                    title: "Bem-estar",
                    gradientStartColor: Color.fromARGB(255, 233, 5, 5),
                    gradientEndColor: Color.fromARGB(255, 240, 129, 26),
                    icon:    SvgAsset(
                      assetName: AssetName.tape,
                      height: 24.w,
                      width: 24.w,
                    ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }


  void onSeeAllTapped() {
  }

  void onSleepMeditationTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
  }

  void onDepressionHealingTapped() {
  }

  void onSearchIconTapped() {
  }

  void onNotesTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Notas(),
      ),
    );
  }

  void onAudiosTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MusicPage(),
      ),
    );
  }
}
