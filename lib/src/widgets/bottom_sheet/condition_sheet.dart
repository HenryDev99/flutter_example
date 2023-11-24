import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import 'elements/condition_list_tile.dart';

class ConditionSheet extends StatefulWidget {
  const ConditionSheet({
    Key? key,
    required this.changecondition
  }) : super(key: key);

  final Function(String) changecondition;

  @override
  State<ConditionSheet> createState() => _ConditionSheet();
}

class _ConditionSheet extends State<ConditionSheet>{
  var _isbadselect = false;
  var _isnewselect = true;
  var _isgoodselect = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.only(
            bottom: 32.0,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.0),
              topLeft: Radius.circular(24.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.lineGray,
                        ),
                      ),
                    ),
                    height: 48.0,
                    child: const Center(
                      child: Text(
                        'Condition',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.darkGray,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    left: 16.0,
                    child: InkWell(
                      child: const SizedBox(
                        height: 32,
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.defaultGray,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  widget.changecondition('bad');
                  setState(() {
                    _isbadselect = true;
                    _isgoodselect = false;
                    _isnewselect = false;
                  });
                },
                child: ConditionListTile(label: 'bad', isSelected: _isbadselect),
              ),
              GestureDetector(
                onTap: () {
                  widget.changecondition('good');
                  setState(() {
                    _isbadselect = false;
                    _isgoodselect = true;
                    _isnewselect = false;
                  });
                },
                child:ConditionListTile(label: 'good', isSelected: _isgoodselect),
              ),
              GestureDetector(
                onTap: () {
                  widget.changecondition('new');
                  setState(() {
                    _isbadselect = false;
                    _isgoodselect = false;
                    _isnewselect = true;
                  });
                },
                child: ConditionListTile(label: 'new', isSelected: _isnewselect),
              ),
            ],
          ),
        ),
      ],
    );
  }
}