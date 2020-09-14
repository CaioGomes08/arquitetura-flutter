import 'package:flutter/material.dart';
import 'package:semana_arquitetura_app/app/models/clima_tempo.model.dart';
import 'package:semana_arquitetura_app/app/pages/home/home.controller.dart';
import 'package:semana_arquitetura_app/app/repositories/apiadvisor.repository.dart';
import 'package:semana_arquitetura_app/app/services/client_http.service.dart';
import 'package:semana_arquitetura_app/app/viewmodels/api_advisor.viewmodel.dart';

import 'components/custom_switch.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiAdvisorViewModel(
      ApiAdvisorRepository(
        ClientHttpService(),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getWeather();
        },
        child: Icon(Icons.timelapse),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomSwitchWidget(),
            ValueListenableBuilder<ClimaTempoModel>(
              valueListenable: controller.weather,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Text(model.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
