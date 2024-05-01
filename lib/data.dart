Map data = {
  "data": [
    {
      "date": "2022-03-12",
      "confirmed": 43167,
      "deaths": 790,
      "recovered": 0,
      "confirmed_diff": 4,
      "deaths_diff": 0,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 42377,
      "active_diff": 4,
      "fatality_rate": 0.0183,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Azad Jammu and Kashmir",
        "lat": "34.027401",
        "long": "73.947253",
        "cities": []
      }
    },
    {
      "date": "2022-03-12",
      "confirmed": 35437,
      "deaths": 377,
      "recovered": 0,
      "confirmed_diff": 8,
      "deaths_diff": 0,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 35060,
      "active_diff": 8,
      "fatality_rate": 0.0106,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Balochistan",
        "lat": "28.328491999999997",
        "long": "65.898403",
        "cities": []
      }
    },
    {
      "date": "2022-03-12",
      "confirmed": 11631,
      "deaths": 191,
      "recovered": 0,
      "confirmed_diff": 11,
      "deaths_diff": 0,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 11440,
      "active_diff": 11,
      "fatality_rate": 0.0164,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Gilgit-Baltistan",
        "lat": "35.792146",
        "long": "74.982138",
        "cities": []
      }
    },
    {
      "date": "2022-03-12",
      "confirmed": 134818,
      "deaths": 1020,
      "recovered": 0,
      "confirmed_diff": 21,
      "deaths_diff": 0,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 133798,
      "active_diff": 21,
      "fatality_rate": 0.0076,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Islamabad",
        "lat": "33.665087",
        "long": "73.121219",
        "cities": []
      }
    },
    {
      "date": "2022-03-12",
      "confirmed": 218070,
      "deaths": 6300,
      "recovered": 0,
      "confirmed_diff": 134,
      "deaths_diff": 1,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 211770,
      "active_diff": 133,
      "fatality_rate": 0.0289,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Khyber Pakhtunkhwa",
        "lat": "34.485332",
        "long": "72.09169",
        "cities": []
      }
    },
    {
      "date": "2022-03-12",
      "confirmed": 503715,
      "deaths": 13538,
      "recovered": 0,
      "confirmed_diff": 125,
      "deaths_diff": 2,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 490177,
      "active_diff": 123,
      "fatality_rate": 0.0269,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Punjab",
        "lat": "30.811346",
        "long": "72.13913199999998",
        "cities": []
      }
    },
    {
      "date": "2022-03-12",
      "confirmed": 571854,
      "deaths": 8091,
      "recovered": 0,
      "confirmed_diff": 306,
      "deaths_diff": 0,
      "recovered_diff": 0,
      "last_update": "2022-03-13 04:20:49",
      "active": 563763,
      "active_diff": 306,
      "fatality_rate": 0.0141,
      "region": {
        "iso": "PAK",
        "name": "Pakistan",
        "province": "Sindh",
        "lat": "26.009446",
        "long": "68.77680699999999",
        "cities": []
      }
    }
  ]
};
List province = [];

class Province {
  static List provincsData() {
    for (int i = 0; i < data.length; i++) {
      province.add(data[i]['region']['province']);
    }
    return province;
  }
}
