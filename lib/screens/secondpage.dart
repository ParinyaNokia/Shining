import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:testgrandle/state/goldprovider.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  GoldProvider? goldget;

  @override
  void initState() {
    super.initState();
    goldget = Provider.of<GoldProvider>(context, listen: false);
    goldget?.getGoldData();
    initializeDateFormatting('th_TH', null);
  }

  String formatDate(String dateStr) {
    try {
      DateTime parsedDate = DateTime.parse(dateStr);
      return DateFormat('d MMMM yyyy', 'th_TH').format(parsedDate);
    } catch (e) {
      print('Error parsing date: $e');
      return 'Invalid date';
    }
  }

  Widget build(BuildContext context) {
    return Center(child: Consumer<GoldProvider>(
      builder: (context, getgold, child) {
        String formattedDate = '';
        if (getgold.goldData != null) {
          formattedDate = formatDate(getgold.goldData!.date);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 75,
            ),
            Row(children: [
              const Text(
                "ราคาทองวันนี้",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                  "${formattedDate} (ครั้งที่ ${getgold.goldData?.gold.announce})"),
            ]),
            const Divider(
              thickness: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    "https://kre-studio-default.sgp1.digitaloceanspaces.com/chh/static/images/chh_price_logo.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 100,
                    width: 400,
                    child: Card(
                      elevation: 15,
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "ขายออก",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            "${getgold.goldData?.gold.chhOffer.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 100,
                    child: Card(
                      elevation: 15,
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "รับซื้อ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            "${getgold.goldData?.gold.chhBid.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    "https://kre-studio-default.sgp1.digitaloceanspaces.com/chh/static/images/gta_price_logo.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 100,
                    width: 400,
                    child: Card(
                      elevation: 15,
                      color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "ขายออก",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                "${getgold.goldData?.gold.gtaOffer.toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "รับซื้อ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                "${getgold.goldData?.gold.gtaBid.toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "moving ${getgold.goldData?.gold.moving}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),
            )
          ],
        );
      },
    ));
  }
}
