import 'package:flutter/material.dart';
import 'package:recipes_app/components/header.dart';
import 'package:recipes_app/components/menu.dart';

class MeasureConverterView extends StatelessWidget {
  const MeasureConverterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Conversor de Medidas'),
      body: SingleChildScrollView(
        // Envolve o conteúdo principal para rolagem
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Xícaras',
              items: [
                '1 XÍCARA DE CHÁ = 250 ML',
                '3/4 XÍCARA DE CHÁ = 180 ML',
                '1/2 XÍCARA DE CHÁ = 125 ML',
                '1/4 XÍCARA DE CHÁ = 60 ML',
              ],
            ),
            const Divider(color: Colors.pinkAccent),
            _buildSection(
              title: 'Colheres',
              items: [
                '1 COLHER DE SOPA = 15 ML',
                '1 COLHER DE SOBREMESA = 10 ML',
                '1 COLHER DE CHÁ = 5 ML',
                '1 COLHER DE CAFÉ = 2,5 ML',
              ],
            ),
            const Divider(color: Colors.pinkAccent),
            _buildSection(
              title: 'Farinha de Trigo',
              items: [
                '1 XÍCARA = 120 G',
                '½ XÍCARA DE CHÁ = 60 G',
                '1/3 DE XÍCARA DE CHÁ = 40 G',
                '¼ DE XÍCARA DE CHÁ = 30 G',
              ],
            ),
            const Divider(color: Colors.pinkAccent),
            _buildSection(
              title: 'Açúcar',
              items: [
                '1 XÍCARA DE CHÁ = 200 G',
                '¾ XÍCARA DE CHÁ = 135 G',
                '½ XÍCARA DE CHÁ = 100 G',
                '¼ XÍCARA DE CHÁ = 45 G',
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Menu(
          currentIndex: 0,
          onTap: (index) {
            // Adicione a lógica de navegação aqui, se necessário
          }),
    );
  }

  // Função para construir cada seção de medidas
  Widget _buildSection({required String title, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.pinkAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
