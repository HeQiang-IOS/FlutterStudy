import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class  DemoLocalizations {
  bool isZh = false;
  static DemoLocalizations of (BuildContext context){
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return isZh ? "Flutter 应用": "Flutter APP";
  }


  DemoLocalizations(this.isZh);
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale.languageCode == 'zh'));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
  
}