import 'package:flutter/material.dart';
import 'package:kuis_mobile/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantDetail extends StatefulWidget {
  final Diseases diseases;
  const PlantDetail({super.key, required this.diseases});

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Diseases Detail'),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  //     });
                  //     SnackBar snackBar = SnackBar(content: Text(text));
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(Icons.favorite_border),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 30),

            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(widget.diseases.imgUrls),
            ),
            Text(
              widget.diseases.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(),
            // ),
            Container(
              child: DataTable(
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Disease Name')),
                    DataCell(Text(widget.diseases.name)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Plant Name')),
                    DataCell(Text(widget.diseases.plantName)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Ciri-Ciri')),
                    DataCell(Text(widget.diseases.nutshell[0])),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Disease ID')),
                    DataCell(Text(widget.diseases.id)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Symptom')),
                    DataCell(Text(widget.diseases.symptom)),
                  ]),
                ],
                columns: [
                  DataColumn(label: Text('Keterangan')),
                  DataColumn(label: Text('Description')),
                ],
              ),
            ),
            SizedBox(height: 100),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     diseases.symptom,
            //     textAlign: TextAlign.justify,
            //     style: TextStyle(
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            // Text(diseases.nutshell[0]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launchUrl(widget.diseases.imgUrls);
          },
          child: Icon(Icons.view_array),
        ));
  }
}

Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Gagal membuka link : ${_url}');
  }
}
