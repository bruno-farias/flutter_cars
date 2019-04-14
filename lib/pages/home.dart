import 'package:flutter/material.dart';
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
        child: _listView(),
      ),
    );
  }

  _listView() {
    final cars = CarService.getCars();

    return ListView.builder(
        itemCount: cars.length,
        itemBuilder: (BuildContext context, int index) {
          final car = cars[index];

          return Container(
            height: 250,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Image.network(cars[index].image),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          cars[index].name,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
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
