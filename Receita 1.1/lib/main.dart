import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cervejaria do Luiz",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CERVEJAS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DataTable(
                      headingRowHeight: 60,
                      dataRowHeight: 35,
                      columnSpacing: 150,
                      horizontalMargin: 30,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            "Nome",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Estilo",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "IBU",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          numeric: true,
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("La Fin Du Monde")),
                            DataCell(Text("Bock")),
                            DataCell(Text("65")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Sapporo Premium")),
                            DataCell(Text("Sour Ale")),
                            DataCell(Text("54")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Duvel")),
                            DataCell(Text("Pilsner")),
                            DataCell(Text("82")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Heineken")),
                            DataCell(Text("Pale Lager")),
                            DataCell(Text("48")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Guinness Draught")),
                            DataCell(Text("Irish Dry Stout")),
                            DataCell(Text("45")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Chimay Grande Réserve")),
                            DataCell(Text("Belgian Strong Ale")),
                            DataCell(Text("75")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Pliny the Elder")),
                            DataCell(Text("Double IPA")),
                            DataCell(Text("100")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Tripel Karmeliet")),
                            DataCell(Text("Tripel")),
                            DataCell(Text("30")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Westvleteren")),
                            DataCell(Text("Quadrupel")),
                            DataCell(Text("60")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Weihenstephaner Hefeweissbier")),
                            DataCell(Text("Hefeweizen")),
                            DataCell(Text("25")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Rochefort")),
                            DataCell(Text("Quadrupel")),
                            DataCell(Text("35")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("American Amber Ale")),
                            DataCell(Text("Amber Ale")),
                            DataCell(Text("40")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Porter")),
                            DataCell(Text("Porter")),
                            DataCell(Text("50")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Pilsner Urquell")),
                            DataCell(Text("Pilsner")),
                            DataCell(Text("30")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Milk Stout")),
                            DataCell(Text("Stout")),
                            DataCell(Text("25")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Gose")),
                            DataCell(Text("Sour Ale")),
                            DataCell(Text("10")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Doppelbock")),
                            DataCell(Text("Bock")),
                            DataCell(Text("35")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Session IPA")),
                            DataCell(Text("IPA")),
                            DataCell(Text("40")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Red Ale")),
                            DataCell(Text("Amber Ale")),
                            DataCell(Text("28")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Barleywine")),
                            DataCell(Text("Barleywine")),
                            DataCell(Text("65")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Saison")),
                            DataCell(Text("Farmhouse Ale")),
                            DataCell(Text("20")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Witbier")),
                            DataCell(Text("Belgian Ale")),
                            DataCell(Text("12")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Mystic Mocha Madness")),
                            DataCell(Text("Coffee Stout")),
                            DataCell(Text("70")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Hoppy Haze")),
                            DataCell(Text("IPA")),
                            DataCell(Text("85")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Golden Glory")),
                            DataCell(Text("Blonde Ale")),
                            DataCell(Text("60")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Raspberry Ripple")),
                            DataCell(Text("Fruit Lambic")),
                            DataCell(Text("78")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Citra Sensation")),
                            DataCell(Text("Pale Ale")),
                            DataCell(Text("73")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Velvet Vanilla")),
                            DataCell(Text("Cream Ale")),
                            DataCell(Text("68")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Amber Ambition")),
                            DataCell(Text("Amber Ale")),
                            DataCell(Text("65")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Tropical Temptation")),
                            DataCell(Text("Fruit IPA")),
                            DataCell(Text("80")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Wheat Whimsy")),
                            DataCell(Text("Wheat Beer")),
                            DataCell(Text("72")),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text("Midnight Moonshine")),
                            DataCell(Text("Imperial Stout")),
                            DataCell(Text("88")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
