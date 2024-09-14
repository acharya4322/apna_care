import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Analytics'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Adherence Rate Chart
            _buildChartSection(
              context: context,
              title: 'Adherence Rate',
              chart: _buildAdherenceChart(),
            ),
            const SizedBox(height: 20),

            // Missed Doses Chart
            _buildChartSection(
              context: context,
              title: 'Missed Doses Over Time',
              chart: _buildMissedDosesChart(),
            ),
            const SizedBox(height: 20),

            // Medication Types Chart
            _buildChartSection(
              context: context,
              title: 'Medication Types Distribution',
              chart: _buildMedicationTypesChart(),
            ),
            const SizedBox(height: 20),

            // Adherence Over Time Chart
            _buildChartSection(
              context: context,
              title: 'Adherence Over Time',
              chart: _buildAdherenceOverTimeChart(),
            ),
            const SizedBox(height: 20),

            // Missed Doses by Type
            _buildChartSection(
              context: context,
              title: 'Missed Doses by Type',
              chart: _buildMissedDosesByTypeChart(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for chart section
  Widget _buildChartSection(
      {required BuildContext context,
      required String title,
      required Widget chart}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge, // Updated text theme property
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: chart,
        ),
      ],
    );
  }

  // Adherence Rate Chart
  Widget _buildAdherenceChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          _buildBarChartGroup('Week 1', 85),
          _buildBarChartGroup('Week 2', 90),
          _buildBarChartGroup('Week 3', 78),
          _buildBarChartGroup('Week 4', 92),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for BarChartGroupData
  BarChartGroupData _buildBarChartGroup(String title, double value) {
    return BarChartGroupData(
      x: title.hashCode % 4, // Ensure unique x values
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: value,
          color: Colors.blue,
          width: 15,
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }

  // Missed Doses Chart
  Widget _buildMissedDosesChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 2),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 3),
            ],
            isCurved: true,
            color: Colors.red,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Medication Types Chart
  Widget _buildMedicationTypesChart() {
    return PieChart(
      PieChartData(
        sections: [
          _buildPieChartSection('Paracetamol', 30, Colors.blue),
          _buildPieChartSection('Ibuprofen', 25, Colors.green),
          _buildPieChartSection('Vitamin D', 15, Colors.orange),
          _buildPieChartSection('Calcium', 30, Colors.red),
        ],
        sectionsSpace: 0,
        centerSpaceRadius: 40,
      ),
    );
  }

  // Helper method for PieChartSectionData
  PieChartSectionData _buildPieChartSection(
      String title, double value, Color color) {
    return PieChartSectionData(
      value: value,
      color: color,
      title: '$title\n$value%',
      titleStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      radius: 40,
    );
  }

  // Adherence Over Time Chart
  Widget _buildAdherenceOverTimeChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 80),
              FlSpot(1, 85),
              FlSpot(2, 88),
              FlSpot(3, 82),
              FlSpot(4, 90),
              FlSpot(5, 86),
            ],
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Missed Doses by Type Chart
  Widget _buildMissedDosesByTypeChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          _buildBarChartGroup('Paracetamol', 4),
          _buildBarChartGroup('Ibuprofen', 2),
          _buildBarChartGroup('Vitamin D', 5),
          _buildBarChartGroup('Calcium', 3),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
