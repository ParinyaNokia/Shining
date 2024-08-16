class GoldData {
  final String date;
  final GoldDetails gold;

  GoldData({required this.date, required this.gold});

  factory GoldData.fromJson(Map<String, dynamic> json) {
    return GoldData(
      date: json['date'],
      gold: GoldDetails.fromJson(json['gold']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'gold': gold.toJson(),
    };
  }
}

class GoldDetails {
  final int gtaBid;
  final int gtaOffer;
  final int moving;
  final int announce;
  final int chhBid;
  final int chhOffer;
  final double chhUp;
  final double chhDown;
  final double pdGram;
  final double pdBid;

  GoldDetails({
    required this.gtaBid,
    required this.gtaOffer,
    required this.moving,
    required this.announce,
    required this.chhBid,
    required this.chhOffer,
    required this.chhUp,
    required this.chhDown,
    required this.pdGram,
    required this.pdBid,
  });

  factory GoldDetails.fromJson(Map<String, dynamic> json) {
    return GoldDetails(
      gtaBid: json['gta_bid'],
      gtaOffer: json['gta_offer'],
      moving: json['moving'],
      announce: json['announce'],
      chhBid: json['chh_bid'],
      chhOffer: json['chh_offer'],
      chhUp: json['chh_up'],
      chhDown: json['chh_down'],
      pdGram: json['pd_gram'],
      pdBid: json['pd_bid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gta_bid': gtaBid,
      'gta_offer': gtaOffer,
      'moving': moving,
      'announce': announce,
      'chh_bid': chhBid,
      'chh_offer': chhOffer,
      'chh_up': chhUp,
      'chh_down': chhDown,
      'pd_gram': pdGram,
      'pd_bid': pdBid,
    };
  }
}
