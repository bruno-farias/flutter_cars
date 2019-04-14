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
          return Container(
            // height: 250,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Image.network(cars[index].image),
                      Container(
                        color: Colors.black45,
                        child: Center(
                          child: Text(
                            cars[index].name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                        ),
                      )
                    ],
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
