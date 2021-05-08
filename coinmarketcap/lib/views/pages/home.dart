import 'package:coinmarketcap/models/coincapmarketmdoel.dart';
import 'package:coinmarketcap/models/coinmart.dart';
import 'package:coinmarketcap/services/api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Api _api = Api();
  List<CoinMart> coinmarts = [];
  @override
  void initState() {
    super.initState();
    getCoin();
  }

  getCoin() async {
    setState(() {});
    List<CoinMart> coins = await _api.getCoinList();
    coinmarts = coins;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coin Mart"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                size: 23,
                color: Colors.black,
              ),
              onPressed: null)
        ],
      ),
      body: ListView.separated(
          itemBuilder: (_, int index) {
            CoinMart coinmart = coinmarts[index];
            return ListTile(
              title: Text(coinmart.name),
              leading: CircleAvatar(
                  child: Text(
                coinmart.cmcrank.toString(),
                style: TextStyle(fontSize: 12),
              )),
              subtitle: Text(coinmart.date.substring(0, 10)),
              trailing: Text(coinmart.symbol),
            );
          },
          separatorBuilder: (_, int index) => Divider(
                height: 2,
                color: Colors.amber,
              ),
          itemCount: coinmarts.length),
    );
  }
}
// // "${FormattedDate.getFormattedDate(new DateTime.fromMicrosecondsSinceEpoch(coinmart.date))}"),
