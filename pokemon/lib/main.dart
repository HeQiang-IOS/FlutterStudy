
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon/pokemodetail.dart';
import 'package:pokemon/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


void main(List<String> args) {
  return runApp(
    MaterialApp(
      title:"Poke App",
      home: HomePage(),
      debugShowCheckedModeBanner: true,
    )
  );
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

   PokeHub pokeHub;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }   

  fetchData() {

    // async 
    // var res = await http.get(url);
   rootBundle.loadString('assets/apijson.json').then((res){
    var decodedJson = convert.jsonDecode(res);
    pokeHub = PokeHub.fromJson(decodedJson);
    print(pokeHub.toJson());

    });
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('assets/apijson.json'),
            builder: (context, snap){
              var decodedJson = convert.jsonDecode(snap.data);
              pokeHub = PokeHub.fromJson(decodedJson);
              return pokeHub == null ? Center(
            child: CircularProgressIndicator(),
          ):GridView.count(
            crossAxisCount: 2,
            children: pokeHub.pokemon.map((poke)=> Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PokeDetail(pokemon: poke)));
                },
                child: Hero(
                  tag: poke.img, 
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                         height: MediaQuery.of(context).size.width * 0.2,
                        width:
                              MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(poke.img),
                              fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text(
                          poke.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              )
            )).toList(),
          );
          },
          );
        return Scaffold(
          appBar: AppBar(
            title: Text("Poke App"),
            backgroundColor: Colors.cyan
          ),
          floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          onPressed: (){
            fetchData();
          },
          child: Icon(Icons.refresh)
          ),
          drawer: Drawer(),
          body:futureBuilder,
    );
  }
}