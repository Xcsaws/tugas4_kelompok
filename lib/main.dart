import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Energi SDGs',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const EnergiDashboardPage(),
    );
  }
}

class EnergiDashboardPage extends StatefulWidget {
  const EnergiDashboardPage({super.key});

  @override
  State<EnergiDashboardPage> createState() => _EnergiDashboardPageState();
}

class _EnergiDashboardPageState extends State<EnergiDashboardPage> {
  // 1. State untuk Drag/Pan (Posisi Kartu)
  Offset _cardPosition = const Offset(30, 100);

  // 2. State untuk Tap (Status Sakelar Turbin)
  bool _isTurbineActive = true;

  // 3. State untuk Long Press (Detail Performa)
  bool _showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDG : Monitoring Panel Energi'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Background Info
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green),
              ),
              child: const Text(
                'Petunjuk Interaksi (NIM Ganjil):\n'
                '• Drag/Pan: Geser kartu ke mana saja.\n'
                '• Tap: Matikan / Hidupkan turbin.\n'
                '• Long Press: Tampilkan / sembunyikan detail statistik.',
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
          ),

          // Elemen Kartu Interaktif
          Positioned(
            left: _cardPosition.dx,
            top: _cardPosition.dy,
            child: GestureDetector(
              // Gesture 1: Drag / Pan
              onPanUpdate: (details) {
                setState(() {
                  _cardPosition += details.delta;
                });
              },
              // Gesture 2: Tap
              onTap: () {
                setState(() {
                  _isTurbineActive = !_isTurbineActive;
                });
              },
              // Gesture 3: Long Press
              onLongPress: () {
                setState(() {
                  _showDetail = !_showDetail;
                });
              },
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: _isTurbineActive ? Colors.white : Colors.grey[300],
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wind_power,
                            size: 40,
                            color: _isTurbineActive ? Colors.green : Colors.grey[600],
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Turbin Pembangkit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _isTurbineActive ? 'Status: AKTIF' : 'Status: NON-AKTIF',
                                style: TextStyle(
                                  color: _isTurbineActive ? Colors.green[800] : Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      // Tampilan Tambahan Jika Long Press Dipicu
                      if (_showDetail) ...[
                        const Divider(height: 24),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('📊 Statistik Real-Time:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('• Output: 2.4 MW'),
                              Text('• Efisiensi: 94.2%'),
                              Text('• Kecepatan Angin: 18 km/j'),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}