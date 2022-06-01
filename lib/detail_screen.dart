import 'package:dicoding_tempat_wisata/second_screen.dart';
import 'package:dicoding_tempat_wisata/tourism_place.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  DetailScreen({required this.place});
  String option = "Op1";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(place: place);
      } else {
        return DetailMobilePage(place: place);
      }
    }));
  }
}

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;
  DetailWebPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Wisata Bandung"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(place.imageAsset),
                      Row(
                        children: place.imageUrls.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                e,
                                height: 100,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Text(place.name),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(
                              height: 10,
                            ),
                            Text(place.openDays)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(
                              height: 10,
                            ),
                            Text(place.openTime)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on),
                            SizedBox(
                              height: 10,
                            ),
                            Text(place.ticketPrice)
                          ],
                        ),
                        Text(place.description),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [Text("1")],
            )
            // Row(
            //   children: [
            //     Image.asset(place.imageAsset),
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Row(
            //           children: [
            //             Icon(Icons.calendar_today),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Text(place.openDays)
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(Icons.access_time),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Text(place.openTime)
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Icon(Icons.monetization_on),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Text(place.ticketPrice)
            //           ],
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(16),
            //           child: Text(
            //             place.description,
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Text(
            //   place.name,
            //   style: TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   height: 150,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       ...place.imageUrls.map((e) {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(10),
            //             child: Image.network(e),
            //           ),
            //         );
            //       }).toList()
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  const DetailMobilePage({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(place.imageAsset),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white60,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                place.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        height: 10,
                      ),
                      Text(place.openDays)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(
                        height: 10,
                      ),
                      Text(place.openTime)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(
                        height: 10,
                      ),
                      Text(place.ticketPrice)
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...place.imageUrls.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(e),
                        ),
                      );
                    }).toList()
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SecondScreen("text dari halaman 1"),
                        ),
                      ),
                  child: Text("Next Page")),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white60,
      child: IconButton(
        icon: Icon(Icons.favorite_border),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
