import 'package:apna_news/Utils/appconstants.dart';
import 'package:apna_news/Widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: commonAppBar(title: "Filter"),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: size.width * 0.3,
                  child: Column(
                    children: [
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return const SizedBox();
                          },
                          separatorBuilder: (context, index) {
                            return Container();
                          },
                          itemCount: AppConstants().attributeList.length)
                    ],
                  )),
              Expanded(child: Container())
            ],
          )
        ],
      ),
    );
  }
}
