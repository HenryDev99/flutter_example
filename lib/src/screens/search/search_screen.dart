import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goodiez_abalone/RestApi.dart';
import 'package:goodiez_abalone/src/screens/search/screens/result_console_screen.dart';

import '../../../theme/colors.dart';
import 'widgets/keyword_list.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  const SearchScreen({
    Key? key,
    this.navigatorKey,
  }) : super(key: key);

  final GlobalKey? navigatorKey;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Nintendo'),
  Tab(text: 'Sony'),
  Tab(text: 'Microsoft'),
  Tab(text: 'Sega'),
  Tab(text: 'Other'),
];

class _SearchScreenState extends State<SearchScreen> {
  final textEditingController = TextEditingController();

  var timer;
  var _keyword = '';
  var _tempKeyword = '';
  var _nintendoResultNum = 0;
  var _sonyResultNum = 0;
  var _segaResultNum = 0;
  var _microResultNum = 0;
  var _otherResultNum = 0;
  List<dynamic> tempListCount = [];

  void _selectKeyword(String value) {
    switch (value){
      case 'Nintendo':
        setState(() {
          _tempKeyword = _keyword;
          _keyword = '';
          print(_tempKeyword);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext tabContext) {
          final TabController tabController =
              DefaultTabController.of(tabContext)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {

            }
          });
          return Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.search,
                color: AppColor.lineGray,
                size: 32,
              ),
              centerTitle: false,
              shape: const Border(
                bottom: BorderSide(
                  color: AppColor.lineGray,
                  width: 1,
                ),
              ),
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              title: TextField(
                controller: textEditingController,
                onChanged: (String keyword) {
                  setState(() {
                    _nintendoResultNum = 0;
                    _sonyResultNum = 0;
                    _segaResultNum = 0;
                    _microResultNum = 0;
                    _otherResultNum = 0;
                  });

                  if(timer != null){
                    if (timer.isActive) {
                      timer.cancel();
                    }
                  }
                  _keyword = keyword;
                  timer = Timer(
                    const Duration(seconds: 3),
                      () async {
                      tempListCount = await RestApi().searchListData(_keyword);
                      tempListCount.forEach((data) {
                        if(data['_id'].contains("Nintendo")){
                          setState(() {
                            _nintendoResultNum += data['count'] as int;
                          });
                        }
                        else if(data['_id'].contains("playStation")){
                          setState(() {
                            _sonyResultNum += data['count'] as int;
                          });
                        }
                        else if(data['_id'].contains("Xbox")){
                          setState(() {
                            _microResultNum += data['count'] as int;
                          });
                        }
                        else{
                          setState(() {
                            _otherResultNum += data['count'] as int;
                          });
                        }
                      });
                    });
                },
                decoration: const InputDecoration(
                  hintText: 'Search by console, title, etc',
                  hintStyle: TextStyle(
                    color: AppColor.lineGray,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: AppColor.darkGray,
                ),
              ),
              bottom: _keyword.isEmpty
                  ? PreferredSize(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            color: AppColor.lineGray,
                          ),
                          const TabBar(
                            isScrollable: true,
                            tabs: tabs,
                            labelColor: AppColor.primaryColor,
                            unselectedLabelColor: AppColor.defaultGray,
                          ),
                        ],
                      ),
                      preferredSize: const Size.fromHeight(50.0),
                    )
                  : null,
            ),
            body: _keyword.isEmpty
                ? TabBarView(
                    children: <ResultConsoleScreen>[
                      ResultConsoleScreen(brand: 'Nintendo', keyword: _tempKeyword),
                      ResultConsoleScreen(brand: 'Sony', keyword: _tempKeyword),
                      ResultConsoleScreen(brand: 'Microsoft', keyword: _tempKeyword),
                      ResultConsoleScreen(brand: 'Sega', keyword: _tempKeyword),
                      ResultConsoleScreen(brand: 'Other', keyword: _tempKeyword),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        KeywordList(
                          keyword: _keyword,
                          category: 'Nintendo',
                          resultNum: _nintendoResultNum,
                          onTapKeylist: _selectKeyword,
                        ),
                        KeywordList(
                          keyword: _keyword,
                          category: 'Sony',
                          resultNum: _sonyResultNum,
                          onTapKeylist: _selectKeyword,
                        ),
                        KeywordList(
                          keyword: _keyword,
                          category: 'Sega',
                          resultNum: _segaResultNum,
                          onTapKeylist: _selectKeyword,
                        ),
                        KeywordList(
                          keyword: _keyword,
                          category: 'Microsoft',
                          resultNum: _microResultNum,
                          onTapKeylist: _selectKeyword,
                        ),
                        KeywordList(
                          keyword: _keyword,
                          category: 'Other',
                          resultNum: _otherResultNum,
                          onTapKeylist: _selectKeyword,
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(16),
                        //   child: Column(
                        //     children: [
                        //       Text(
                        //         'Top Results',
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w700,
                        //           color: AppColor.darkGray,
                        //           letterSpacing: -0.5,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
