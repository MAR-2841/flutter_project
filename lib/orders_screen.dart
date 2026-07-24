import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> orders = [
      {"id": "ORD-7721", "status": "Delivered", "date": "Oct 12, 2023", "total": "\$120.00"},
      {"id": "ORD-5542", "status": "Processing", "date": "Oct 14, 2023", "total": "\$45.50"},
      {"id": "ORD-1209", "status": "Shipped", "date": "Oct 13, 2023", "total": "\$89.99"},
      {"id": "ORD-0032", "status": "Cancelled", "date": "Sep 30, 2023", "total": "\$15.00"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order["id"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      _buildStatusBadge(order["status"]!),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                          Text(order["date"]!, style: const TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Total", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                          Text(order["total"]!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status) {
      case "Delivered": color = Colors.green; break;
      case "Processing": color = Colors.orange; break;
      case "Shipped": color = Colors.blue; break;
      case "Cancelled": color = Colors.red; break;
      default: color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
