import 'package:dicoding_tempat_wisata/detail_screen.dart';
import 'package:dicoding_tempat_wisata/tourism_place.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Bandung"),
      ),
      body: ListView.builder(
        itemCount: tourismPlaceList.length,
        itemBuilder: (builder, index) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  place: tourismPlaceList[index],
                ),
              ),
            ),
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        tourismPlaceList[index].imageAsset,
                      )),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tourismPlaceList[index].name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(tourismPlaceList[index].location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
