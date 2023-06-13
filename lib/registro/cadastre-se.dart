import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lovers_ai_to_kanjo/swipeMainTela/mainTelaApp.dart';

class Cadastrese extends StatefulWidget {
  const Cadastrese({super.key});

  @override
  State<Cadastrese> createState() => _CadastreseState();
}

class _CadastreseState extends State<Cadastrese> {
  String Name = '';
  String idade = '';
  String Email = '';
  String Senha = '';
  String generoSelecionado = '';
  String GeneroProcura = '';
  bool masculino = false;
  bool Feminino = false;
  bool masculinoprocura = false;
  bool Femininoprocura = false;
  bool selecionadoGenero = false;
  bool selecionadoGeneroprocura = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  onChanged: (valor){
                    Name = valor;
                    //Mudou mandou para a String

                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Nome',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (valor){
                    idade = valor;
                    //Mudou mandou para a String

                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Idade',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (valor){
                    Email = valor;
                    //Mudou mandou para a String

                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (valor){
                    Senha = valor;
                    //Mudou mandou para a String

                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Senha',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Seu genero'
                )
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child:               Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      title: Text(
                        'Masculino',
                      ),
                      value: masculino,
                      onChanged: (value) {
                        setState(() {
                          if(value == true){
                            generoSelecionado = 'Masculino';
                            selecionadoGenero = true;
                            masculino = true;
                            Feminino = false;
                          }
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Feminino'
                      ),
                      value: Feminino,
                      onChanged: (value) {
                        setState(() {
                          if(value == true){
                            generoSelecionado = 'Feminino';
                            selecionadoGenero = true;
                            masculino = false;
                            Feminino = true;
                          }

                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      'Estou procurando'
                  )
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child:               Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      title: Text(
                        'Um Homem',
                      ),
                      value: masculinoprocura,
                      onChanged: (value) {
                        setState(() {
                          if(value == true){
                            GeneroProcura = 'Masculino';
                            selecionadoGeneroprocura = true;
                            masculinoprocura = true;
                            Femininoprocura = false;
                          }
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      title: Text(
                          'Uma mulher'
                      ),
                      value: Femininoprocura,
                      onChanged: (value) {
                        setState(() {
                          if(value == true){
                            GeneroProcura = 'Feminino';
                            selecionadoGeneroprocura = true;
                            masculinoprocura = false;
                            Femininoprocura = true;
                          }

                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () async {

                      if(Name == ''){
                        Fluttertoast.showToast(
                            msg: "O campo de nome está vazio!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else{
                        if(idade == ''){
                          Fluttertoast.showToast(
                              msg: "O campo de idade está vazio!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }else{
                          if(Email == ''){
                            Fluttertoast.showToast(
                                msg: "O campo de Email está vazio!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }else{
                            if(Senha == ''){
                              Fluttertoast.showToast(
                                  msg: "O campo de Senha está vazio!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }else{
                              if(selecionadoGenero == false){
                                Fluttertoast.showToast(
                                    msg: "Selecione um genero!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else{
                                if(selecionadoGeneroprocura == false){
                                  Fluttertoast.showToast(
                                      msg: "Selecione um que você se atrai!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }else{

                                  Position currentPosition = await Geolocator.getCurrentPosition(
                                    desiredAccuracy: LocationAccuracy.high,
                                  );

                                  List<Placemark> placemarks = await placemarkFromCoordinates(
                                    currentPosition.latitude,
                                    currentPosition.longitude,
                                  );
                                  Placemark placemark = placemarks.first;

                                  String LocalizacaoAgora = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';

                                  String Latitude = '${currentPosition.latitude}';
                                  String longitude = '${currentPosition.longitude}';

                                  //TODO CADASTRO
                                  _auth.createUserWithEmailAndPassword(email: Email, password: Senha).whenComplete((){
                                    var UID = FirebaseAuth.instance.currentUser?.uid;

                                    FirebaseFirestore.instance.collection('Usuarios').doc(UID).set({
                                      'Nome': Name,
                                      'Idade': int.parse(idade),
                                      'Email': Email,
                                      'Genero': generoSelecionado,
                                      'GeneroProcura': GeneroProcura,
                                      'Latitude': Latitude,
                                      'Longitude': longitude,
                                      'Localizacao': LocalizacaoAgora,
                                    });
                                  }).then((value){
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context){
                                          return const MainTelaRoleta();
                                        }));
                                  });
                                }
                              }
                            }
                          }
                        }
                      }

                    },
                    child: const Text('Criar conta'),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
