import 'package:flutter/material.dart';

class MealIteam extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;

  const MealIteam(this.imageUrl, this.title, this.duration);

  void gotoMealDetailsPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed('meal_details_page', arguments: {'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotoMealDetailsPage(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text(duration.toString())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
