// Nome: Carlos Emanuel Monteiro Rego    ADS Turma B
// Matricula: 04185648
import 'package:flutter/material.dart';

void main() {
  runApp(GasApp());
}

class GasApp extends StatelessWidget {
  const GasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController motorController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GASAPP"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Modelo
            TextField(
              controller: modeloController,
              decoration: InputDecoration(
                labelText: "Modelo do Automóvel",
                hintText: "Modelo",
              ),
            ),

            SizedBox(height: 16),

            // Distância
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Distância (km):",
                hintText: "Distância",
              ),
            ),

            SizedBox(height: 16),

            // Motor
            TextField(
              controller: motorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Potência do Motor",
                hintText: "Motor",
              ),
            ),

            SizedBox(height: 16),

            // Valor gasolina
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor do litro da gasolina",
                hintText: "Valor",
              ),
            ),

            SizedBox(height: 30),

            // Botão Calcular
            ElevatedButton(
              onPressed: () {
                print("Calcular clicado");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("CALCULAR"),
            ),

            SizedBox(height: 10),

            // Botão Limpar
            ElevatedButton(
              onPressed: () {
                modeloController.clear();
                distanciaController.clear();
                motorController.clear();
                valorController.clear();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Limpar"),
            ),
          ],
        ),
      ),
    );
  }
}

class Automovel extends StatefulWidget {
  const Automovel({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Automovel> {
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController consumoController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GASAPP")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: modeloController,
              decoration: InputDecoration(labelText: "Modelo do Automóvel"),
            ),
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Distância (km)"),
            ),
            TextField(
              controller: consumoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Consumo (km/L)"),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Valor da gasolina"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double distancia =
                    double.tryParse(distanciaController.text) ?? 0;
                double consumo = double.tryParse(consumoController.text) ?? 0;
                double preco = double.tryParse(valorController.text) ?? 0;

                if (distancia == 0 || consumo == 0 || preco == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Preencha tudo corretamente")),
                  );
                  return;
                }

                double litros = distancia / consumo;
                double custo = litros * preco;

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Resultado"),
                    content: Text(
                      "Litros: ${litros.toStringAsFixed(2)}\n"
                      "Total: R\$ ${custo.toStringAsFixed(2)}",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      )
                    ],
                  ),
                );
              },
              child: Text("CALCULAR"),
            ),
          ],
        ),
      ),
    );
  }
}
