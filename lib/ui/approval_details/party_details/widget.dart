import 'package:flutter/material.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/models/agent/party/partmasterdetailsresponsebyid.dart';

class PartyDetails extends StatefulWidget {
  PartyDetails({super.key, required this.partyMasterDetailsById});

  TableData partyMasterDetailsById;

  @override
  State<PartyDetails> createState() => _PartyDetailsState();
}

class _PartyDetailsState extends State<PartyDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: List.generate(widget.partyMasterDetailsById.element.length,
            (index) {
          return Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            widget.partyMasterDetailsById.element[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: const [Text(" : ")],
                      )),
                  Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                            widget.partyMasterDetailsById.element[index].value),
                      ))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class PartyDetails2 extends StatefulWidget {
  PartyDetails2({super.key, required this.partyMasterDetailsById1});

  TableData1 partyMasterDetailsById1;

  @override
  State<PartyDetails2> createState() => _PartyDetails2State();
}

class _PartyDetails2State extends State<PartyDetails2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: List.generate(widget.partyMasterDetailsById1.element1.length,
            (index) {
          return Container(
            // color: index % 2 == 0
            //     ? Colors.blue.withOpacity(0.4)
            //     : white,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.partyMasterDetailsById1.element1[index]
                                  .title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: const [Text(" : ")],
                        )),
                    Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(widget
                              .partyMasterDetailsById1.element1[index].value),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class PartyDetailsGrid extends StatefulWidget {
  PartyDetailsGrid({super.key, required this.partyMasterDetailsGrid});

  List<Rows> partyMasterDetailsGrid;

  @override
  State<PartyDetailsGrid> createState() => _PartyDetailsGridState();
}

class _PartyDetailsGridState extends State<PartyDetailsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(children: [
        Container(
          color: MainTheme.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
                widget.partyMasterDetailsGrid[0].elements.length,
                (i) => Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            // child: Text(
                            //   widget
                            //       .partyMasterDetailsGrid[0].elements[i].title,
                            //   style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            // ),
                          )),
                    )),
          ),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                widget.partyMasterDetailsGrid.length,
                (index) => Container(
                      // color: index % 2 == 0
                      //     ? Colors.grey.withOpacity(0.4)
                      //     : MainTheme.white,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            widget
                                .partyMasterDetailsGrid[index].elements.length,
                            (i) => Expanded(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.check_box_rounded,
                                            color: MainTheme.green,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(widget
                                              .partyMasterDetailsGrid[index]
                                              .elements[i]
                                              .value),
                                        ],
                                      )),
                                )),
                      ),
                    )))
      ]),
    );
  }
}
