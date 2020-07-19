import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/presentation/routes/router.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather.dart';

/// This widget functions as a container for the weather screen.
///
/// It is the initial screen which builds a scaffold and contains
/// the weather content.
class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('__Weather_App_Bar__'),
        title: const Text('Flutter_Bloc Weather'),
        actions: <Widget>[
          IconButton(
            key: const Key('__Settings_IconButton__'),
            icon: const Icon(Icons.settings),
            onPressed: () {
              ExtendedNavigator.root.pushNamed(Routes.settingsPage);
            },
          ),
        ],
      ),
      body: Weather(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('__Geolocation_FAB__'),
            heroTag: 'LocationBtn',
            mini: true,
            backgroundColor: Colors.grey,
            onPressed: () {
              BlocProvider.of<WeatherBloc>(context).add(
                WeatherEvent.fetchWeatherForLocationWithLattLong(
                  requestTime: DateTime.now(),
                ),
              );
            },
            child: const Icon(
              Icons.location_on,
            ),
          ),
          FloatingActionButton(
            key: const Key('__Search_FAB__'),
            heroTag: 'SearchBtn',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              BlocProvider.of<WeatherBloc>(context)
                  .add(const WeatherEvent.newSearch());
              ExtendedNavigator.root.pushNamed(Routes.searchPage);
            },
            child: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
