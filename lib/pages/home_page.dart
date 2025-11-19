import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  GoogleMapController? _mapController;

  double cardHeight = 180; // card inicial (como a primeira tela)
  final double expandedHeight = 650; // card expandido (segunda tela)
  final double collapsedHeight = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // MAPA
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: const LatLng(-23.5505, -46.6333), // SP centro
              zoom: 14,
            ),
            onMapCreated: (controller) => _mapController = controller,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),

          // CARD INFERIOR
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: 0,
            left: 0,
            right: 0,
            height: cardHeight,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -5) {
                  // arrasta para cima → expandir
                  setState(() => cardHeight = expandedHeight);
                } else if (details.primaryDelta! > 5) {
                  // arrasta para baixo → recolher
                  setState(() => cardHeight = collapsedHeight);
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF141414),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // TÍTULO
                      const Text(
                        "Para onde?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // INPUT SUPERIOR
                      Container(
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF212121),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF736442)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF736442)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Rua das colinas, 34",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // INPUT INFERIOR
                      Container(
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF212121),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF736442)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.circle_outlined, color: Color(0xFF736442)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Para onde devemos ir?",
                                style: TextStyle(color: Colors.white60),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Viaje novamente",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),

                      const SizedBox(height: 14),

                      // CARD DESTINO RECOMENDADO
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF212121),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF736442)),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Edifício Santa Mônica",
                                style: TextStyle(color: Colors.white, fontSize: 16)),
                            SizedBox(height: 5),
                            Text("Rua Freire Gaspar, 212, Santa Mônica",
                                style: TextStyle(color: Colors.white54)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // CARD PROMO 1
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF736442),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Conforto garantido",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Aqui vai o luxo, segurança em primeiro lugar.",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // CARD PROMO 2
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF212121),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Color(0xFF736442)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nunca fique de fora",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Reserve sua viagem e garanta seu conforto pontual.",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),
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
