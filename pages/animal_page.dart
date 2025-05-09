import 'package:flutter/material.dart';

class Animal {
  final String name;
  final String desc;
  final int weight;
  final String image;

  Animal({
    required this.name,
    required this.desc,
    required this.weight,
    required this.image,
  });
}

class AnimalPage extends StatelessWidget {
  AnimalPage({Key? key}) : super(key: key);

  final List<Animal> animals = [
    Animal(
      name: 'Kucing',
      desc: 'Hewan peliharaan berbulu halus dan suka bermain.',
      weight: 4,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/81_INF_DIV_SSI.jpg/220px-81_INF_DIV_SSI.jpg',
    ),
    Animal(
      name: 'Gajah',
      desc: 'Hewan darat terbesar dengan belalai panjang.',
      weight: 6000,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg',
    ),
    Animal(
      name: 'Burung Hantu',
      desc: 'Hewan malam dengan penglihatan tajam.',
      weight: 8,
      image:
          'https://th.bing.com/th/id/OIP.5LijE6EFhjn2exJynIdcYwHaGI?rs=1&pid=ImgDetMain',
    ),
    Animal(
      name: 'Ikan Paus',
      desc: 'Mamalia laut terbesar di dunia.',
      weight: 8,
      image:
          'https://th.bing.com/th/id/OIP.hYKG5dkJiYPiBEw7Z3RU-QHaE7?rs=1&pid=ImgDetMain',
    ),
    Animal(
      name: 'Anjing',
      desc: 'Hewan peliharaan yang setia.',
      weight: 8,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/6/6e/Golde33443.jpg',
    ),
    Animal(
      name: 'Panda',
      desc: 'Hewan langka pemakan bambu dari Tiongkok.',
      weight: 100,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Hewan')),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      animal.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(Icons.image_not_supported, size: 60),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(animal.desc),
                        SizedBox(height: 4),
                        Text('Berat: ${animal.weight} kg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
