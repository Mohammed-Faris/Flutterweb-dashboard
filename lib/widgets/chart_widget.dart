import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_evaluation/bloc/bloc/watchlist/watchlist_bloc.dart';
import 'package:web_evaluation/constants/singleton.dart';

import '../constants/app_constants.dart';
import '../constants/chart_sample_data.dart';
import 'text_widget.dart';

class ChartDisplayScreen extends StatefulWidget {
  const ChartDisplayScreen({super.key});

  @override
  State<ChartDisplayScreen> createState() => _ChartDisplayScreenState();
}

class _ChartDisplayScreenState extends State<ChartDisplayScreen> {
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _chartData = SampleChartData().getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            children: [
              Expanded(
                  flex: int.parse(three.toString()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: fifteen),
                    child: TextWidget(
                      textString: sbi,
                      fontSize: sixteen,
                      fontWeight: boldfont,
                    ),
                  )),
              const VerticalDivider(),
              const Icon(Icons.draw),
              const VerticalDivider(),
              const Icon(Icons.add),
              const VerticalDivider(),
              const Icon(Icons.message),
              const VerticalDivider(),
              const Icon(Icons.remove_red_eye),
              const VerticalDivider(),
              const Icon(Icons.expand),
              const VerticalDivider(),
              Expanded(
                  flex: int.parse(one.toString()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // SingletonScaffold().isBuyButtonActive = true;
                          SingletonScaffold().openEndDrawer();
                          context
                              .read<WatchlistBloc>()
                              .add(WatchListToggled(false));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: greencolor, // Background color
                            foregroundColor: Colors.white),
                        child: const Text(buy),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // SingletonScaffold().isBuyButtonActive = false;
                          SingletonScaffold().openEndDrawer();
                          context
                              .read<WatchlistBloc>()
                              .add(WatchListToggled(true));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: redcolor, // Background color
                            foregroundColor: Colors.white),
                        child: const Text(sell),
                      )
                    ],
                  )),
            ],
          ),
        ),
        const Divider(),
        SfCartesianChart(
          legend: Legend(isVisible: true),
          trackballBehavior: _trackballBehavior,
          series: <CandleSeries>[
            CandleSeries<ChartSampleData, DateTime>(
                dataSource: _chartData,
                name: 'AAPL',
                xValueMapper: (ChartSampleData sales, _) => sales.x,
                lowValueMapper: (ChartSampleData sales, _) => sales.low,
                highValueMapper: (ChartSampleData sales, _) => sales.high,
                openValueMapper: (ChartSampleData sales, _) => sales.open,
                closeValueMapper: (ChartSampleData sales, _) => sales.close)
          ],
          primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMM(),
              majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              minimum: 70,
              maximum: 130,
              interval: 10,
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ),
      ],
    );
  }
}
