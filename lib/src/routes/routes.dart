import 'package:disenios1/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenios1/src/labs/slideshow_page.dart';
import 'package:disenios1/src/pages/circular_progress_page.dart';
import 'package:disenios1/src/pages/headers_pages.dart';

final pageRoutes = <_Route>[

  _Route(FontAwesomeIcons.slideshare, 'Slishow', SlideShowPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', CircularProgressPage()),

];

class _Route {

  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
  
}