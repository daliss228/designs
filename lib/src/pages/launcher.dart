import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenios1/src/theme/theme.dart';
import 'package:disenios1/src/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disenios'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, i ) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (BuildContext context, i ) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChanger>(context);
    final accentColor = themeChanger.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                //padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('FH', style: TextStyle(fontSize: 50))
                )
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              trailing: Switch.adaptive(
                value: themeChanger.darkTheme, 
                activeColor: accentColor,
                onChanged: (value){
                  themeChanger.darkTheme = value;
                }
              ),
              leading: Icon(Icons.lightbulb_outline, color: accentColor,),
              title: Text('Dark Mode'),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                trailing: Switch.adaptive(
                  value: themeChanger.customTheme, 
                  activeColor: accentColor,
                  onChanged: (value){
                    themeChanger.customTheme = value;
                  }
                ),
                leading: Icon(Icons.add_to_home_screen, color: accentColor,),
                title: Text('Custom Theme')
              ),
            )
          ],
        ),
      ),
    );
  }
}