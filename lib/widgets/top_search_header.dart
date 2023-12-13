import 'package:flutter/material.dart';

class TopSearchHeader extends StatefulWidget {
  final Function(String) onChange;
  const TopSearchHeader({Key? key, required this.onChange}) : super(key: key);

  @override
  State<TopSearchHeader> createState() => _TopSearchHeaderState();
}

class _TopSearchHeaderState extends State<TopSearchHeader> {
  final _keywordController = TextEditingController();

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 245, 250, 1),
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color.fromRGBO(65, 79, 96, 0.3),
                    ),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _keywordController,
                          onChanged: widget.onChange,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: '搜索'),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
