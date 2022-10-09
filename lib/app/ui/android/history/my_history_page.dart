import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/ui/android/record/record_detail_page.dart';
import 'package:how_much_spend_app/app/ui/theme/utils.dart';

class MyHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 25,),
            Container(
              color: Colors.white,
              child: Frame(child: MainTitle(title: "내 전체 기록")),
            ),
            SizedBox(height: 15),
            _totalRecord(),
            SizedBox(height: 15),
            Container(
              color: Colors.white,
              child: Frame(child: MainTitle(title: "기록 목록")),
            ),
            SizedBox(height: 15),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromRGBO(255, 184, 0, 0.1),
                ),
                constraints: BoxConstraints(
                    minHeight: 400
                ),
                child: Container(
                    height: 400,
                    child: ListView.builder(
                        padding: EdgeInsets.all(12.0),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only( bottom: 15),
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                    RecordDetailPage(),
                                    duration: Duration(milliseconds: 400),
                                    transition: Transition.fade
                                );
                              },
                              child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(15.0),),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 8,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("09",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                                                  Text("27",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                                                  Text("(화)",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 34,
                                            child: VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("매일 즐겁게 걷기",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                                              SizedBox(height: 5,),
                                              Text("00:01 / 0.00 km / ~ Step",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: Colors.grey),)
                                            ],
                                          )
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios,color: Colors.grey, size: 17.0,)
                                    ],
                                  )
                              ),
                            ),
                          );
                        }
                    )
                )
            ),

          ],
        )
        ),
      );
  }
}


Widget _totalRecord() {
  return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Color.fromRGBO(255, 184, 0, 0.1),
      ),
      constraints: BoxConstraints(
          minHeight: 130
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder(horizontalInside: BorderSide(width: 4, color: Colors.white, style: BorderStyle.solid),
            verticalInside: BorderSide(width: 4, color: Colors.white, style: BorderStyle.solid)),
        columnWidths: {
          0: FixedColumnWidth(80.0),
          2: FixedColumnWidth(80.0),
        },
        children: [
          TableRow(
              children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text("총 거리",style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Aggro',
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text("10 km",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Aggro',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text("총 시간", style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Aggro',
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text("00:10:00", style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Aggro',
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Text("전체 페이스",style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Aggro',
                        fontWeight: FontWeight.bold),
                    )
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text("10`1 k/m",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Aggro',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Text("전체 칼로리",style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Aggro',
                        fontWeight: FontWeight.bold),
                    )
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text("300 cal",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Aggro',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]
          )
        ],
      )
  );
}