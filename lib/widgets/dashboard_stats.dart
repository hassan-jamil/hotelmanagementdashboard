import 'package:flutter/material.dart';

class DashboardStats extends StatelessWidget {
  final int availableRooms;
  final int occupiedRooms;
  final int availableBookings;

  const DashboardStats({
    super.key,
    required this.availableRooms,
    required this.occupiedRooms,
    required this.availableBookings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStatCard(
          title: "Available Rooms",
          value: availableRooms.toString(),
          color: const Color(0xFF007BFF), // Blue
        ),
        const SizedBox(height: 12),
        _buildStatCard(
          title: "Occupied Rooms",
          value: occupiedRooms.toString(),
          color: const Color(0xFF001A2C), // Dark Navy
        ),
        const SizedBox(height: 12),
        _buildStatCard(
          title: "Available Bookings",
          value: availableBookings.toString(),
          color: const Color(0xFF00A676), // Green
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
