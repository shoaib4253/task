import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FollowersBarChart extends StatelessWidget {
  final List<double> barData;
  final int totalFollowers;
  final int unfollowed;
  final double percentageChange;

  FollowersBarChart({
    required this.barData, // Data for bars
    required this.totalFollowers, // Total followers count
    required this.unfollowed, // Unfollowed count
    required this.percentageChange, // Percentage change
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Followers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Follower count and percentage
              Row(
                children: [
                  Text(
                    '${totalFollowers}K',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color:
                            percentageChange >= 0 ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      Text(
                        '${percentageChange.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color:
                              percentageChange >= 0 ? Colors.green : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Bar Chart
              SizedBox(
                height: 180, // Specify height
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            );
                            switch (value.toInt()) {
                              case 0:
                                return Text('M', style: style);
                              case 1:
                                return Text('T', style: style);
                              case 2:
                                return Text('W', style: style);
                              case 3:
                                return Text('T', style: style);
                              case 4:
                                return Text('F', style: style);
                              case 5:
                                return Text('S', style: style);
                              case 6:
                                return Text('S', style: style);
                              default:
                                return Text('', style: style);
                            }
                          },
                        ),
                      ),
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: barData.asMap().entries.map((entry) {
                      int index = entry.key;
                      double value = entry.value;
                      return BarChartGroupData(x: index, barRods: [
                        BarChartRodData(
                          toY: value,
                          color: index == 3
                              ? Colors.orange
                              : Colors.purple, // Highlight Thursday
                          width: 16,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Followers and Unfollows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '$totalFollowers',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Followers', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$unfollowed',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Unfollowed', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
