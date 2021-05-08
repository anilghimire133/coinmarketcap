class CoinMart {
  int id;
  String name;
  String date;
  String symbol;
  int cmcrank;
  String price;
  CoinMart(
      {this.id, this.name, this.date, this.symbol, this.cmcrank, this.price});
  CoinMart.fromJson(Map<String, dynamic> coin) {
    this.id = coin['id'];
    this.date = coin['date_added'] ?? '';
    this.name = coin['name'] ?? '';
    this.symbol = coin['symbol'] ?? '';
    this.cmcrank = coin['cmc_rank'] ?? '';
    this.price = coin['price'] ?? '';
  }

  
}