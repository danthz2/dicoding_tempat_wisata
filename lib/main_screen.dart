import 'package:dicoding_tempat_wisata/detail_screen.dart';
import 'package:dicoding_tempat_wisata/tourism_place.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Wisata Bandung, Size : ${MediaQuery.of(context).size.width}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 1200) {
              return TourismPlaceGrid(
                gridCount: 6,
              );
            } else if (constraints.maxWidth >= 600) {
              return TourismPlaceGrid(gridCount: 4);
            } else {
              return TourismPlaceList();
            }
          },
        ),
      ),
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  int gridCount;
  TourismPlaceGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: gridCount,
      children: tourismPlaceList.map(
        (place) {
          int index = 0;
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(
                    place: place,
                  );
                },
              ),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      place.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      place.location,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
