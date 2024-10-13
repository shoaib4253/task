import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GenderPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
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
                'Gender',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Pie Chart with outer percentage circles
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 180, // Bound the size of the chart
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius:
                            48, // Space in the middle for the emoji
                        sections: [
                          PieChartSectionData(
                            value: 58, // Female Percentage
                            color: Colors.yellow,
                            radius:
                                26, // Narrower radius to make the segments thinner
                            title: '',
                            borderSide: BorderSide(
                              color: Colors.white, // Border color
                              width: 3, // Border thickness
                            ),
                          ),
                          PieChartSectionData(
                            value: 42, // Male Percentage
                            color: Colors.purple,
                            radius: 26, // Thinner segments
                            title: '',
                            borderSide: BorderSide(
                              color: Colors.white, // Border color
                              width: 5, // Border thickness
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Center Emoji
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Text(
                      '👧', // Emoji in the center
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  // Percentage circle for 58% (Female)
                  Positioned(
                    top: 20, // Adjust position
                    right: 45,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '58%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Percentage circle for 42% (Male)
                  Positioned(
                    bottom: 20, // Adjust position
                    left: 45,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '42%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Gender labels (Male and Female)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.purple, size: 12),
                      SizedBox(width: 4),
                      Text(
                        'Male: 352k',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.yellow, size: 12),
                      SizedBox(width: 4),
                      Text(
                        'Female: 834k',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
