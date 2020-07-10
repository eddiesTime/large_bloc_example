import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/authentication/authentication_bloc.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';

/// This widget contains a [Switch] to switch between
/// the measurement unit used in the weather screen.
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    'Temperature Units',
                  ),
                  isThreeLine: true,
                  subtitle: const Text(
                      'Use metric measurements (celsius) for temperature units.'),
                  trailing: Switch(
                    key: const Key('__Settings_Switch__'),
                    value: settingsState.temperatureUnit ==
                        TemperatureUnit.celsius,
                    onChanged: (value) => context
                        .bloc<SettingsBloc>()
                        .add(SettingsEvent.toggleTemperatureUnit(value)),
                  ),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 3.0, color: Colors.black38),
                  bottom: BorderSide(width: 3.0, color: Colors.black38),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(bottom: 24.0),
              child: ListTile(
                onTap: () {
                  context.bloc<AuthenticationBloc>().add(const SignedOut());
                },
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
              ),
            )
          ],
        );
      },
    );
  }
}
