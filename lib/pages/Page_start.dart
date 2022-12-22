import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:psycjfapp/widgets/colors_diary.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/textfielf_form_widget.dart';

class PageStart extends StatefulWidget {
  const PageStart({Key? key}) : super(key: key);

  @override
  State<PageStart> createState() => _PageStartState();
}

class _PageStartState extends State<PageStart> {

  late TextEditingController _queryController;
  List<_MyBook> _books = [];
  bool _pending = false;
  @override

  void initState() {
    super.initState();
    this._queryController = TextEditingController()..text = "UTEA";
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal, Colors.white70
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          title: Center(child: Text("PsyC-JF - Descubre", style: TextStyle(fontWeight: FontWeight.w500),)),
          actions: <Widget> [],
        ),
      body:Column(
        children: <Widget>[
          divider20(),
          Text("Busca algun libro para obtener detalles",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          divider10(),
          Text("Por ejemplo: 'PHP','MySQL'",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
          divider10(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFieldHistory(
                    hinText: "Buscar libro",
                    icon: Icons.search_sharp,
                    controller: this._queryController),
              ],
            )
          ),
          const SizedBox(height: 4),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.5),
                    )
                ),
                onPressed:
                _pending ? null : () => this._search(_queryController.text),
                child: const Text('Buscar'),
              ),
            ],
          ),
          Divider(thickness: 5.0,),
          if (this._books.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: this._books.length,
                itemBuilder: (ctx, i) => _bookToListTile(_books[i]),
              ),
            ),
        ],
      ),

    );
  }

  ListTile _bookToListTile(_MyBook book) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.authors),
      trailing: Hero(tag: book.id, child: book.thumbnail),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => _MyBookDetailsPage(book)),
      ),
    );
  }

  Future<List<_MyBook>> _getBooksList(String query) async {
    // Uri is a less error-prone way to repsent the URL
    final uri = Uri(
      scheme: 'https',
      host: 'www.googleapis.com',
      path: 'books/v1/volumes',
      queryParameters: {'q': query},
    );
    print('uri=$uri'); // https://www.googleapis.com/books/v1/volumes?q=$query
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return _MyBook.parseFromJsonStr(response.body);
    } else {
      throw response;
    }
  }

  Future<void> _search(String query) async {
    setState(() => this._pending = true);
    try {
      this._books = await _getBooksList(query);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Se encontró ${_books.length} libros =) ')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
    setState(() => this._pending = false);
  }
}

class _MyBook {
  final String id;
  final String title;
  final String authors;
  final String description;
  final String? thumbnailUrl;

  _MyBook(
      this.id, this.title, this.authors, this.description, this.thumbnailUrl);

  Widget get thumbnail => this.thumbnailUrl != null
      ? Image.network(this.thumbnailUrl!)
      : CircleAvatar(child: Text(this.title[0]));

  _MyBook.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] as String,
        title = jsonMap['volumeInfo']['title'] as String,
        authors = (jsonMap['volumeInfo']['authors'] as List).join(', '),
        description = jsonMap['volumeInfo']['description'] as String? ??
            '<missing description>',
        thumbnailUrl =
        jsonMap['volumeInfo']['imageLinks']['smallThumbnail'] as String?;

  static List<_MyBook> parseFromJsonStr(String jsonStr) {
    final json = jsonDecode(jsonStr);
    final jsonList = json['items'] as List<dynamic>;
    print('${jsonList.length} items in json');
    return [
      for (final jsonMap in jsonList)
        _MyBook.fromJson(jsonMap as Map<String, dynamic>)
    ];
  }
}

class _MyBookDetailsPage extends StatelessWidget {
  final _MyBook _book;

  const _MyBookDetailsPage(this._book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal, Colors.white70
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        title: Text(_book.title, style: TextStyle(fontWeight: FontWeight.w600),),
        leading: const Icon(Icons.content_paste_search_outlined,size: 40),
        actions: <Widget> [
          IconButton(onPressed: (){
            //Codigo para obtener detalles del libro

          }, icon: const Icon(Icons.expand_more_outlined,size: 35,color: Colors.black45,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Hero(
              tag: _book.id,
              child: _book.thumbnail,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_book.description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}