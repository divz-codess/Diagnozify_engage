import 'package:flutter/material.dart';
import 'package:proj2/pages/syndromedetail.dart';
import 'package:lottie/lottie.dart';

class Syndromemain extends StatefulWidget {
  const Syndromemain({Key? key}) : super(key: key);

  @override
  State<Syndromemain> createState() => _SyndromemainState();
}

class _SyndromemainState extends State<Syndromemain> {
  List syndromes = [
    {
      'Heading': 'Down Syndrome',
      'desc':
          "Down Syndrome is a genetic disorder caused when abnormal cell division results in an extra full or partial copy of chromosome 21. This extra genetic material causes the developmental changes and physical features of Down syndrome. Down syndrome varies in severity among individuals, causing lifelong intellectual disability and developmental delays. It's the most common genetic chromosomal disorder and cause of learning disabilities in children. It also commonly causes other medical abnormalities, including heart and gastrointestinal disorders.\n\nSYMPTOMS:\nEach person with Down syndrome is an individual intellectual and developmental problems may be mild, moderate or severe. Some people are healthy while others have significant health problems such as serious heart defects. Children and adults with Down syndrome have distinct facial features.\nThough not all people with Down syndrome have the same features, some of the more common features include;\n(i)Flattened face.\n(ii)Small head.\n(iii)Short neck.\n(iv)Protruding tongue.\n(v)Upward slanting eye lids (palpebral fissures).\n(vi)Unusually shaped or small ears.\n(vii)Poor muscle tone.\n(viii)Broad, short hands with a single crease in the palm.\n(ix)Relatively short fingers and small hands and feet.\n(x)Excessive flexibility.\n(xi)Short stature.\n\nCAUSES:\nHuman cells normally contain 23 pairs of chromosomes. One chromosome in each pair comes from your father, the other from your mother.Down syndrome results when abnormal cell division involving chromosome 21 occurs. These cell division abnormalities result in an extra partial or full chromosome 21. This extra genetic material is responsible for the characteristic features and developmental problems of Down syndrome.Any one of three genetic variations can cause Down syndrome\n\nTrisomy 21: About 95 percent of the time, Down syndrome is caused by trisomy 21 — the person has three copies of chromosome 21, instead of the usual two copies, in all cells. This is caused by abnormal cell division during the development of the sperm cell or the egg cell.\n\nMosaic Down syndrome: In this rare form of Down syndrome, a person has only some cells with an extra copy of chromosome 21. This mosaic of normal and abnormal cells is caused by abnormal cell division after fertilization.\n\nTranslocation Down syndrome: Down syndrome can also occur when a portion of chromosome 21 becomes attached (translocated) onto another chromosome, before or at conception. These children have the usual two copies of chromosome 21, but they also have additional genetic material from chromosome 21 attached to another chromosome.",
      'color': Colors.blue.shade400,
      'img': 'lib/ImagesApp/down-syndromecollage.jpg',
    },
    {
      'Heading': 'DiGeorge Syndrome',
      'desc':
          "DiGeorge Syndrome more accurately known by a broader term — 22q11.2 deletion syndrome — is a disorder caused when a small part of chromosome 22 is missing. This deletion results in the poor development of several body systems. The term 22q11.2 deletion syndrome covers terms once thought to be separate conditions, including DiGeorge syndrome, velocardiofacial syndrome and other disorders that have the same genetic cause,the number and severity of symptoms associated with 22q11.2 deletion syndrome vary.Signs and symptoms of DiGeorge syndrome (22q11.2 deletion syndrome) can vary in type and severity, depending on what body systems are affected and how severe the defects are. Some signs and symptoms may be apparent at birth, but others may not appear until later in infancy or early childhood.\n\nSYMPTOMS:\n(i)Heart murmur and bluish skin due to poor circulation of oxygen-rich blood (cyanosis) as a result of a heart defect.\n(ii)Frequent infections.\n(iii)Certain facial features, such as an underdeveloped chin, low-set ears, wide-set eyes or a narrow groove in the upper lip.\n(iv)A gap in the roof of the mouth (cleft palate) or other problems with the palate.\n(v)Delayed growth.\n(vi)Difficulty feeding, failure to gain weight or gastrointestinal problems.\n(vii)Breathing problems.\n(viii)Poor muscle tone.\n(ix)Delayed development, such as delays in rolling over, sitting up or other infant milestones.\n(x)Delayed speech development or nasal-sounding speech.\n(xi)Learning delays or disabilities.\n(xii)Behavior problem.\n\nCAUSES:\nEach person has two copies of chromosome 22, one inherited from each parent. If a person has DiGeorge syndrome (22q11.2 deletion syndrome), one copy of chromosome 22 is missing a segment that includes an estimated 30 to 40 genes. Many of these genes haven't been clearly identified and aren't well-understood. The region of chromosome 22 that's deleted is known as 22q11.2.The deletion of genes from chromosome 22 usually occurs as a random event in the father's sperm or in the mother's egg, or it may occur early during fetal development. Rarely, the deletion is an inherited condition passed to a child from a parent who also has deletions in chromosome 22 but may or may not have symptoms.\n\nPREVENTION:\nIn some cases, DiGeorge syndrome (22q11.2 deletion syndrome) may be passed from an affected parent to a child. If you're concerned about a family history of 22q11.2 deletion syndrome, or if you already have a child with the syndrome, you may want to consult a doctor who specializes in genetic disorders (geneticist) or a genetic counselor for help in planning future pregnancies.",
      'color': Colors.lightGreen.shade600,
    },
    {
      'Heading': 'Noonan Syndrome',
      'desc':
          "Noonan Syndrome is a genetic disorder that prevents normal development in various parts of the body. A person can be affected by Noonan syndrome in a wide variety of ways. These include unusual facial characteristics, short stature, heart defects, other physical problems and possible developmental delays.\nNoonan syndrome is caused by a genetic mutation and is acquired when a child inherits a copy of an affected gene from a parent (dominant inheritance). It can also occur as a spontaneous mutation, meaning there's no family history involved.\n\nSYMPTOMS:\n(i)Facial appearance:\n is one of the key clinical features that leads to a diagnosis of Noonan syndrome. These features may be more pronounced in infants and young children, but change with age. In adulthood, these distinct features become more subtle.\nFeatures may include the following:\n(a)Eyes are wide-set and down-slanting with droopy lids.\n(b)Irises are pale blue or green.\n(c)Ears are low-set and rotated backward.\n(d)Nose is depressed at the top, with a wide base and bulbous tip.\n(e)Mouth has a deep groove between the nose and the mouth and wide peaks in the upper lip. The crease that runs from the edge of the nose to the corner of the mouth becomes deeply grooved with age.\n(f)Teeth may be crooked; the inside roof of the mouth (palate) may be highly arched and the lower jaw may be small.\n(g)Facial features may appear coarse, but appear sharper with age. The face may appear droopy and expressionless.\n(h)Head may appear large with a prominent forehead and a low hairline on the back of the head.\n(i)Skin may appear thin and transparent with age.\n\n(ii)Heart diseases:\nMany people with Noonan syndrome are born with some form of heart defect (congenital heart disease), accounting for some of the key signs and symptoms of the disorder. Some heart problems can occur later in life.\n\n(iii)Growth issues:\nNoonan syndrome can affect normal growth. Many children with Noonan syndrome don't grow at a normal rate. Issues may include the following:\n(a)Birth weight will likely be normal, but growth slows over time.\n(b)Eating difficulties may result in inadequate nutrition and poor weight gain.\n(c)Growth hormone levels may be insufficient.\n(d)The growth spurt that's usually seen during the teenage years may be delayed. But because this disorder causes bone maturity to be delayed, growth sometimes continues into the late teens.\n\n(iv)Learning disabilities:\nIntelligence isn't affected for most people with Noonan syndrome.\n\n(v)Eye conditions:\nA common sign of Noonan syndrome is abnormalities of the eyes and eyelids.\n\n(vi)Hearing problems:\nNoonan syndrome can cause hearing deficits due to nerve issues or to structural abnormalities in the inner ear bones.\n\n(vii)Bleeding:\nNoonan syndrome can cause excessive bleeding and bruising due to clotting defects or having too few platelets.\n\n(viii)Lymphatic conditions:\nNoonan syndrome can cause problems with the lymphatic system, which drains excess fluid from the body and helps fight infection.\n\n(ix)Genital and kidney conditions:\nMany people, especially males, with Noonan syndrome can have problems with the genitals and kidneys.\n\n(x)Skin conditions:\nPeople with Noonan syndrome may have skin conditions, which most commonly are various problems that affect the colour and texture of the skin, along with curly, coarse hair or sparse hair.\n\nCAUSES:\nAutosomal dominant inheritance pattern.Noonan syndrome is caused by a genetic mutation. These mutations can occur in multiple genes. Defects in these genes cause the production of proteins that are continually active. Because these genes play a role in the formation of many tissues throughout the body, this constant activation of proteins disrupts the normal process of cell growth and division.Risk factorsA parent with Noonan syndrome has a 50 percent chance (one chance in two) of passing the defective gene on to his or her child. The child who inherits the defective gene may have fewer or more symptoms than the affected parent.\n\nPREVENTION:\nBecause some cases of Noonan syndrome occur spontaneously, there's no known way to prevent it. However, if you have a family history of this syndrome, talk to your doctor about the benefits of genetic counselling before you have children. Noonan syndrome can be detected with molecular genetic testing.If Noonan syndrome is detected early, it's possible that ongoing and comprehensive care may lessen some of its complications, such as heart disease.",
      'color': Colors.deepPurple.shade400
    },
    {
      'Heading': 'William Syndrome',
      'desc':
          '''William Syndrome is a developmental disorder that affects many parts of the body. This condition is characterized by mild to moderate intellectual disability or learning problems, unique personality characteristics, distinctive facial features, and heart and blood vessel (cardiovascular) problems.\n\nSYMPTOMS:\n(i)People with Williams syndrome typically have difficulty with visual-spatial tasks such as drawing and assembling puzzles, but they tend to do well on tasks that involve spoken language, music, and learning by repetition (rote memorization).\n(ii)Affected individuals have outgoing, engaging personalities and tend to take an extreme interest in other people. Attention deficit disorder (ADD), problems with anxiety, and phobias are common among people with this disorder.\n(iii)Young children with Williams syndrome have distinctive facial features including a broad forehead, puffiness around the eyes, a flat bridge of the nose, full cheeks, and a small chin. Many affected people have dental problems such as teeth that are small, widely spaced, crooked, or missing. Older children and adults typically have a longer face with a wide mouth and full lips.\n(iv)A form of cardiovascular disease called supravalvular aortic stenosis (SVAS) occurs frequently in people with Williams syndrome. Supravalvular aortic stenosis is a narrowing of the large blood vessel that carries blood from the heart to the rest of the body (the aorta). If this condition is not treated, the aortic narrowing can lead to shortness of breath, chest pain, and heart failure. Other problems with the heart and blood vessels, including high blood pressure (hypertension) and stiff blood vessels, have also been reported in people with Williams syndrome.\n(v)Individuals with Williams syndrome have an increased risk of complications with the use of anesthesia.\n(vi)Additional signs and symptoms of Williams syndrome include abnormalities of connective tissue (tissue that supports the body's joints and organs) such as joint problems and soft, loose skin.\n(vii)Affected people may also have increased calcium levels in the blood (hypercalcemia) in infancy,developmental delays,problems with coordination,short stature.\nMedical problems involving the eyes and vision, the digestive tract, and the urinary system are also possible.\n\nWilliams syndrome affects an estimated 1 in 7,500 to 10,000 people.\n\nCAUSES:\nWilliams syndrome is caused by the loss (deletion) of genetic material from a specific region of chromosome 7. The deleted region includes 25 to 27 genes, and researchers believe that a loss of several of these genes contributes to the characteristic features of this disorder.''',
      'color': Colors.cyan.shade400,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syndromes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade400, width: 8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('lib/ImagesApp/bluecard.json',
                          width: MediaQuery.of(context).size.width * 0.45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Text(
                              'Down Syndrome',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Know more about it here.',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Syndromedetail(
                                              bg: syndromes[0]['color'],
                                              desc: syndromes[0]['desc'],
                                              heading: syndromes[0]['Heading'],
                                              img:
                                                  'lib/ImagesApp/down-syndromecollage.jpg',
                                            )));
                              },
                              child: const Text('Read more'))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 0),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.lightGreen.shade600, width: 8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('lib/ImagesApp/greeencardd.json',
                          width: MediaQuery.of(context).size.width * 0.45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Text(
                              'DiGeorge Syndrome',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Know more about it here.',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Syndromedetail(
                                              bg: syndromes[1]['color'],
                                              desc: syndromes[1]['desc'],
                                              heading: syndromes[1]['Heading'],
                                              img:
                                                  'lib/ImagesApp/digeorgecollage.png',
                                            )));
                              },
                              child: const Text('Read more'))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 0),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.deepPurple.shade400, width: 8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('lib/ImagesApp/purplecard.json',
                          width: MediaQuery.of(context).size.width * 0.45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Text(
                              'Noonan Syndrome',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Know more about it here.',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Syndromedetail(
                                              bg: syndromes[2]['color'],
                                              desc: syndromes[2]['desc'],
                                              heading: syndromes[2]['Heading'],
                                              img:
                                                  'lib/ImagesApp/noonancollage.jpg',
                                            )));
                              },
                              child: const Text('Read more'))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan.shade400, width: 8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('lib/ImagesApp/cyancard.json',
                          width: MediaQuery.of(context).size.width * 0.45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: const Text(
                              'William Buren Syndrome',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Know more about it here.',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Syndromedetail(
                                              bg: syndromes[3]['color'],
                                              desc: syndromes[3]['desc'],
                                              heading: syndromes[3]['Heading'],
                                              img:
                                                  'lib/ImagesApp/williamburencollage.jpeg',
                                            )));
                              },
                              child: const Text('Read more'))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
