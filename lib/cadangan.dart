import 'package:flutter/material.dart';
import 'package:kuis_mobile/disease_data.dart';

class Jejaga extends StatelessWidget {
  final Diseases diseases;
  const Jejaga({super.key, required this.diseases});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseases Detail'),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
            child: Image.network(diseases.imgUrls),
          ),
          Text(
            diseases.name,
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
                  DataCell(Text(diseases.name)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Plant Name')),
                  DataCell(Text(diseases.plantName)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Ciri-Ciri')),
                  DataCell(Text(diseases.nutshell[0])),
                ]),
                DataRow(cells: [
                  DataCell(Text('Disease ID')),
                  DataCell(Text(diseases.id)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Symptom')),
                  DataCell(Text(diseases.symptom)),
                ]),
              ],
              columns: [
                DataColumn(label: Text('Keterangan')),
                DataColumn(label: Text('Description')),
              ],
            ),
          ),
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
    );
  }
}
