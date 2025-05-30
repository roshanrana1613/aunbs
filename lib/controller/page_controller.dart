import 'package:anubs_invoice_app/create_invoice_responsive/mobile_invoice_page.dart';
import 'package:anubs_invoice_app/create_invoice_responsive/tablat_invoice_page.dart';
import 'package:anubs_invoice_app/homepage_responsive/dekstop_home_page.dart';
import 'package:anubs_invoice_app/homepage_responsive/mobile_home_page.dart';
import 'package:anubs_invoice_app/homepage_responsive/tablat_home_page.dart';
import 'package:anubs_invoice_app/products_responsive/dekstop_product_page.dart';
import 'package:anubs_invoice_app/products_responsive/mobile_product_page.dart';
import 'package:anubs_invoice_app/products_responsive/tablat_product_page.dart';
import 'package:anubs_invoice_app/responsive/responsive_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../create_invoice_responsive/dekstop_invoice_page.dart';

class MyPageController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    ResponsiveLayout(
      mobileScreen: MobileHomePage(),
      tablatScreen: TablatHomePage(),
      dekstopScreen: DekstopHomePage(),
    ),
    ResponsiveLayout(
      mobileScreen: MobileInvoicePage(),
      tablatScreen: TabletInvoicePage(),
      dekstopScreen: DesktopInvoicePage(),
    ),
    ResponsiveLayout(
      mobileScreen: MobileProductPage(),
      tablatScreen: TablatProductPage(),
      dekstopScreen: DekstopProductPage(),
    ),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
