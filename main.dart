import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
  StaggeredTile.extent(1, 200.0),
];

List<Widget> _tiles = const <Widget>[
  const MyItems(Icons.apps_rounded, "Docker Images", 0xfefd632b, "/first"),
  const MyItems(
      Icons.amp_stories_rounded, "Doc. running con.", 0xfef6cb3c, "/second"),
  const MyItems(
      Icons.app_registration_rounded, "Doc. all con.", 0xff3399fe, "/third"),
  const MyItems(
      Icons.amp_stories_outlined, "Docker Launch", 0xfff4c83f, "/fourth"),
  const MyItems(
      Icons.build_circle_outlined, "Docker Remove", 0xff622F74, "/fifth"),
  const MyItems(
      Icons.my_library_books_outlined, "RHEL8 Terminal", 0xff7297ff, "/sixth"),
  const MyItems(Icons.apps_rounded, "K8S all DEPLOY", 0xff622F35, "/seventh"),
  const MyItems(Icons.apps_rounded, "K8S all PODS", 0xff638F74, "/eighth"),
  const MyItems(
      Icons.amp_stories_outlined, "K8S Launch", 0xff26c83f, "/nineth"),
  const MyItems(Icons.amp_stories_rounded, "K8S expose", 0xff26c4dc, "/tenth"),
  const MyItems(
      Icons.my_library_books_outlined, "K8S Describe", 0xff1457ff, "/eleventh"),
  const MyItems(
      Icons.build_circle_outlined, "K8S Remove", 0xff801F74, "/twelveth"),
  //const _Example01Tile(Colors.blue, Icons.radio),
];

class Example01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Docker K8S with (RHEL8)'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            )));
  }
}

class MyItems extends StatelessWidget {
  const MyItems(this.icon, this.heading, this.color, this.routeName);

  final int color;
  final IconData icon;
  final String heading;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 12.0,
      shadowColor: Color(0xff2962ff),
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Text here
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            heading,
                            style: TextStyle(
                              color: new Color(color),
                              fontSize: 18.0,
                            ),
                          ),
                        ), //text

                        //icon
                        Material(
                          color: new Color(color),
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: IconButton(
                              icon: Icon(icon),
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, routeName);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]))),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kubernetes Go',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Example01(),
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen(),
        '/fifth': (context) => FifthScreen(),
        '/sixth': (context) => SixthScreen(),
        '/seventh': (context) => SeventhScreen(),
        '/eighth': (context) => EighthScreen(),
        '/nineth': (context) => NinethScreen(),
        '/tenth': (context) => TenthScreen(),
        '/eleventh': (context) => EleventhScreen(),
        '/twelveth': (context) => TwelvethScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  late String output = "";
  func() async {
    var cmd = "docker images";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show Pods"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  late String output = "";
  func() async {
    var cmd = "docker ps";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show Deploy"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreen createState() => _ThirdScreen();
}

class _ThirdScreen extends State<ThirdScreen> {
  late String output = "";
  func() async {
    var cmd = "docker ps -a";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show service"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreen createState() => _FourthScreen();
}

class _FourthScreen extends State<FourthScreen> {
  final name = TextEditingController();
  final image = TextEditingController();
  final tag = TextEditingController();
  late String output = "";
  func() async {
    cmd = "docker run -itd --name " +
        name.text +
        " " +
        image.text +
        ":" +
        tag.text;
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Launch a Container"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter container name: "),
            TextField(
              controller: name,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "myos1",
              ),
            ),
            Text("Enter image name: "),
            TextField(
              controller: image,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "httpd",
              ),
            ),
            Text("Enter tag name: "),
            TextField(
              controller: tag,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "latest",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  _FifthScreen createState() => _FifthScreen();
}

class _FifthScreen extends State<FifthScreen> {
  final id = TextEditingController();
  late String output = "";
  func() async {
    cmd = "docker rm -f " + id.text;
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Delete a container"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter container name/id: "),
            TextField(
              controller: id,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "myos1",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class SixthScreen extends StatefulWidget {
  const SixthScreen({Key? key}) : super(key: key);

  @override
  _SixthScreen createState() => _SixthScreen();
}

class _SixthScreen extends State<SixthScreen> {
  late String output = "";
  func() async {
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Linux"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("RHEL 8 terminal: "),
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "Enter command for RHEL8",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({Key? key}) : super(key: key);

  @override
  _SeventhScreen createState() => _SeventhScreen();
}

class _SeventhScreen extends State<SeventhScreen> {
  late String output = "";
  func() async {
    var cmd = "kubectl get deployments";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show K8S Deployments"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class EighthScreen extends StatefulWidget {
  const EighthScreen({Key? key}) : super(key: key);

  @override
  _EighthScreen createState() => _EighthScreen();
}

class _EighthScreen extends State<EighthScreen> {
  late String output = "";
  func() async {
    var cmd = "kubectl get pods";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    func();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show K8S Pods"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container(child: Text("$output"))],
        ),
      ),
    );
  }
}

class NinethScreen extends StatefulWidget {
  const NinethScreen({Key? key}) : super(key: key);

  @override
  _NinethScreen createState() => _NinethScreen();
}

class _NinethScreen extends State<NinethScreen> {
  final name = TextEditingController();
  final image = TextEditingController();
  late String output = "";
  func() async {
    cmd = "kubectl create deployment " + name.text + " --image=" + image.text;
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Launch a Deployment"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter Deployment name: "),
            TextField(
              controller: name,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "myos1",
              ),
            ),
            Text("Enter image name: "),
            TextField(
              controller: image,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "httpd",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class TenthScreen extends StatefulWidget {
  const TenthScreen({Key? key}) : super(key: key);

  @override
  _TenthScreen createState() => _TenthScreen();
}

class _TenthScreen extends State<TenthScreen> {
  final name = TextEditingController();
  late String output = "";
  func() async {
    cmd =
        "kubectl expose deployment " + name.text + " --port=80 --type=NodePort";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expose Deployment to 80/NodePort"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter Deployment name: "),
            TextField(
              controller: name,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "myos1",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class EleventhScreen extends StatefulWidget {
  const EleventhScreen({Key? key}) : super(key: key);

  @override
  _EleventhScreen createState() => _EleventhScreen();
}

class _EleventhScreen extends State<EleventhScreen> {
  final tag = TextEditingController();
  final name = TextEditingController();
  late String output = "";
  func() async {
    cmd = "kubectl describe " + tag.text + " " + name.text;
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Describe pod/deployment"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Enter tag name: "),
            TextField(
              controller: tag,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "pod or deployment",
              ),
            ),
            Text("Enter name: "),
            TextField(
              controller: name,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers_rounded),
                hintText: "os1",
              ),
            ),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}

class TwelvethScreen extends StatefulWidget {
  const TwelvethScreen({Key? key}) : super(key: key);

  @override
  _TwelvethScreen createState() => _TwelvethScreen();
}

class _TwelvethScreen extends State<TwelvethScreen> {
  late String output = "";
  func() async {
    cmd = "kubectl delete all --all ";
    var r = await http
        .get(Uri.http("192.168.43.247", "/cgi-bin/k8s.py", {"x": cmd}));
    //print(r.body);
    setState(() {
      output = r.body;
    });
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Delete ALL K8S"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Click on Run to delete."),
            ElevatedButton(
              onPressed: func,
              child: Text("Run"),
            ),
            Container(child: Text("$output"))
          ],
        ),
      ),
    );
  }
}
