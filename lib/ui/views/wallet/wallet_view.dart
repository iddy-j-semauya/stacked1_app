import 'package:flutter/material.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.of(context).size.width > 600 ? 60.0 : 25.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Malipo #3'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9FAFB),
        foregroundColor: const Color(0xFF111827),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:  () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using a Stack to place a small overlay icon on the card, if needed.
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(horizontalPadding, 16.0, horizontalPadding, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Payment Status Section
                      const Text(
                        'Hali ya Malipo #3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildStatusCard(
                        title: 'Malipo ya sasa',
                        icon: Icons.access_time,
                        color: const Color(0xFFF97316),
                      ),
                      const SizedBox(height: 24),

                      // Payment Details Section
                      const Text(
                        'Maekezo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        elevation: 1, // Optional: for a subtle shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              _buildDetailRow(
                                label: 'Utalipa:',
                                value: 'TZS 15,000',
                                valueColor: const Color(0xFF1F2937),
                              ),
                              const SizedBox(height: 12),
                              _buildDetailRow(
                                label: 'Mwisho wa kulipa:',
                                value: '22/8/2025',
                                valueColor: const Color(0xFF1F2937),
                              ),
                              const SizedBox(height: 12),
                              _buildDetailRow(
                                label: 'Faini ukichelewesha:',
                                value: '0.03% kwa siku',
                                valueColor: const Color(0xFFF97316),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Action button positioned at the bottom, separate from the Scrollable content.
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20.0),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement payment logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text(
            'Fanya Malipo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildStatusCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}