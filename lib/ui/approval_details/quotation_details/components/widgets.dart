import 'package:flutter/material.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/models/approval/quotation_details/Quotationresponse.dart';

class QuotationDetails extends StatefulWidget {
  QuotationDetails({super.key, required this.data1});

  Table1 data1;

  @override
  State<QuotationDetails> createState() => _QuotationDetailsState();
}

class _QuotationDetailsState extends State<QuotationDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: List.generate(widget.data1.element2.length, (index) {
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
                            widget.data1.element2[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                        child: Text(widget.data1.element2[index].value),
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

class QuotationDetailsGrid1 extends StatefulWidget {
  QuotationDetailsGrid1({super.key, required this.datatable1});

  List<Rows1> datatable1;

  @override
  State<QuotationDetailsGrid1> createState() => _QuotationDetailsGrid1State();
}

class _QuotationDetailsGrid1State extends State<QuotationDetailsGrid1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1200,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(children: [
          Container(
            color: MainTheme.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  widget.datatable1[0].elements.length,
                  (i) => Expanded(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                widget.datatable1[0].elements[i].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      )),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  widget.datatable1.length,
                  (index) => Container(
                        // color: index % 2 == 0
                        //     ? Colors.grey.withOpacity(0.4)
                        //     : MainTheme.white,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              widget.datatable1[index].elements.length,
                              (i) => Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Text(widget.datatable1[index]
                                                .elements[i].value),
                                          ],
                                        )),
                                  )),
                        ),
                      )))
        ]),
      ),
    );
  }
}

class QuotationDetailsGrid2 extends StatefulWidget {
  QuotationDetailsGrid2({super.key, required this.datatable2});

  List<Rows2> datatable2;

  @override
  State<QuotationDetailsGrid2> createState() => _QuotationDetailsGrid2State();
}

class _QuotationDetailsGrid2State extends State<QuotationDetailsGrid2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 500,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(children: [
          Container(
            color: MainTheme.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  widget.datatable2[0].elements1.length,
                  (i) => Expanded(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                widget.datatable2[0].elements1[i].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  widget.datatable2.length,
                  (index) => Container(
                        // color: index % 2 == 0
                        //     ? Colors.grey.withOpacity(0.4)
                        //     : MainTheme.white,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              widget.datatable2[index].elements1.length,
                              (i) => Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Text(widget.datatable2[index]
                                                .elements1[i].value),
                                          ],
                                        )),
                                  )),
                        ),
                      )))
        ]),
      ),
    );
  }
}
