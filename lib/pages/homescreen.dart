import 'package:provider/provider.dart';
import 'package:uas_06tplm006_201011401202/pages/DateWidget.dart';
import 'package:flutter/material.dart';
import '../provider/cuaca_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CuacaProvider cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sun.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CuacaProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(provider.cuacaModel.name ?? " ",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      TextFormField(
                        controller: provider.cityNameText,
                        decoration: const InputDecoration(
                          hintText: "Masukkan Nama Kota",
                          labelText: "Nama Kota",
                        ),
                        onEditingComplete: () {
                          provider.showWeatherData();
                        },
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     provider.showWeatherData();
                      //   },
                      //   child: const Text("Tampilkan Data Cuaca"),
                      // ),
                      DateWidget(),

                      Text(provider.cuacaModel.weather?.first.main ??
                          "Waiting Data"),
                      Text(
                        "${provider.cuacaModel.main?.temp} Celcius",
                        style: TextStyle(fontSize: 55),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
