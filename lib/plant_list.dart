import 'package:flutter/material.dart';
import 'package:kuis_mobile/plant_detail.dart';
import 'package:kuis_mobile/disease_data.dart';

class PlantList extends StatelessWidget {
  const PlantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Diseases List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 270,
          childAspectRatio: double.infinity,
          // childAspectRatio: 0.55,
        ),
        itemCount: listDisease.length,
        itemBuilder: (context, index) {
          final Diseases diseases = listDisease[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlantDetail(
                  diseases: diseases,
                );
              }));
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    child: ClipRRect(
                      //Clip Rounded Rectangle
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        diseases.imgUrls,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            diseases.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
