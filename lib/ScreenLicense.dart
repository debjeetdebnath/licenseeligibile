import 'package:flutter/material.dart';
import 'LicenseProvider.dart';
import 'package:provider/provider.dart';

class EligibilityScreen extends StatelessWidget {
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
        create: (context) => EligibilityScreenProvider(),
        child: Builder(
            builder: (context) {

              return Scaffold(
                body: Container(
                  padding: EdgeInsets.all(16),
                  child: Form(
                      child: Consumer<EligibilityScreenProvider>(
                        builder: (context, provider, child){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (provider.isEligible == null) ?
                                    Colors.orangeAccent : provider.isEligible! ?
                                    Colors.green : Colors.redAccent
                                ),
                                height: 50,
                                width: 50,
                              ),

                              SizedBox(height: 16,),

                              TextFormField(
                                controller: ageController,
                                decoration: InputDecoration(
                                  hintText: "Give your age",
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  child: Text("Check"),
                                  onPressed: (){
                                    final int age = int.parse(ageController.text.trim());

                                    //Calling the method from provider.
                                    provider.checkEligiblity(age);
                                  },
                                ),
                              ),
                              SizedBox(height: 16,),

                              Text(provider.eligibilityMessage)

                            ],
                          );
                        },
                      )
                  ),
                ),
              );
            }
        )
    );
  }
}