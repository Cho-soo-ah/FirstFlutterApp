import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final slideItems = [
  'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/01/05/17/51/maltese-1123016_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/08/01/09/04/dog-2563759_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/03/27/15/24/animal-4085255_960_720.jpg',
];

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[_buildTop(), _buildMiddle(), _buildBottom()],
    );
  }
}

Widget _buildTop() {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () => {
                print('click'),
              },
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.zoom_in_rounded,
                    size: 40,
                  ),
                  Text('zoom')
                ],
              ),
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_airport,
                  size: 40,
                ),
                Text('plain')
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text('택시')
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_cafe,
                  size: 40,
                ),
                Text('cafe')
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Icon(
                  Icons.zoom_in_rounded,
                  size: 40,
                ),
                Text('zoom')
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.zoom_in_rounded,
                  size: 40,
                ),
                Text('zoom')
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.zoom_in_rounded,
                  size: 40,
                ),
                Text('zoom')
              ],
            ),
            Opacity(
              opacity: 0,
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.zoom_in_rounded,
                    size: 40,
                  ),
                  Text('zoom')
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildMiddle() {
  return CarouselSlider(
    options: CarouselOptions(height: 150, autoPlay: true),
    items: slideItems.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(url, fit: BoxFit.cover),
              ));
        },
      );
    }).toList(),
  );
}

Widget _buildBottom() {
  final items = List.generate(10, (index) {
    return const ListTile(
      leading: Icon(Icons.notifications_none),
      title: Text('[EVENT] 공지사항입니다.'),
    );
  });

  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: items,
  );
}
