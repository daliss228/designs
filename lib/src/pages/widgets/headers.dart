import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615aab)
    );
  }
}

class HeaderBordesCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615aab),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //es el lapiz para pintar
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    //stroke es cuando son los bordes y fill para rellenar
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 1;
    final path = new Path();
    //dibujar con el path y el lapiz
    path.lineTo(0, size.height* 0.35); 
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0); 
    path.lineTo(0, 0); //linea opcional en el fill
    //moveTo es para mover la coordenada de referencia 

    //decirle a canvas que dibuje el path
    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 1;
    final path = new Path();
    
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); 
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 1;
    final path = new Path();
    
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width * 0.5, size.height * 0.4); 
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

class HeaderCurva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvaPainter(),
      ),
    );
  }
}

class _HeaderCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 1;
    final path = new Path();
    
    path.lineTo(0, size.height * 0.25);
    //1c es lugar para dar la curvatura
    //2c tamanio del radio de curvatura
    //1c - 2c lugar donde quiero el eje de curvatura
    //3c y 4c coordenada final donde termina la curvatura
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

class HeaderOnda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderOndaPainter(),
      ),
    );
  }
}

class _HeaderOndaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 1;
    final path = new Path();
    
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.40, 
      size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.75, 
      size.height * 0.10, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}