import 'package:flutter/material.dart';

class DetailBerita extends StatefulWidget {
  const DetailBerita({super.key});

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: <Widget>[
              Expanded(
                // Expanded untuk menempatkan teks di tengah
                child: Text(
                  'Tentang Berita',
                  // textAlign: TextAlign.center, // Atur teks ke tengah
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Color(0xff000000),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),




        
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 16.0, right: 24.0, left: 24.0, bottom: 46.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Image Berita
                  Image.asset(
                    'images/image_112013230.png',
                    width: 363,
                    height: 266,
                    fit: BoxFit.cover,
                  ),

                  //Konten Berita

                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Header Berita
                        Text(
                          'Trash',
                          style: TextStyle(
                            color: Color(0xFF31CD63),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'Now Google’s Bard AI Chatbot can talk & respond to visual prompts!',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '2 min ago • Jul 13, 2023, 12:31 PM GMT+5:30',
                          style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal),
                        ),

                        SizedBox(
                          height: 24,
                        ),

                        //Isi Berita
                        Text(
                          'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consectetur, obcaecati consequuntur. Porro voluptas a placeat, id eaque facilis assumenda quod ad veritatis quidem soluta sit in architecto ducimus nisi est tenetur, debitis optio nemo iure quaerat! Ipsam commodi nulla sit ex totam culpa ea, ullam enim soluta, nam repudiandae laudantium? Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consectetur, obcaecati consequuntur. Porro voluptas a placeat, id eaque facilis assumenda quod ad veritatis quidem soluta sit in architecto ducimus nisi est tenetur, debitis optio nemo iure quaerat! Ipsam commodi nulla sit ex totam culpa ea, ullam enim soluta, nam repudiandae laudantium?',
                          style: TextStyle(
                            color: Color(0xFF4E4B66),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  )
                ])));
  }
}
