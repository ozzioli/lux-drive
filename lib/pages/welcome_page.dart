import 'package:flutter/material.dart';
import 'package:luxdrive/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height; // viewport height
    final w = MediaQuery.of(context).size.width;  // viewport width

    return Scaffold(
      body: Stack(
        children: [
          // ---------------------------
          // CIDADE (CAMADA MAIS BAIXA)
          // ---------------------------
          Positioned(
            top: h * 0.37, 
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/cidade.png',
              width: double.infinity,
              height: h * 0.56, 
              fit: BoxFit.cover,
            ),
          ),

          // ---------------------------
          // RETÂNGULO DOURADO (TOPO)
          // ---------------------------
          Positioned(
            top: -h * 0.1,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/retangulo.png',
              width: double.infinity,
              height: h * 0.50, 
              fit: BoxFit.cover,
            ),
          ),

          // ---------------------------
          // RETÂNGULO DE BAIXO
          // ---------------------------
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/retangulobaixo.png',
              width: double.infinity,
              height: h * 0.43, 
              fit: BoxFit.cover,
            ),
          ),

          // ---------------------------
          // TEXTOS DO TOPO
          // ---------------------------
          Positioned(
            top: h * 0.07, 
            left: w * 0.06, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Venha viajar conosco",
                  style: TextStyle(
                    fontSize: h * 0.02,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: h * 0.001),
                Text(
                  "Bem vindo",
                  style: TextStyle(
                    fontSize: h * 0.050, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ---------------------------
          // CARRO POR CIMA DO RETÂNGULO DE BAIXO
          // ---------------------------
          Positioned(
            bottom: h * 0.32, 
            right: w * 0.04, 
            child: Image.asset(
              'assets/images/carro.png',
              width: w * 0.38, 
            ),
          ),

          // ---------------------------
          // TEXTO NO RODAPÉ
          // ---------------------------
          Positioned(
            bottom: h * 0.14,
            left: w * 0.06,
            child: Text(
              "Sua viagem merece cuidado em\ncada passo",
              style: TextStyle(
                fontSize: h * 0.022,
                color: Colors.white,
              ),
            ),
          ),

          // ---------------------------
          // BOTÃO REDONDO (ElevatedButton)
          // ---------------------------
          Positioned(
            bottom: h * 0.03,
            right: w * 0.06,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(h * 0.025), // tamanho do botão
                backgroundColor: Color(0xFFBEA264), // cor dourada
                elevation: 0, // igual ao seu container original
              ),
              child: Icon(
                Icons.arrow_forward,
                size: h * 0.035,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
