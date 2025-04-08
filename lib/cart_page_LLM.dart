import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatPrice(int price) {
  return NumberFormat('#,###').format(price);
}

class CartPageLLM extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'name': 'Item#1', 'price': 10000},
    {'name': 'Item#2', 'price': 5000},
    {'name': 'Item#3', 'price': 30000},
    {'name': 'Item#4', 'price': 40000},
    {'name': 'Item#5', 'price': 50000},
    {'name': 'Item#6', 'price': 60000},
    {'name': 'Item#7', 'price': 30000},
    {'name': 'Item#8', 'price': 20000},
    {'name': 'Item#9', 'price': 10000},
    {'name': 'Item#10', 'price': 140000},
    {'name': 'Item#11', 'price': 150000},
    {'name': 'Item#12', 'price': 50000},
    {'name': 'Item#13', 'price': 150000},
    {'name': 'Item#14', 'price': 170000},
    {'name': 'Item#15', 'price': 200000},
    {'name': 'Item#16', 'price': 300000},
  ];

  int getTotalPrice() {
    return items.fold(
      0,
      (sum, item) => sum + (item['price'] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = getTotalPrice();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text('For Running'),
            Expanded(
              child: ListView(
                children:
                    items
                        .map(
                          (item) => Column(
                            children: [
                              MagyoListItem(
                                item['name'],
                                item['price'],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                child: Row(
                  children: [
                    Text(
                      '총 가격',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      formatPrice(totalPrice),
                    ), // 기존 '$totalPrice' 수정
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(
                          '정말로 결제할 건가요?',
                        ),
                        content: Text(
                          '구매한 아이템 목록',
                        ),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pop();
                            },
                            child: Text('취소'),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction:
                                true,
                            onPressed: () {},
                            child: Text('확인'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    0xFF409c74,
                  ),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  '결제 하기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MagyoListItem extends StatelessWidget {
  MagyoListItem(this.itemName, this.itemPrice);

  final String itemName;
  final int itemPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  '이름',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(itemName),
              ],
            ),
            Row(
              children: [
                Text(
                  '가격',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  formatPrice(itemPrice),
                ), // 기존 itemPrice.toString() 수정
              ],
            ),
          ],
        ),
      ),
    );
  }
}
