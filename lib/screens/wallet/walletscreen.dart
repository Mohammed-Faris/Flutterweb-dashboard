import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trading Wallet'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wallet Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$10,000.00',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$5,000.00',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Text(
              'Wallet Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('USD'),
              subtitle: Text('Available: \$5,000.00'),
            ),
            ListTile(
              leading: Icon(Icons.currency_bitcoin),
              title: Text('BTC'),
              subtitle: Text('Available: 2.5'),
            ),
            ListTile(
              leading: Icon(Icons.settings_ethernet),
              title: Text('ETH'),
              subtitle: Text('Available: 10.0'),
            ),
          ],
        ),
      ),
    );
  }
}
