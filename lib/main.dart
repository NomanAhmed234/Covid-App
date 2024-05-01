import 'dart:convert';
import 'package:covid_app/data.dart';
import 'package:covid_app/date_pick.dart';
import 'package:covid_app/grapg.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;

// Define model classes to parse the JSON data
int number = 3;

class RegionData {
  final String date;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int confirmedDiff;
  final int deathsDiff;
  final int recoveredDiff;
  final String lastUpdate;
  final int active;
  final int activeDiff;
  final double fatalityRate;
  final Region region;

  RegionData({
    required this.date,
    required this.confirmed,
    required this.deaths,
    required this.recovered,
    required this.confirmedDiff,
    required this.deathsDiff,
    required this.recoveredDiff,
    required this.lastUpdate,
    required this.active,
    required this.activeDiff,
    required this.fatalityRate,
    required this.region,
  });

  factory RegionData.fromJson(Map<String, dynamic> json) {
    return RegionData(
      date: json['date'],
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      confirmedDiff: json['confirmed_diff'],
      deathsDiff: json['deaths_diff'],
      recoveredDiff: json['recovered_diff'],
      lastUpdate: json['last_update'],
      active: json['active'],
      activeDiff: json['active_diff'],
      fatalityRate: json['fatality_rate'],
      region: Region.fromJson(json['region']),
    );
  }
}

class Region {
  final String iso;
  final String name;
  final String province;
  final String lat;
  final String long;

  Region({
    required this.iso,
    required this.name,
    required this.province,
    required this.lat,
    required this.long,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      iso: json['iso'],
      name: json['name'],
      province: json['province'],
      lat: json['lat'],
      long: json['long'],
    );
  }
}

void provinceData() {}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Region Data'),
        ),
        body: FutureBuilder<List<RegionData>>(
          future: fetchData(), // function to fetch data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return
                  // ListView.builder(
                  //   itemCount: snapshot.data!.length,
                  //   itemBuilder: (context, index) {
                  //     var data = snapshot.data![index];
                  Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Statistics",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    MyDatePicker(),
                    Container(
                      height: 40,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  setState() {
                                    number = index;
                                    print(index);
                                  }
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "${snapshot.data![index].region.province}",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Today",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Yesterday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Card(
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Affected",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty)
                                      Text(
                                        "${snapshot.data![number].confirmed}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Card(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Death",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty)
                                      Text(
                                        "${snapshot.data![number].deaths}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Card(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recovered",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty)
                                      Text(
                                        "${snapshot.data![number].recovered}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Card(
                              color: Colors.lightGreen,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Active",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty)
                                      Text(
                                        "${snapshot.data![number].active}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Card(
                              color: Colors.pink,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Serious",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty)
                                      Text(
                                        "${snapshot.data![number].confirmedDiff}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              // ListTile(
              //   title: Text(data.region.province),
              //   subtitle: Text('Confirmed: ${data.deaths}'),
              // );
            }
          },
        ),
      ),
    );
  }

  Future<List<RegionData>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://covid-api.com/api/reports?date=2023-02-10&q=pakistan'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['data'];
      List<RegionData> dataList =
          jsonList.map((json) => RegionData.fromJson(json)).toList();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
