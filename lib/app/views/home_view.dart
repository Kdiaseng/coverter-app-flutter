import 'package:coverter_app/app/components/currency_box.dart';
import 'package:coverter_app/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 30, top: 100, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/currency.png',
                    width: 150, height: 150),
                CurrencyBox(
                    selectedItem: homeController.toCurrency,
                    controller: toText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.toCurrency = model;
                      });
                    }),
                SizedBox(height: 20),
                CurrencyBox(
                    selectedItem: homeController.fromCurrency,
                    controller: fromText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.fromCurrency = model;
                      });
                    }),
                Container(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      homeController.convert();
                    },
                    child: Text('CALCULAR'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
