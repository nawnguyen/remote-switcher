import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:light_switch_app/features/core/application/routes/route_names.dart';
import '../domain/weather_model.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weather = WeatherModel();
    weather.temperature = 25;
    weather.humidity = 89;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1F2439),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    context.goNamed(RouteNames.groupsPageNameRoute);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    height: 150,
                    width: 395,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          size: 50,
                          color: Colors.blue,
                        ),
                        Text(
                          '${weather.humidity}%',
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          '${weather.temperature}°C',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(2, (index) {
                    return GestureDetector(
                      onTap: () {
                        context.goNamed(RouteNames.groupsPageNameRoute);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E334A),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
