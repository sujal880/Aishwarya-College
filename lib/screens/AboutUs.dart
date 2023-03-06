import 'package:flutter/material.dart';
class Aboutus extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: 'Aishwarya College of Education',
                  style: TextStyle(color: Colors.black, fontSize: 23,fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: ' was established with the aim of providing education to the greatest standard through value based teaching and learning and build a platform for the students to explore their creative potential and nurture the spirit of critical thinking. In year 1999 under the aegis of Gayatri Technical Education Trust, (Affiliated to Jai Narain Vyas University (JNVU) Jodhpur and approved under section 2(f) and 12(B) of UGC Act 1956) is one of the leading college in the entire western Rajasthan region. The college has been accredited by NAAC (An Autonomous Institution of UGC) additionally, to add to its academic journey, it has been a recipient of some exceptionally prestigious awards for best practice and outstanding contribution in the field of higher education.',
                        style: TextStyle(color: Colors.black54, fontSize: 20)
                    ),
                    TextSpan(text: '\n\nThe college is also focusing on skill enhancement of the students with practical oriented learning, therefore college have reorganization from UGC for imparting skills education in different segments to develop the skills of the students as per the requirements of local Industries.',
                        style: TextStyle(fontSize: 20,color: Colors.black54)
                    ),
                    TextSpan(text: '\n\nThe college is committed to educate the students and make them capable for ready to move, acclimatize, and lead inconnected world. The college through its experienced and qualified faculty continually innovates education techniques to make sure to fulfill the requirements of students & professional world.',
                        style: TextStyle(fontSize: 20,color: Colors.black54)
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
