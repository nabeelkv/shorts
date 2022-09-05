import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shorts/widgets/external_webview.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final String type;
  final String srcName;
  final String srcUrl;
  final String srcText;
  final String created;

  const NewsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.type,
    required this.srcName,
    required this.srcUrl,
    required this.srcText,
    required this.created,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 0),
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    Image.asset('images/thumbnail-placeholder.png'),
                errorWidget: (context, url, error) =>
                    Image.asset('images/thumbnail-placeholder.png'),
              ),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 8.0),
                  decoration: const BoxDecoration(
                      color: Color(0x99212121),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    DateFormat(" MMMM d, y - h:mm a")
                        .format(DateTime.parse(created)),
                    style: const TextStyle(
                        fontFamily: 'Baloo Chettan 2',
                        color: Colors.white70,
                        fontSize: 12.0),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(title, style: textTheme.headlineMedium),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$srcName  •   ',
                    style: const TextStyle(
                      fontFamily: 'Baloo Chettan 2',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: text,
                    style: const TextStyle(
                      fontFamily: 'Baloo Chettan 2',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExternalWebView(url: srcUrl),
                ));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/more.jpeg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Text(
              srcText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Baloo Chettan 2', color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}
