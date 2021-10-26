import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sheeran/arch/album.dart';
import 'package:sheeran/arch/favorite_saver.dart';
import 'package:sheeran/ui/spacing.dart';

class AlbumTile extends StatefulWidget {
  AlbumTile({
    required this.data,
    required this.index,
    required this.updateFavorites,
  }) : super(key: Key('AlbumTile-' + data.name));

  final Album data;
  final int index;
  final Function() updateFavorites;

  @override
  State<StatefulWidget> createState() => _AlbumTileState();
}

class _AlbumTileState extends State<AlbumTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey[200],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: widget.data.image,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: Space.spaceBetween(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.data.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    _date(widget.data.releaseDate),
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    '\$' + widget.data.priceUSD.round().toString(),
                  ),
                ],
                const EdgeInsets.only(bottom: 10),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                FutureBuilder<bool>(
                  initialData: false,
                  future: FavoriteSaver().isFavorited(widget.data.name),
                  builder: (c, s) {
                    bool isFavorite = false;
                    if (s.hasData) {
                      if (s.data != null) {
                        isFavorite = s.data ?? false;
                      }
                    }
                    return InkWell(
                      key: Key('Fav-${widget.data.name}'),
                      onTap: () async {
                        final fs = FavoriteSaver();
                        if (await fs.isFavorited(widget.data.name)) {
                          await fs.unfavorite(widget.data.name);
                        } else {
                          await fs.favorite(widget.data.name);
                        }
                        widget.updateFavorites();
                        setState(() {});
                      },
                      child: Icon(Icons.thumb_up,
                          color: isFavorite ? Colors.green : Colors.grey),
                    );
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      (widget.index + 1).toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _date(DateTime dateTime) {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }
}
