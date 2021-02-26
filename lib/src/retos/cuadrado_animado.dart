import 'package:flutter/material.dart';

class CuadradoAnimado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: CuadradoAnimadoPage(),
        ),
      ),
    );
  }
}

class CuadradoAnimadoPage extends StatefulWidget {

  @override
  _CuadradoAnimadoPageState createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  Animation<double> moverDerecha;
  Animation<double> moverIzquierda;
  Animation<double> moverArriba;
  Animation<double> moverAbajo;

  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500)
    );

    moverDerecha = Tween(begin: 0.0, end: 130.0)
                  .animate(CurvedAnimation(
                    parent: controller, 
                    curve: Interval(0, 0.25, 
                    curve: Curves.bounceOut)));
    
    moverArriba = Tween(begin: 0.0, end: -130.0)
                  .animate(CurvedAnimation(
                    parent: controller, 
                    curve: Interval(0.25, 0.5, 
                    curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -130.0)
                    .animate(CurvedAnimation(
                      parent: controller, 
                      curve: Interval(0.5, 0.75, 
                      curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 130.0)
                  .animate(CurvedAnimation(
                    parent: controller, 
                    curve: Interval(0.75, 1.0, 
                    curve: Curves.bounceOut)));
    
    /*controller.addListener((){
      if(controller.status == AnimationStatus.completed){
        controller.reset();
      }
    });*/

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    
    return AnimatedBuilder(
      animation: controller, 
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child){
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
          child: child
        );
      }
    );
  }
  
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}
