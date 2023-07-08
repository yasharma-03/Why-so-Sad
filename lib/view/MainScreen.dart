import 'package:flutter/material.dart';
import 'package:why_so_sad/contoller/fetchMeme.dart';
import 'package:why_so_sad/contoller/saveMyData.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});


  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String ImgUrl = "https://th.bing.com/th/id/OIP.wZSElpa92SSl0joMTscQnwHaIK?pid=ImgDet&rs=1";

  int? memeNo;
  int targetMeme = 20;
  bool isLoading = true;

  void initState() {
    // TODO: implement initState

    super.initState();

    GetInitMemeNo();


    changeImg();
  }


  GetInitMemeNo() async{
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo!>20){
      targetMeme = 100;
    }
    else if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo! > 500){
      targetMeme  = 1000;
    }
    setState(() {

    });
  }

  void changeImg() async{
    String getImgUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      //print(getImgUrl);
      ImgUrl = getImgUrl;
      isLoading  = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Meme #${memeNo.toString()}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Target ${targetMeme} Memes",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            isLoading ?
            Container(
                height : 400,
                width : MediaQuery.of(context).size.width,
                child : Center(
                    child : SizedBox(
                        height : 60,
                        width : 60,
                        child: CircularProgressIndicator())
                )
            )
                :
            Image.network(
                height : 400,
                width : MediaQuery.of(context).size.width,
                fit : BoxFit.fitHeight,
                ImgUrl),
            // SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async{
                  setState(() {
                    isLoading = true;

                  });
                  await SaveMyData.saveData(memeNo!+1);
                  GetInitMemeNo();

                  changeImg();

                },
                child: Container(
                    height: 70,
                    width: 100,
                    child: Center(
                        child: Text("More",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))))),
            Spacer(),
            Text(
              "App Created By:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Yash Sharma",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
