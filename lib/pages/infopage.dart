import 'package:flutter/material.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  TextEditingController _nameTextControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerCover(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'We Here For You',
                style: TextStyle(
                    color: ToolsUtilities.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            _infoCard(ToolsUtilities.ourVisionParagraph,"Our Vision",2),
            _infoCard(ToolsUtilities.ourMissionParagraph,"Our Mission",3),
            _contactForm(),
            _socialMediaForm()

          ],
        ),
      ),
    );
  }

  Widget _headerCover() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              color: ToolsUtilities.mainColor,
              image: DecorationImage(
                  image: NetworkImage(ToolsUtilities.imageRecipes[7]),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'About Our Recipe Community',
            style: TextStyle(
                color: ToolsUtilities.whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
  Widget _infoCard(infoParagraph,title,imageIndex){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          Card(
            child: Column(
              children: [
              Image.network(ToolsUtilities.imageRecipes[imageIndex],fit:BoxFit.cover,width: double.infinity,height: 200,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    infoParagraph,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: ToolsUtilities.secondColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget _customFormField(int maxLines,TextEditingController controller, String labelText){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hoverColor: ToolsUtilities.secondColor,
          focusColor: ToolsUtilities.secondColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ToolsUtilities.mainColor
            )
          ),
          labelText: labelText,
labelStyle: TextStyle(color: ToolsUtilities.secondColor
)      ),
      ),
    );
  }
  Widget _contactForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Contact Us',
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            children: [
              _customFormField(1,_nameTextControl,"Enter Your Name"),
              _customFormField(1,_nameTextControl,"Enter Your Email"),
              _customFormField(1,_nameTextControl,"Enter Your Phone Number"),
              _customFormField(3,_nameTextControl,"Enter Your Message Content"),
              Container(decoration: BoxDecoration(
                  color: ToolsUtilities.mainColor,
                  borderRadius: BorderRadius.circular(20)
              ),
                  child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.email,color: ToolsUtilities.whiteColor,), label: Text("Send Message",style: TextStyle(color: ToolsUtilities.whiteColor),)))
            ],
          ),
        )
      ],
    );
  }
Widget _socialMediaForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Follow Us',
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
         Icon(FontAwesomeIcons.facebook,color: ToolsUtilities.secondColor),
            Icon(FontAwesomeIcons.twitter,color: ToolsUtilities.secondColor),
            Icon(FontAwesomeIcons.instagram,color: ToolsUtilities.secondColor),
            Icon(FontAwesomeIcons.youtube,color: ToolsUtilities.secondColor),
            Icon(FontAwesomeIcons.telegram,color: ToolsUtilities.secondColor),
            Icon(FontAwesomeIcons.pinterest,color: ToolsUtilities.secondColor),
            Icon(FontAwesomeIcons.globe,color: ToolsUtilities.secondColor),
          ],
        ),
        SizedBox(height: 20,)
      ],
    );
}
}
