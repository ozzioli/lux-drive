import 'package:flutter/material.dart';
import 'package:luxdrive/pages/home_page.dart';
import 'login_page.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final cpfController = TextEditingController();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  String? errorMsg;

  // Função de registro
  void register() {
    final cpf = cpfController.text.trim();
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    final pass = passController.text.trim();
    final confirmPass = confirmPassController.text.trim();

    if (cpf.isEmpty || nome.isEmpty || email.isEmpty || pass.isEmpty || confirmPass.isEmpty) {
      setState(() {
        errorMsg = "Preencha todos os campos";
      });
    } else if (pass != confirmPass) {
      setState(() {
        errorMsg = "As senhas não coincidem";
      });
    } else {
      setState(() {
        errorMsg = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cadastro realizado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
          // BACKGROUND 
          Positioned.fill(
            child: Container(
              color: const Color(0xFF161616),
            ),
          ),

          // FORMULÁRIO 
          Positioned(
            top: screenHeight * 0.20,
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

                  // CPF INPUT
                  TextField(
                    controller: cpfController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      hintText: "CPF",
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

                  // NOME DE USUÁRIO INPUT
                  TextField(
                    controller: nomeController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      hintText: "Nome de usuário",
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

                  SizedBox(height: screenHeight * 0.02),

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

                  // CONFIRMAR SENHA INPUT
                  TextField(
                    controller: confirmPassController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      hintText: "Confirmar Senha",
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

                  SizedBox(height: screenHeight * 0.03),

                  // BOTÃO REGISTRAR
                  Center(
                    child: Container(
                      width: screenWidth * 0.5, 
                      child: ElevatedButton(
                        onPressed: register,
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
                          "Registrar", 
                          style: TextStyle(
                            fontSize: screenWidth * 0.04, 
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // MENSAGEM DE ERRO
                  if (errorMsg != null)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        errorMsg!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),

                  SizedBox(height: screenHeight * 0.02),

                  // LINK LOGIN
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Já possui uma conta? ",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenWidth * 0.045, 
                        ),
                        children: [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: goToLogin, 
                              child: Text(
                                "Fazer Login",
                                style: TextStyle(
                                  color: const Color(0xFFBEA264),
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.045,
                                  decoration: TextDecoration.underline,
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
            top: screenHeight * 0.10, 
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/images/LogoLux.png",
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
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}