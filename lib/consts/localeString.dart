import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "profile": "Profile",
          "Vendor": "Vendor",
          " Rating": "Rating",
          "Transactions": "Transactions",
          " completed": "completed",
          "Vendors": "Vendors",
          "Connected": "Connected",
          "Outstanding Transactions": "Outstanding Transactions",
          "My Reviews": "My Reviews",
          "Languages": "Languages"
        },
        "hi_IN": {
          "profile": "प्रोफ़ाइल",
          "Vendor": "विक्रेता",
          "Rating": "रेटिंग",
          "Transactions": "लेन -",
          "completed": " देन पूरे हुए",
          "Vendors": "विक्रेता",
          "Connected": "जुड़े हुए हैं",
          "Outstanding Transactions": "बकाया लेन - देन",
          "My Reviews": "मेरी समीक्षाएँ",
          "Languages": "भाषाएँ"
        },
        "mr_IN": {
          "profile": "प्रोफाइल",
          "Vendor": "विक्रेता",
          "Rating": "रेटिंग",
          "Transactions": "व्यवहार",
          "completed": "पूर्ण झाले",
          "Vendors": "विक्रेते",
          "Connected": "कनेक्ट केले",
          "Outstanding Transactions": "थकबाकी व्यवहार",
          "My Reviews": "माझे पुनरावलोकने",
          "Languages": "भाषा"
        }
      };
}
