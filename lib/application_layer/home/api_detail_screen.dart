import 'package:flutter/material.dart';
import 'package:public_apis_org/data_layer/models/entries_model.dart';

class ApiDetailScreen extends StatelessWidget {
  const ApiDetailScreen({Key? key, required this.entryModel}) : super(key: key);
  final EntryModel entryModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${entryModel.api}'),
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xff5936B4),
              Color(0xff362A84),
            ]),
            borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(9),
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  'Api: ${entryModel.api}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(9),
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  'Description: ${entryModel.description}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(9),
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  'Auth type: ${entryModel.auth}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(9),
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    children: [
                      entryModel.https == true
                          ? const Icon(
                              Icons.lock,
                              size: 150,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                    spreadRadius: 8,
                                    color: Color(0xff2C3055),
                                    blurRadius: 4,
                                    offset: Offset(2, 4))
                              ],
                            )
                          : const Icon(
                              Icons.lock_open_rounded,
                              size: 150,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                    spreadRadius: 8,
                                    color: Color(0xff2C3055),
                                    blurRadius: 4,
                                    offset: Offset(2, 4))
                              ],
                            ),
                      Text(
                        'HTTPS: ${entryModel.https}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      entryModel.cors == 'yes'
                          ? const Icon(
                              Icons.settings,
                              size: 150,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                    spreadRadius: 8,
                                    color: Color(0xff2C3055),
                                    blurRadius: 4,
                                    offset: Offset(2, 4))
                              ],
                            )
                          : const Icon(
                              Icons.login_outlined,
                              size: 150,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                    spreadRadius: 8,
                                    color: Color(0xff2C3055),
                                    blurRadius: 4,
                                    offset: Offset(2, 4))
                              ],
                            ),
                      Text(
                        'Has Cors: ${entryModel.cors}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      
                      Text(
                        '${entryModel.link}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Category: ${entryModel.category}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      )),
    );
  }
}
