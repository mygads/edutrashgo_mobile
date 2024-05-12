import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduTrashgo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

class Login extends StatelessWidget {
    const Login({super.key});
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
									color: const Color(0xFF06825F),
									padding: const EdgeInsets.only( top: 64),
									width: double.infinity,
									height: double.infinity,
									child: SingleChildScrollView(
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												Container(
													margin: const EdgeInsets.only( bottom: 36, left: 35, right: 35),
													width: double.infinity,
													child: const Text(
														'Hello\nAgain!',
														style: TextStyle(
															fontSize: 46,
														),
													),
												),
												Container(
													margin: const EdgeInsets.only( bottom: 54, left: 34, right: 34),
													width: double.infinity,
													child: const Text(
														'Selamat Datang Kembali\ndi edutrashgo.com',
														style: TextStyle(
															color: Color(0xFFFFFFFF),
															fontSize: 20,
														),
													),
												),
												IntrinsicHeight(
													child: Container(
														decoration: BoxDecoration(
															border: Border.all(
																color: const Color(0xFF5E27FD),
																width: 1,
															),
															color: const Color(0xFFFFFFFF),
														),
														padding: const EdgeInsets.only( top: 93, bottom: 111, left: 33, right: 33),
														width: double.infinity,
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																Container(
																	margin: const EdgeInsets.only( bottom: 6),
																	child: const Text(
																		'Username*',
																		style: TextStyle(
																			fontSize: 14,
																		),
																	),
																),
																Container(
																	decoration: BoxDecoration(
																		border: Border.all(
																			color: const Color(0xFF4E4B66),
																			width: 1,
																		),
																		borderRadius: BorderRadius.circular(6),
																		color: const Color(0xFFFFFFFF),
																	),
																	margin: const EdgeInsets.only( bottom: 21),
																	height: 48,
																	width: double.infinity,
																	child: const SizedBox(),
																),
																Container(
																	margin: const EdgeInsets.only( bottom: 6),
																	child: const Text(
																		'Password*',
																		style: TextStyle(
																			fontSize: 14,
																		),
																	),
																),
																Container(
																	decoration: BoxDecoration(
																		border: Border.all(
																			color: const Color(0xFF4E4B66),
																			width: 1,
																		),
																		borderRadius: BorderRadius.circular(6),
																		color: const Color(0xFFFFFFFF),
																	),
																	margin: const EdgeInsets.only( bottom: 46),
																	height: 48,
																	width: double.infinity,
																	child: const SizedBox(),
																),
																IntrinsicHeight(
																	child: Container(
																		decoration: BoxDecoration(
																			borderRadius: BorderRadius.circular(6),
																			color: const Color(0xFF06C167),
																		),
																		padding: const EdgeInsets.symmetric(vertical: 19),
																		margin: const EdgeInsets.only( bottom: 10),
																		width: double.infinity,
																		child: const Column(
																			children: [
																				Text(
																					'Login',
																					style: TextStyle(
																						color: Color(0xFFFFFFFF),
																						fontSize: 16,
																					),
																				),
																			]
																		),
																	),
																),
																IntrinsicHeight(
																	child: Container(
																		margin: const EdgeInsets.only( bottom: 7),
																		width: double.infinity,
																		child: Row(
																			mainAxisAlignment: MainAxisAlignment.center,
																			children: [
																				Container(
																					color: const Color(0x40000000),
																					margin: const EdgeInsets.only( right: 8),
																					width: 140,
																					height: 1,
																					child: const SizedBox(),
																				),
																				Container(
																					margin: const EdgeInsets.only( right: 8),
																					child: const Text(
																						'atau',
																						style: TextStyle(
																							color: Color(0xFF000000),
																							fontSize: 14,
																						),
																					),
																				),
																				Container(
																					color: const Color(0x40000000),
																					width: 141,
																					height: 1,
																					child: const SizedBox(),
																				),
																			]
																		),
																	),
																),
																IntrinsicHeight(
																	child: Container(
																		decoration: BoxDecoration(
																			borderRadius: BorderRadius.circular(6),
																			color: const Color(0xFF333333),
																		),
																		padding: const EdgeInsets.symmetric(vertical: 19),
																		width: double.infinity,
																		child: const Column(
																			children: [
																				Text(
																					'Register',
																					style: TextStyle(
																						color: Color(0xFFFFFFFF),
																						fontSize: 16,
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
											],
										)
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