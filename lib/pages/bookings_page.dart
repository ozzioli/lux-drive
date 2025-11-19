import 'package:flutter/material.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height; 
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TÍTULO
            Text(
              "Agendamentos",
              style: TextStyle(
                color: Colors.white,
                fontSize: h * 0.035,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: h * 0.03),

            // =========================================
            // PRIMEIRO AGENDAMENTO (COM MAPA)
            // =========================================
            Container(
              height: h * 0.34,
              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.circular(h * 0.015),
                border: Border.all(color: const Color(0xFF9C7D48), width: 1),
              ),
              child: Stack(
                children: [
                  // MAPA (placeholder)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: h * 0.17,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(h * 0.015),
                        ),
                      ),
                    ),
                  ),

                  // Conteúdo
                  Positioned(
                    top: h * 0.19,
                    left: w * 0.04,
                    right: w * 0.04,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CARRO — quadrado com borda
                            Container(
                              width: h * 0.06,
                              height: h * 0.06,
                              padding: EdgeInsets.all(h * 0.012),
                              child: Image.asset(
                                "assets/images/car.png",
                                width: h * 0.03,
                              ),
                            ),

                            SizedBox(width: w * 0.03),

                            // AGORA É UMA COLUNA BONITINHA
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rua das colinas, 34",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: h * 0.018,
                                  ),
                                ),
                                SizedBox(height: h * 0.004),
                                Text(
                                  "17 Out, 18:20\nR\$18,21",
                                  style: TextStyle(
                                    color: const Color(0xFFAAAAAA),
                                    fontSize: h * 0.016,
                                  ),
                                ),
                                SizedBox(height: h * 0.004),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.007),

                        // BOTÃO REAGENDAR
                        Container(
                          height: h * 0.04,
                          width: h * 0.15,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(h * 0.01),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/circle.png", width: h * 0.018),
                              SizedBox(width: w * 0.015),
                              Text(
                                "Reagendar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.017,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.04),

            // LISTA
            _bookingItem("Condomínio Residencial Suzano", h, w),
            SizedBox(height: h * 0.03),
            _bookingItem("Condomínio Flex", h, w),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ITEM DO AGENDAMENTO (REUTILIZÁVEL)
  // ============================================================
    Widget _bookingItem(String title, double h, double w) {
      return Stack(
        children: [
          // ============================
          // CARD (FUNDO)
          // ============================
          Container(
            height: h * 0.12,
            width: w * 0.9,
            margin: EdgeInsets.only(left: w * 0.20),
            decoration: BoxDecoration(
              color: const Color(0xFF141414),
              borderRadius: BorderRadius.circular(h * 0.015),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: w * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TÍTULO — AGORA QUEBRA LINHA AUTOMÁTICA
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: w * 0.55, // LIMITE DE LARGURA DO TEXTO
                    ),
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: h * 0.018,
                        height: 1.2,
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.012),

                  // BOTÃO REAGENDAR
                  Container(
                    height: h * 0.04,
                    width: h * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(h * 0.01),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/circle.png", width: h * 0.018),
                        SizedBox(width: w * 0.015),
                        Text(
                          "Reagendar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: h * 0.017,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============================
          // QUADRADO DO CARRO
          // ============================
          Positioned(
            top: h * 0.018,
            left: 0,
            child: Container(
              width: h * 0.075,
              height: h * 0.075,
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.circular(h * 0.015),
                border: Border.all(
                  color: const Color.fromARGB(107, 180, 180, 180),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(h * 0.015),
              child: Image.asset("assets/images/car.png"),
            ),
          ),
        ],
      );
    }
}
