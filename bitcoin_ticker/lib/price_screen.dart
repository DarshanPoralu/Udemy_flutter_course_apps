import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  var cryptoRates;
  String selectedCurrency = 'USD';
  bool isWaiting = true;
  Map<String, String> coinValues = {};

  CoinData coinData = CoinData();


  Widget androidDropdown() {
    List<DropdownMenuItem<String>> currencyList = [];
    for (String currency in currenciesList) {
      currencyList
          .add(DropdownMenuItem(child: Text(currency), value: currency));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: currencyList,
      onChanged: (value)  {
        setState(() {
          selectedCurrency = value!;
          getData(selectedCurrency);
        });
      },
    );
  }

  void getData(String selectedCurrency) async{
      isWaiting = true;
      cryptoRates = await coinData.getData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = cryptoRates;
      });

  }

  Widget iosPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {},
      children: pickerItems,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iosPicker();
    }
    return androidDropdown();
  }

  void initState() {
    super.initState();
    getData(selectedCurrency);
  }

  Column makeCards(){
    List<Widget> cryptoCards = [];
    for(String cryptoType in cryptoList){
      cryptoCards.add(
      Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: PriceCard(
          cryptoType: cryptoType,
          currency: selectedCurrency,
          rate: isWaiting ? '?' : coinValues[cryptoType]!,
        ),
      )
      );
    }
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  PriceCard(
      {required this.cryptoType, required this.currency, required this.rate});

  final String cryptoType;
  final String currency;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoType = $rate $currency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
