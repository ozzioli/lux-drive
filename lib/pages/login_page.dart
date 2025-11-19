import 'package:flutter/material.dart';
import 'package:luxdrive/pages/welcome_page.dart';
import 'home_page.dart'; // ← IMPORTE a HomePage
import 'register_page.dart'; // ← IMPORTE a RegisterPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageLuxState();
}

class _LoginPageLuxState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  String? errorMsg;

  // Login local 
  void loginLocal() {
    final email = emailController.text.trim();
    final pass = passController.text.trim();


    if (email.isNotEmpty && pass.isNotEmpty) {
      setState(() {
        errorMsg = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login realizado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );

      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        errorMsg = "Preencha e-mail e senha";
      });
    }
  }

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Container(
              color: const Color(0xFF161616),
            ),
          ),

          // FORMULÁRIO 
          Positioned(
            top: screenHeight * 0.25, 
            left: screenWidth * 0.05, 
            right: screenWidth * 0.05, 
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.04,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.03),

                  // EMAIL INPUT
                  TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      hintText: "E-mail",
                      hintStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFBEA264)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFBEA264)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.025), 

                  // SENHA INPUT
                  TextField(
                    controller: passController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      hintText: "Senha",
                      hintStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFBEA264)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFBEA264)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02), 

                  // ESQUECEU A SENHA
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Adicionar ação para esqueceu a senha
                      },
                      child: Text(
                        "Esqueceu a senha?",
                        style: TextStyle(
                          color: const Color(0xFFBEA264), 
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02), 

                  // BOTÃO LOGIN
                  Center(
                    child: Container(
                      width: screenWidth * 0.4, 
                      child: ElevatedButton(
                        onPressed: loginLocal,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFBEA264),
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.018,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Login", 
                          style: TextStyle(
                            fontSize: screenWidth * 0.04, 
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01), 

                  // DIVISOR "OU"
                  Center(
                    child: Text(
                      "ou",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: screenWidth * 0.04, 
                      ),
                    ),
                  ),

                  // BOTÃO GOOGLE
                  Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.g_mobiledata, 
                        color:Colors.white,
                        size: screenWidth * 0.07,
                      ),
                      label: Text(
                        "Entrar com o Google",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: screenWidth * 0.048,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.012,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // MENSAGEM DE ERRO
                  if (errorMsg != null)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        errorMsg!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),

                  SizedBox(height: screenHeight * 0.01),

                  // LINK REGISTRAR
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Não possui uma conta? ",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenWidth * 0.045, 
                        ),
                        children: [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: goToRegister, 
                              child: Text(
                                "Registrar",
                                style: TextStyle(
                                  color: const Color(0xFFBEA264),
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.045,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // LOGO SOBREPONDO
          Positioned(
            top: screenHeight * 0.15, 
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/images/logoLux.png",
                height: screenHeight * 0.14, 
                fit: BoxFit.contain,
              ),
            ),
          ),

          // BOTÃO VOLTAR
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      ),
            ),
          ),
        ],
      ),
    );
  }
}