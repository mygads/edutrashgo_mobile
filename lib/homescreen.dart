import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
				child: Container(
					constraints: const BoxConstraints.expand(),
					color: const Color(0xFFFFFFFF),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Expanded(
								child: Container(
									color: const Color(0xFFFFFFFF),
									width: double.infinity,
									height: double.infinity,
									child: Stack(
										children: [
											Padding(
												padding: const EdgeInsets.only( top: 53),
												child: SingleChildScrollView(
													scrollDirection: Axis.horizontal,
													child: Row(
														crossAxisAlignment: CrossAxisAlignment.start,
														children: [
															IntrinsicHeight(
																child: SizedBox(
																	width: 390,
																	child: Stack(
																		children: [
																			Column(
																				crossAxisAlignment: CrossAxisAlignment.start,
																				children: [
																					Container(
																						padding: const EdgeInsets.only( top: 78, bottom: 92, right: 12),
																						height: 219,
																						width: double.infinity,
																						decoration: const BoxDecoration(
																							image: DecorationImage(
																								image: NetworkImage("https://i.imgur.com/1tMFzp8.png"),
																								fit: BoxFit.cover
																							),
																						),
																						child: Column(
																							crossAxisAlignment: CrossAxisAlignment.start,
																							children: [
																								Container(
																									margin: const EdgeInsets.only( bottom: 3, left: 251),
																									child: const Text(
																										'EDU TRASHGO',
																										style: TextStyle(
																											color: Color(0xFFFFFFFF),
																											fontSize: 18,
																										),
																									),
																								),
																								Container(
																									margin: const EdgeInsets.only( left: 142),
																									width: double.infinity,
																									child: const Text(
																										'Solusi belajar menyenangkan untuk mencintai lingkungan',
																										style: TextStyle(
																											color: Color(0xFFFFFFFF),
																											fontSize: 14,
																										),
																										textAlign: TextAlign.right,
																									),
																								),
																							]
																						),
																					),
																				]
																			),
																			Positioned(
																				top: 0,
																				left: 0,
																				right: 0,
																				height: 59,
																				child: Container(
																					color: const Color(0xFF333333),
																					padding: const EdgeInsets.only( left: 21, right: 21),
																					transform: Matrix4.translationValues(0, -53, 0),
																					height: 59,
																					width: double.infinity,
																					child: Column(
																						crossAxisAlignment: CrossAxisAlignment.start,
																						children: [
																							IntrinsicHeight(
																								child: Container(
																									margin: const EdgeInsets.only( top: 14),
																									width: double.infinity,
																									child: Row(
																										children: [
																											SizedBox(
																												width: 125,
																												height: 31,
																												child: Image.network(
																													'https://i.imgur.com/1tMFzp8.png',
																													fit: BoxFit.fill,
																												)
																											),
																											const Expanded(
																												child: SizedBox(
																													width: double.infinity,
																													child: SizedBox(),
																												),
																											),
																											SizedBox(
																												width: 25,
																												height: 25,
																												child: Image.network(
																													'https://i.imgur.com/1tMFzp8.png',
																													fit: BoxFit.fill,
																												)
																											),
																										]
																									),
																								),
																							),
																						]
																					),
																				),
																			),
																		]
																	),
																),
															),
															const SizedBox(
																width: 0,
																height: double.infinity,
																child: SizedBox(),
															),
														],
													)
												),
											),
										]
									),
								),
							),
						],
					),
				),
			),
        );
    }
}