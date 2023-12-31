//number const

import 'package:flutter/material.dart';

const double zero = 0;
const double pointtwo = 0.2;
const double one = 1;
const double two = 2;
const double three = 3;
const double four = 4;
const double five = 5;
const double six = 6;
const double eight = 8;
const double ten = 10;
const double fourteen = 14;
const double fifteen = 15;
const double sixteen = 16;
const double eighteen = 18;
const double twenty = 20;
const double twentyone = 21;
const double twentyfive = 25;
const double thirty = 30;
const double fourty = 40;
const double fourtytwo = 42;
const double fifty = 50;
const double sixty = 60;
const double oneten = 110;
const double twohundred = 200;
const double threehundred = 300;

//login page
const String signin = "Sign in";
const String email = "email";
const String username = "User Name";
const String loginsuccessful = "Login successful";
const String emailvalidationmessage = "Please Enter Email Address";
const String password = "Password";
const String passwordvalidation = "Please Enter Password";
const String passwordkeyboardtype = "any";
const String login = "Login";
const String authToken = "authToken";

//common
const String sbi = "SBI";
const String socketExcep = "Socket Exception";
const String dashboardwebapplication = 'Dashboard Web Application';

//appscaffold
const String watchlist = "watchlist";
const String orders = "orders";
const String wallet = "wallet";

//routes
const String loginroute = "/login";
const String watchlistroute = "/watchlist";
const String orderroute = "/orders";
const String walletroute = "/wallet";

//watchlist

const String buy = "Buy";
const String sell = "Sell";
const String contactliststring = "contactlist";
const String logout = 'Logout';
const String cancel = 'cancel';
const String logoutconfirmation = 'Are you sure to logout?';

//watchlistbloc
const String nodatafound = "No Data Found";

//imagepath

const String imagespath = "lib/assets/images/";
const String watchlistloc = "${imagespath}watchlist_select_dark@3x.png";
const String orderloc = "${imagespath}orders_select_dark@3x.png";
const String walletloc = "${imagespath}portfolio_select_dark@3x.png";
const String logoutloc = "${imagespath}logout.svg";
const String sbibanner = "${imagespath}sbi_banner.png";
const String settings = "${imagespath}settings.svg";
const String networkimageloc =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbXzqZwlbLCY-mzcUNodOqeVF-rpSb9KE0WEB6OtgxtHibeANXK2Hzw_y9GMNPpX9Orb0&usqp=CAU";

//color

const Color blackcolor = Colors.black;
const Color greycolor = Colors.grey;
const Color whitecolor = Colors.white;

Color deeppurpleShade50 = Colors.deepPurple.shade50;
const Color deeppurple = Colors.deepPurple;
const Color redcolor = Colors.red;
const Color greencolor = Colors.green;
const Color white30 = Colors.white30;
const Color backcolor = Color.fromARGB(241, 241, 246, 255);
const Color secondarycolor = Color(0xFFFFFFFF);
const Color primarycolor = Color(0xFF5E50AD);

//font weight

FontWeight boldfont = FontWeight.bold;

//
const String sbin = "SBIN";
const String statebankofindia = "STATE BANK OF INDIA";
const String nse = "NSE";

//overlayproducts

const String stkprice = "149.00";
const String stkpricechanges = "3.00(+1.80%)";
const String product = "Product";
const String paytodp = "Pay full and get share in your DP account";
const String delivery = "Delivery";
const String intraday = "Intraday";
const String emargin = 'E-Margin';
const String cover = "Cover";
const String quantity = "Quantity";
const String price = 'Price';
const String mktPrice = "Mkt Price";
const String disclosedqty = 'Disclosed Quantity';
const String stplosstriggerprice = "Stoploss Trigger Price";
const List overlayproduct = [delivery, intraday, emargin, cover];

// tabs
const String overview = "Overview";
const String technical = "Technical";
const String futures = 'Futures';
const String options = "Options";
const String news = "News";

List<Tab> tablist = [
  const Tab(text: overview),
  const Tab(text: technical),
  const Tab(text: futures),
  const Tab(text: options),
  const Tab(text: news),
];

TabBarView tabbarview = TabBarView(children: [
  Row(
    children: [
      Expanded(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Market Depth',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Center(
                        child: Text('BID'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Table(
                        defaultColumnWidth: const FixedColumnWidth(80.0),
                        children: const [
                          TableRow(
                            children: [
                              Text('Bid',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey)),
                              Text('Orders',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey)),
                              Text('Qty',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey))
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('1000',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.green)),
                              Text('0',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.green)),
                              Text('187.25',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.green))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Column(
                    children: [
                      const Center(
                        child: Text('OFFER'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Table(
                        defaultColumnWidth: const FixedColumnWidth(80.0),
                        children: const [
                          TableRow(
                            children: [
                              Text('Offer',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey)),
                              Text('Orders',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey)),
                              Text('Qty',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey))
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('1000',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.red)),
                              Text('0',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.red)),
                              Text('187.25',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.red))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      const VerticalDivider(
        color: Colors.grey,
        width: 30,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Table(
              defaultColumnWidth: const FixedColumnWidth(80.0),
              children: const [
                TableRow(
                  children: [
                    Text('Prev.Close',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    Text('Open',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    Text('High',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    Text('Low',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey))
                  ],
                ),
                TableRow(
                  children: [
                    Text('1000',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('0',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('187.25',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('187.25',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ],
  ),
  const Center(
    child: Text(technical),
  ),
  const Center(
    child: Text(futures),
  ),
  const Center(
    child: Text(options),
  ),
  const Center(
    child: Text(news),
  ),
]);
