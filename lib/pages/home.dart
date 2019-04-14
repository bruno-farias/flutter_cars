import 'package:flutter/material.dart';
import 'package:flutter_cars/domain/car.dart';
import 'package:flutter_cars/domain/services/car_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: _body(),
      ),
    );
  }

  _body() {
    // final cars = CarService.getCars();
    return Container(
      padding: EdgeInsets.all(12),
      child: FutureBuilder<List<Car>>(
        future: CarService.getCars(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'No cars available.',
              style: TextStyle(fontSize: 26, color: Colors.grey),
            ));
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return _listView(snapshot.data);
        },
      ),
    );
  }

  _listView(List<Car> cars) {
    return ListView.builder(
        itemCount: cars.length,
        itemBuilder: (BuildContext context, int index) {
          final Car car = cars[index];
          return Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(car.image),
                    ),
                    Text(
                      car.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    Text(
                      car.description,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text('DETAILS'),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text('SHARE'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

/**
 * ListTile(
  leading: Image.network(
  car.image,
  width: 150,
  ),
  title: Text(car.name,
  style: TextStyle(color: Colors.blue, fontSize: 18.0)),
  subtitle: Text(
  'description',
  style: TextStyle(color: Colors.black, fontSize: 16),
  ),
)
*/
