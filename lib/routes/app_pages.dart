// app_pages.dart
import 'package:anubs_invoice_app/add_product_responsive/dekstop_add_product_page.dart';
import 'package:anubs_invoice_app/add_product_responsive/mobile_add_product_page.dart';
import 'package:anubs_invoice_app/add_product_responsive/tablat_add_product_page.dart';
import 'package:anubs_invoice_app/bindings/barcode_binding.dart';
import 'package:anubs_invoice_app/bindings/calculation_binding.dart';
import 'package:anubs_invoice_app/bindings/invocie_binding.dart';
import 'package:anubs_invoice_app/pdf_page_responsive/pdf_page.dart';
import 'package:anubs_invoice_app/pdf_page_responsive/tablat_pdf_page.dart';
import 'package:anubs_invoice_app/pdf_page_responsive/dekstop_pdf_page.dart';
import 'package:anubs_invoice_app/settings_page_responsive/dekstop_settings.dart';
import 'package:anubs_invoice_app/settings_page_responsive/mobile_settings.dart';
import 'package:anubs_invoice_app/settings_page_responsive/tablat_settings.dart';
import 'package:anubs_invoice_app/view_product_responsive/dekstop_view_product.dart';
import 'package:anubs_invoice_app/view_product_responsive/mobile_view_product.dart';
import 'package:anubs_invoice_app/view_product_responsive/tablat_view_product.dart';
import 'package:get/get.dart';
import 'package:anubs_invoice_app/bindings/add_item_binding.dart';
import 'package:anubs_invoice_app/bindings/page_binding.dart';
import 'package:anubs_invoice_app/create_invoice_responsive/dekstop_invoice_page.dart';
import 'package:anubs_invoice_app/create_invoice_responsive/mobile_invoice_page.dart';
import 'package:anubs_invoice_app/create_invoice_responsive/tablat_invoice_page.dart';
import 'package:anubs_invoice_app/homepage_responsive/dekstop_home_page.dart';
import 'package:anubs_invoice_app/homepage_responsive/mobile_home_page.dart';
import 'package:anubs_invoice_app/homepage_responsive/tablat_home_page.dart';
import 'package:anubs_invoice_app/input_textfield_responsive/calculation_mobile_field.dart';
import 'package:anubs_invoice_app/invoices_list_responsive/dekstop_invoice_list.dart';
import 'package:anubs_invoice_app/invoices_list_responsive/mobile_inovie_list.dart';
import 'package:anubs_invoice_app/invoices_list_responsive/tablat_inovice_list.dart';
import 'package:anubs_invoice_app/products_responsive/dekstop_product_page.dart';
import 'package:anubs_invoice_app/products_responsive/mobile_product_page.dart';
import 'package:anubs_invoice_app/products_responsive/tablat_product_page.dart';
import 'package:anubs_invoice_app/responsive/responsive_layout.dart';
import 'package:anubs_invoice_app/views/body_pages.dart';
import 'package:anubs_invoice_app/views/saved_items_page.dart';

// routes.dart
class Routes {
  static const bodyPages = "/bodyPage";
  static const home = "/homePage";
  static const createInvoice = "/newInvoicePage";
  static const invoicesList = "/invoicesList";
  static const savedItems = "/savedItems";
  static const productPage = "/productPage";
  static const viewitem = "/viewItem";
  static const field = "/field";
  static const clients = "/clients"; // Added for future use
  static const settings = "/settings"; // Added for future use
  static const pdfPage = "/pdfPage";
  static const addProduct = "/addProduct";
  static const viewProduct = "/viewProduct";
}

class AppPages {
  static const String initialRoute = Routes.bodyPages;
  static final routes = [
    GetPage(
      name: Routes.bodyPages,
      page: () => BodyPages(),
      bindings: [AddItemBinding(), PageBinding()],
    ),
    GetPage(
      name: Routes.home,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileHomePage(),
            tablatScreen: TablatHomePage(),
            dekstopScreen: DekstopHomePage(),
          ),
    ),
    GetPage(
      name: Routes.invoicesList,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileInovieList(),
            tablatScreen: TablatInoviceList(),
            dekstopScreen: DekstopInvoiceList(),
          ),
      bindings: [AddItemBinding(), InvocieBinding()],
    ),
    GetPage(
      name: Routes.createInvoice,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileInvoicePage(),
            tablatScreen: TabletInvoicePage(),
            dekstopScreen: DesktopInvoicePage(),
          ),
      bindings: [AddItemBinding(), PageBinding(), CalculationBinding()],
    ),
    GetPage(
      name: Routes.savedItems,
      page: () => SavedItemsPage(),
      binding: AddItemBinding(),
    ),
    GetPage(
      name: Routes.productPage,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileProductPage(),
            tablatScreen: TablatProductPage(),
            dekstopScreen: DekstopProductPage(),
          ),
    ),
    GetPage(name: Routes.field, page: () => CalculationMobileField()),
    GetPage(
      name: Routes.pdfPage,
      page:
          () => ResponsiveLayout(
            mobileScreen: PdfPage(),
            tablatScreen: TablatPdfPage(),
            dekstopScreen: DesktopPdfPage(),
          ),
      binding: AddItemBinding(),
    ),
    GetPage(
      name: Routes.addProduct,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileAddProductPage(),
            tablatScreen: TablatAddProductPage(),
            dekstopScreen: DekstopAddProductPage(),
          ),
      bindings: [AddItemBinding(), BarcodeBinding()],
    ),
    GetPage(
      name: Routes.viewProduct,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileViewProduct(),
            tablatScreen: TablatViewProduct(),
            dekstopScreen: DekstopViewProduct(),
          ),
      binding: AddItemBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page:
          () => ResponsiveLayout(
            mobileScreen: MobileSettings(),
            tablatScreen: TablatSettings(),
            dekstopScreen: DekstopSettings(),
          ),
    ),
  ];
}
