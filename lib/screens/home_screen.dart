import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double result = 0;
  String resultText = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text('BMI Calculator',
        style: TextStyle(color: Colors.yellow,fontSize: 25.0,fontWeight: FontWeight.w300,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 200,),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _heightController,
                      style: const TextStyle(color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Height(m)',
                        hintStyle: TextStyle(color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ),
                  const SizedBox(height: 200,),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _weightController,
                      style: const TextStyle(color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Weight(kg)',
                        hintStyle: TextStyle(color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  )
                ],
              ),
              const SizedBox(height: 30,),


              Material(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(changeButton?50:8),
                child: InkWell(
                  onTap: ()async {
                    double height = double.parse(_heightController.text);
                    double weight = double.parse(_weightController.text);
              
                    setState(() {
                      result = weight / (height * height);
                      if (result < 18.5) {
                        resultText = "You are Underweight";
                      } else if (result >= 18.5 && result < 25) {
                        resultText = "Your are Normal";
                      } else if (result >= 25 && result < 30) {
                        resultText = "You are Overweight";
                      } else if (result >= 30) {
                        resultText = "You are Obese";
                      }
                    });
                    setState(() {
                      changeButton = true;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changeButton?50:200,
                    height: 50,
                    alignment: Alignment.center,
                    
                      // ignore: prefer_const_constructors
                      child:changeButton?Icon(Icons.done,color: Colors.black,):
                      const Text('Calculate',
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      ),
                      ),
                    ),
                    ),
              ),

              const SizedBox(height: 100,),

              // ignore: prefer_const_constructors
              Text(result.toStringAsFixed(2),style: TextStyle(
                color: Colors.white,
                fontSize:100,
                fontWeight: FontWeight.w400,
              ),
              ),

              const SizedBox(height: 50,),

              Visibility(
                visible: resultText.isNotEmpty,
                // ignore: prefer_const_constructors
                child: Text(resultText,style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
                ),
              ),

              const SizedBox(height: 50,),

              // ignore: avoid_unnecessary_containers
              InkWell(
                onTap: () {
                  setState(() {
                    _heightController.clear();
                    _weightController.clear();
                    result = 0;
                    resultText = "";
                  });
                  setState(() {
                    changeButton = false;
                  });
                },
                // ignore: avoid_unnecessary_containers
                child: Container( 
                  child: const Text('Clear',style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ),
              )
          ],
        ),
      )
    );
  }
}