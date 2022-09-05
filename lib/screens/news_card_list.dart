import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shorts/screens/menu_screen.dart';
import 'package:shorts/widgets/news_card.dart';

import '../models/news_model.dart';
import '../widgets/error_icon_text.dart';

class NewsCardsList extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final BuildContext nabeel;

  const NewsCardsList({
    Key? key,
    required this.categoryId,
    required this.categoryName,
    required this.nabeel,
  }) : super(key: key);

  @override
  NewsCardsListState createState() => NewsCardsListState();
}

class NewsCardsListState extends State<NewsCardsList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late bool _hasMore;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _defaultNewsPerPageCount = 10;
  late List<NewsModel> _newsList;
  final int _nextPageThreshold = 10;

  @override
  void initState() {
    super.initState();
    _hasMore = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
    _newsList = [];
    fetchNews();
  }

  Future<void> refreshNewsList() async {
    setState(() {
      _hasMore = true;
      _pageNumber = 1;
      _error = false;
      _loading = true;
      _newsList.clear();
      fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (dragDetail) {
        if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
          debugPrint("right swipe");
        } else {
          _scaffoldKey.currentState?.openDrawer();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          width: double.infinity,
          // backgroundColor: const Color(0xFF212121),
          child: MenuScreen(nabeel: context),
        ),
        // backgroundColor: const Color(0xFF212121),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Icons.menu),
          ),
          title: Text(
            widget.categoryName,
            style: const TextStyle(
                fontFamily: 'Baloo Chettan 2',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => refreshNewsList(),
              icon: const Icon(Icons.refresh_outlined),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => refreshNewsList(),
          child: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
    if (_newsList.isEmpty) {
      if (_loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(color: Color(0xFFb85148)),
        ));
      } else if (_error) {
        return Center(
          child: InkWell(
            onTap: () => setState(
              () {
                _loading = true;
                _error = false;
                fetchNews();
              },
            ),
            child: const ErrorIconText(),
          ),
        );
      }
    } else {
      return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (item) {},
        itemCount: _newsList.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _newsList.length - _nextPageThreshold) {
            fetchNews();
          }
          if (index == _newsList.length) {
            if (_error) {
              return Center(
                child: InkWell(
                  onTap: () => setState(
                    () {
                      _loading = true;
                      _error = false;
                      fetchNews();
                    },
                  ),
                  child: const ErrorIconText(),
                ),
              );
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(color: Color(0xFFb85148)),
                ),
              );
            }
          }
          final NewsModel news = _newsList[index];
          return NewsCard(
              image: news.image,
              title: news.title,
              text: news.text,
              type: news.type,
              srcName: news.srcName,
              srcUrl: news.srcUrl,
              srcText: news.srcText,
              created: news.created);
        },
      );
    }
    return Container();
  }

  Future<void> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(
          "https://nisdon2.000webhostapp.com/news/shorts.php?page=$_pageNumber&cat_id=${widget.categoryId}"));
      List<NewsModel> fetchedNews =
          NewsModel.parseList(json.decode(response.body));
      setState(
        () {
          _hasMore = fetchedNews.length == _defaultNewsPerPageCount;
          _loading = false;
          _pageNumber = _pageNumber + 1;
          _newsList.addAll(fetchedNews);
        },
      );
    } catch (e) {
      setState(
        () {
          _loading = false;
          _error = true;
        },
      );
    }
  }
}
