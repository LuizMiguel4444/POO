// Generated by DDC, the Dart Development Compiler (to JavaScript).
// Version: 2.19.2 (stable) (Tue Feb 7 18:37:17 2023 +0000) on "linux_x64"
// Module: zapp_user_main
// Flags: soundNullSafety(true), enableAsserts(true)
define('zapp_user_main', ['dart_sdk', 'flutter_sdk'], (function load__zapp_user_main(dart_sdk, flutter_sdk) {
  'use strict';
  const core = dart_sdk.core;
  const async = dart_sdk.async;
  const _interceptors = dart_sdk._interceptors;
  const js = dart_sdk.js;
  const ui = dart_sdk.ui;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const app = flutter_sdk.src__material__app;
  const theme_data = flutter_sdk.src__material__theme_data;
  const framework = flutter_sdk.src__widgets__framework;
  const scaffold = flutter_sdk.src__material__scaffold;
  const icon = flutter_sdk.src__widgets__icon;
  const icons = flutter_sdk.src__material__icons;
  const app_bar = flutter_sdk.src__material__app_bar;
  const text = flutter_sdk.src__widgets__text;
  const preferred_size = flutter_sdk.src__widgets__preferred_size;
  const basic = flutter_sdk.src__widgets__basic;
  const edge_insets = flutter_sdk.src__painting__edge_insets;
  const flex = flutter_sdk.src__rendering__flex;
  const bottom_navigation_bar = flutter_sdk.src__material__bottom_navigation_bar;
  const bottom_navigation_bar_item = flutter_sdk.src__widgets__bottom_navigation_bar_item;
  const binding = flutter_sdk.src__widgets__binding;
  var $46zapp_entry = Object.create(dart.library);
  var main = Object.create(dart.library);
  var web_plugin_registrant = Object.create(dart.library);
  var $toString = dartx.toString;
  var $map = dartx.map;
  var $toList = dartx.toList;
  dart._checkModuleNullSafetyMode(true);
  dart._checkModuleRuntimeTypes(false);
  var T = {
    VoidTovoid: () => (T.VoidTovoid = dart.constFn(dart.fnType(dart.void, [])))(),
    ListOfString: () => (T.ListOfString = dart.constFn(core.List$(core.String)))(),
    ListOfStringTodynamic: () => (T.ListOfStringTodynamic = dart.constFn(dart.fnType(dart.dynamic, [T.ListOfString()])))(),
    JSArrayOfString: () => (T.JSArrayOfString = dart.constFn(_interceptors.JSArray$(core.String)))(),
    dynamicToNull: () => (T.dynamicToNull = dart.constFn(dart.fnType(core.Null, [dart.dynamic])))(),
    VoidToNull: () => (T.VoidToNull = dart.constFn(dart.fnType(core.Null, [])))(),
    ObjectAndStackTraceTovoid: () => (T.ObjectAndStackTraceTovoid = dart.constFn(dart.fnType(dart.void, [core.Object, core.StackTrace])))(),
    ZoneAndZoneDelegateAndZone__Tovoid: () => (T.ZoneAndZoneDelegateAndZone__Tovoid = dart.constFn(dart.fnType(dart.void, [async.Zone, async.ZoneDelegate, async.Zone, core.String])))(),
    JSArrayOfNavBarItem: () => (T.JSArrayOfNavBarItem = dart.constFn(_interceptors.JSArray$(main.NavBarItem)))(),
    NavBarItemToBottomNavigationBarItem: () => (T.NavBarItemToBottomNavigationBarItem = dart.constFn(dart.fnType(bottom_navigation_bar_item.BottomNavigationBarItem, [main.NavBarItem])))()
  };
  const CT = Object.create({
    _: () => (C, CT)
  });
  dart.defineLazy(CT, {
    get C0() {
      return C[0] = dart.fn(main.main, T.VoidTovoid());
    },
    get C1() {
      return C[1] = dart.const({
        __proto__: text.Text.prototype,
        [Widget_key]: null,
        [Text_selectionColor]: null,
        [Text_textHeightBehavior]: null,
        [Text_textWidthBasis]: null,
        [Text_semanticsLabel]: null,
        [Text_maxLines]: null,
        [Text_textScaleFactor]: null,
        [Text_overflow]: null,
        [Text_softWrap]: null,
        [Text_locale]: null,
        [Text_textDirection]: null,
        [Text_textAlign]: null,
        [Text_strutStyle]: null,
        [Text_style]: null,
        [Text_textSpan]: null,
        [Text_data]: "Receita 2"
      });
    },
    get C2() {
      return C[2] = dart.const({
        __proto__: ui.Size.prototype,
        [OffsetBase__dy]: 56,
        [OffsetBase__dx]: 1 / 0
      });
    },
    get C3() {
      return C[3] = dart.const({
        __proto__: edge_insets.EdgeInsets.prototype,
        [EdgeInsets_bottom]: 100,
        [EdgeInsets_right]: 100,
        [EdgeInsets_top]: 100,
        [EdgeInsets_left]: 100
      });
    },
    get C5() {
      return C[5] = dart.const({
        __proto__: text.Text.prototype,
        [Widget_key]: null,
        [Text_selectionColor]: null,
        [Text_textHeightBehavior]: null,
        [Text_textWidthBasis]: null,
        [Text_semanticsLabel]: null,
        [Text_maxLines]: null,
        [Text_textScaleFactor]: null,
        [Text_overflow]: null,
        [Text_softWrap]: null,
        [Text_locale]: null,
        [Text_textDirection]: null,
        [Text_textAlign]: null,
        [Text_strutStyle]: null,
        [Text_style]: null,
        [Text_textSpan]: null,
        [Text_data]: "La Fin Du Monde - Bock - 65 ibu"
      });
    },
    get C6() {
      return C[6] = dart.const({
        __proto__: basic.SizedBox.prototype,
        [Widget_key]: null,
        [SingleChildRenderObjectWidget_child]: null,
        [SizedBox_height]: 100,
        [SizedBox_width]: null
      });
    },
    get C7() {
      return C[7] = dart.const({
        __proto__: text.Text.prototype,
        [Widget_key]: null,
        [Text_selectionColor]: null,
        [Text_textHeightBehavior]: null,
        [Text_textWidthBasis]: null,
        [Text_semanticsLabel]: null,
        [Text_maxLines]: null,
        [Text_textScaleFactor]: null,
        [Text_overflow]: null,
        [Text_softWrap]: null,
        [Text_locale]: null,
        [Text_textDirection]: null,
        [Text_textAlign]: null,
        [Text_strutStyle]: null,
        [Text_style]: null,
        [Text_textSpan]: null,
        [Text_data]: "Sapporo Premiume - Sour Ale - 54 ibu"
      });
    },
    get C8() {
      return C[8] = dart.const({
        __proto__: text.Text.prototype,
        [Widget_key]: null,
        [Text_selectionColor]: null,
        [Text_textHeightBehavior]: null,
        [Text_textWidthBasis]: null,
        [Text_semanticsLabel]: null,
        [Text_maxLines]: null,
        [Text_textScaleFactor]: null,
        [Text_overflow]: null,
        [Text_softWrap]: null,
        [Text_locale]: null,
        [Text_textDirection]: null,
        [Text_textAlign]: null,
        [Text_strutStyle]: null,
        [Text_style]: null,
        [Text_textSpan]: null,
        [Text_data]: "Duvel - Pilsner - 82 ibu"
      });
    },
    get C4() {
      return C[4] = dart.constList([C[5] || CT.C5, C[6] || CT.C6, C[7] || CT.C7, C[6] || CT.C6, C[8] || CT.C8], framework.Widget);
    }
  }, false);
  var C = Array(9).fill(void 0);
  var I = ["file:///zapp/project/lib/main.dart"];
  $46zapp_entry.runAppGuarded = function runAppGuarded() {
    async.runZonedGuarded(core.Null, dart.fn(() => {
      if (T.ListOfStringTodynamic().is(C[0] || CT.C0)) {
        T.ListOfStringTodynamic().as(C[0] || CT.C0)(T.JSArrayOfString().of([]));
      } else {
        (C[0] || CT.C0)();
      }
      if (js.context.hasProperty("__notifyFlutterRendered")) {
        async.Future.delayed(new core.Duration.new({milliseconds: 250})).then(core.Null, dart.fn(_ => {
          js.context.callMethod("__notifyFlutterRendered", [false]);
        }, T.dynamicToNull()));
      }
    }, T.VoidToNull()), dart.fn((e, stackTrace) => {
      if (js.context.hasProperty("zappHandlerUserError")) {
        js.context.callMethod("zappHandlerUserError", [e[$toString](), stackTrace.toString()]);
      }
    }, T.ObjectAndStackTraceTovoid()), {zoneSpecification: new async._ZoneSpecification.new({print: dart.fn((self, parent, zone, line) => {
          if (js.context.hasProperty("zappHandlerUserPrint")) {
            js.context.callMethod("zappHandlerUserPrint", [line]);
          }
        }, T.ZoneAndZoneDelegateAndZone__Tovoid())})});
  };
  $46zapp_entry.main = function main$() {
    return async.async(dart.void, function* main() {
      yield ui.webOnlyWarmupEngine({runApp: dart.fn(() => {
          $46zapp_entry.runAppGuarded();
        }, T.VoidToNull()), registerPlugins: dart.fn(() => {
          web_plugin_registrant.registerPlugins();
        }, T.VoidToNull())});
    });
  };
  main.MyApp = class MyApp extends framework.StatelessWidget {
    build(context) {
      return new app.MaterialApp.new({debugShowCheckedModeBanner: false, title: "Luiz Revenue", theme: theme_data.ThemeData.dark().copyWith({useMaterial3: true}), home: new main.MyHomePage.new()});
    }
    static ['_#new#tearOff']() {
      return new main.MyApp.new();
    }
  };
  (main.MyApp.new = function() {
    main.MyApp.__proto__.new.call(this);
    ;
  }).prototype = main.MyApp.prototype;
  dart.addTypeTests(main.MyApp);
  dart.addTypeCaches(main.MyApp);
  dart.setMethodSignature(main.MyApp, () => ({
    __proto__: dart.getMethods(main.MyApp.__proto__),
    build: dart.fnType(framework.Widget, [framework.BuildContext])
  }));
  dart.setLibraryUri(main.MyApp, I[0]);
  main.MyHomePage = class MyHomePage extends framework.StatelessWidget {
    build(context) {
      return new scaffold.Scaffold.new({appBar: new main.MyNewAppBar.new(), body: new main.NewLittleBody.new(), bottomNavigationBar: new main.MyNewNavBar.new({items: T.JSArrayOfNavBarItem().of([new main.NavBarItem.new({icon: new icon.Icon.new(icons.Icons.phone, {color: new ui.Color.fromARGB(255, 0, 162, 255)}), label: "Phone"}), new main.NavBarItem.new({icon: new icon.Icon.new(icons.Icons.music_note, {color: new ui.Color.fromARGB(255, 0, 255, 13)}), label: "Music"}), new main.NavBarItem.new({icon: new icon.Icon.new(icons.Icons.calendar_today, {color: new ui.Color.fromARGB(255, 236, 89, 187)}), label: "Calendar"}), new main.NavBarItem.new({icon: new icon.Icon.new(icons.Icons.camera, {color: new ui.Color.fromARGB(255, 255, 0, 0)}), label: "Cam"}), new main.NavBarItem.new({icon: new icon.Icon.new(icons.Icons.email, {color: new ui.Color.fromARGB(255, 255, 255, 255)}), label: "Email"}), new main.NavBarItem.new({icon: new icon.Icon.new(icons.Icons.shopping_cart, {color: new ui.Color.fromARGB(255, 255, 230, 0)}), label: "Car"})])})});
    }
    static ['_#new#tearOff']() {
      return new main.MyHomePage.new();
    }
  };
  (main.MyHomePage.new = function() {
    main.MyHomePage.__proto__.new.call(this);
    ;
  }).prototype = main.MyHomePage.prototype;
  dart.addTypeTests(main.MyHomePage);
  dart.addTypeCaches(main.MyHomePage);
  dart.setMethodSignature(main.MyHomePage, () => ({
    __proto__: dart.getMethods(main.MyHomePage.__proto__),
    build: dart.fnType(framework.Widget, [framework.BuildContext])
  }));
  dart.setLibraryUri(main.MyHomePage, I[0]);
  var Widget_key = dart.privateName(framework, "Widget.key");
  var Text_selectionColor = dart.privateName(text, "Text.selectionColor");
  var Text_textHeightBehavior = dart.privateName(text, "Text.textHeightBehavior");
  var Text_textWidthBasis = dart.privateName(text, "Text.textWidthBasis");
  var Text_semanticsLabel = dart.privateName(text, "Text.semanticsLabel");
  var Text_maxLines = dart.privateName(text, "Text.maxLines");
  var Text_textScaleFactor = dart.privateName(text, "Text.textScaleFactor");
  var Text_overflow = dart.privateName(text, "Text.overflow");
  var Text_softWrap = dart.privateName(text, "Text.softWrap");
  var Text_locale = dart.privateName(text, "Text.locale");
  var Text_textDirection = dart.privateName(text, "Text.textDirection");
  var Text_textAlign = dart.privateName(text, "Text.textAlign");
  var Text_strutStyle = dart.privateName(text, "Text.strutStyle");
  var Text_style = dart.privateName(text, "Text.style");
  var Text_textSpan = dart.privateName(text, "Text.textSpan");
  var Text_data = dart.privateName(text, "Text.data");
  var OffsetBase__dy = dart.privateName(ui, "OffsetBase._dy");
  var OffsetBase__dx = dart.privateName(ui, "OffsetBase._dx");
  main.MyNewAppBar = class MyNewAppBar extends framework.StatelessWidget {
    static ['_#new#tearOff']() {
      return new main.MyNewAppBar.new();
    }
    build(context) {
      return new app_bar.AppBar.new({title: C[1] || CT.C1, centerTitle: true, backgroundColor: new ui.Color.fromARGB(255, 175, 60, 255)});
    }
    get preferredSize() {
      return C[2] || CT.C2;
    }
  };
  (main.MyNewAppBar.new = function() {
    main.MyNewAppBar.__proto__.new.call(this);
    ;
  }).prototype = main.MyNewAppBar.prototype;
  dart.addTypeTests(main.MyNewAppBar);
  dart.addTypeCaches(main.MyNewAppBar);
  main.MyNewAppBar[dart.implements] = () => [preferred_size.PreferredSizeWidget];
  dart.setMethodSignature(main.MyNewAppBar, () => ({
    __proto__: dart.getMethods(main.MyNewAppBar.__proto__),
    build: dart.fnType(framework.Widget, [framework.BuildContext])
  }));
  dart.setGetterSignature(main.MyNewAppBar, () => ({
    __proto__: dart.getGetters(main.MyNewAppBar.__proto__),
    preferredSize: ui.Size
  }));
  dart.setLibraryUri(main.MyNewAppBar, I[0]);
  var EdgeInsets_bottom = dart.privateName(edge_insets, "EdgeInsets.bottom");
  var EdgeInsets_right = dart.privateName(edge_insets, "EdgeInsets.right");
  var EdgeInsets_top = dart.privateName(edge_insets, "EdgeInsets.top");
  var EdgeInsets_left = dart.privateName(edge_insets, "EdgeInsets.left");
  var SingleChildRenderObjectWidget_child = dart.privateName(framework, "SingleChildRenderObjectWidget.child");
  var SizedBox_height = dart.privateName(basic, "SizedBox.height");
  var SizedBox_width = dart.privateName(basic, "SizedBox.width");
  main.NewLittleBody = class NewLittleBody extends framework.StatelessWidget {
    static ['_#new#tearOff']() {
      return new main.NewLittleBody.new();
    }
    build(context) {
      return new basic.Center.new({child: new basic.Padding.new({padding: C[3] || CT.C3, child: new basic.Column.new({mainAxisAlignment: flex.MainAxisAlignment.center, children: C[4] || CT.C4})})});
    }
  };
  (main.NewLittleBody.new = function() {
    main.NewLittleBody.__proto__.new.call(this);
    ;
  }).prototype = main.NewLittleBody.prototype;
  dart.addTypeTests(main.NewLittleBody);
  dart.addTypeCaches(main.NewLittleBody);
  dart.setMethodSignature(main.NewLittleBody, () => ({
    __proto__: dart.getMethods(main.NewLittleBody.__proto__),
    build: dart.fnType(framework.Widget, [framework.BuildContext])
  }));
  dart.setLibraryUri(main.NewLittleBody, I[0]);
  var icon$ = dart.privateName(main, "NavBarItem.icon");
  var label$ = dart.privateName(main, "NavBarItem.label");
  main.NavBarItem = class NavBarItem extends core.Object {
    get icon() {
      return this[icon$];
    }
    set icon(value) {
      this[icon$] = value;
    }
    get label() {
      return this[label$];
    }
    set label(value) {
      this[label$] = value;
    }
    static ['_#new#tearOff'](opts) {
      let icon = opts && 'icon' in opts ? opts.icon : null;
      let label = opts && 'label' in opts ? opts.label : null;
      return new main.NavBarItem.new({icon: icon, label: label});
    }
  };
  (main.NavBarItem.new = function(opts) {
    let icon = opts && 'icon' in opts ? opts.icon : null;
    let label = opts && 'label' in opts ? opts.label : null;
    this[icon$] = icon;
    this[label$] = label;
    ;
  }).prototype = main.NavBarItem.prototype;
  dart.addTypeTests(main.NavBarItem);
  dart.addTypeCaches(main.NavBarItem);
  dart.setLibraryUri(main.NavBarItem, I[0]);
  dart.setFieldSignature(main.NavBarItem, () => ({
    __proto__: dart.getFields(main.NavBarItem.__proto__),
    icon: dart.fieldType(icon.Icon),
    label: dart.fieldType(core.String)
  }));
  var items$ = dart.privateName(main, "MyNewNavBar.items");
  main.MyNewNavBar = class MyNewNavBar extends framework.StatelessWidget {
    get items() {
      return this[items$];
    }
    set items(value) {
      super.items = value;
    }
    static ['_#new#tearOff'](opts) {
      let items = opts && 'items' in opts ? opts.items : null;
      return new main.MyNewNavBar.new({items: items});
    }
    touchedButton(index) {
      core.print("Touched: " + dart.str(index));
    }
    build(context) {
      return new bottom_navigation_bar.BottomNavigationBar.new({onTap: dart.bind(this, 'touchedButton'), items: this.items[$map](bottom_navigation_bar_item.BottomNavigationBarItem, dart.fn(item => new bottom_navigation_bar_item.BottomNavigationBarItem.new({icon: item.icon, label: item.label}), T.NavBarItemToBottomNavigationBarItem()))[$toList]()});
    }
  };
  (main.MyNewNavBar.new = function(opts) {
    let items = opts && 'items' in opts ? opts.items : null;
    this[items$] = items;
    main.MyNewNavBar.__proto__.new.call(this);
    ;
  }).prototype = main.MyNewNavBar.prototype;
  dart.addTypeTests(main.MyNewNavBar);
  dart.addTypeCaches(main.MyNewNavBar);
  dart.setMethodSignature(main.MyNewNavBar, () => ({
    __proto__: dart.getMethods(main.MyNewNavBar.__proto__),
    touchedButton: dart.fnType(dart.void, [core.int]),
    build: dart.fnType(framework.Widget, [framework.BuildContext])
  }));
  dart.setLibraryUri(main.MyNewNavBar, I[0]);
  dart.setFieldSignature(main.MyNewNavBar, () => ({
    __proto__: dart.getFields(main.MyNewNavBar.__proto__),
    items: dart.finalFieldType(core.List$(main.NavBarItem))
  }));
  main.main = function main$0() {
    binding.runApp(new main.MyApp.new());
  };
  web_plugin_registrant.registerPlugins = function registerPlugins() {
  };
  dart.trackLibraries("zapp_user_main", {
    "file:///zapp/project/.zapp_entry.dart": $46zapp_entry,
    "file:///zapp/project/lib/main.dart": main,
    "file:///zapp/project/.dart_tool/dartpad/web_plugin_registrant.dart": web_plugin_registrant
  }, {
  }, '{"version":3,"sourceRoot":"","sources":["/zapp/project/.zapp_entry.dart","/zapp/project/lib/main.dart","/zapp/project/.dart_tool/dartpad/web_plugin_registrant.dart"],"names":[],"mappings":";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AA2CI,IA1BF,iCAAgB;AACd,UAAoB,6BAGD;AAF8B,QAA9B,AAAkB,6BAElB,eAF2B;;AAEL,QAAF,CAApB;;AAEnB,UAAO,AAAQ,uBAAY;AAKvB,QAJK,AAAqC,qBAA7B,qCAAuB,uBAAW,QAAC;AAG9C,UAFC,AAAQ,sBAAW,2BAA2B,CAC/C;;;wBAIL,SAAC,GAAG;AACL,UAAO,AAAQ,uBAAY;AAIvB,QAHC,AAAQ,sBAAW,wBAAwB,CAC5C,AAAE,CAAD,eACD,AAAW,UAAD;;2DAGM,yCACb,SAAC,MAAM,QAAQ,MAAM;AAC1B,cAAO,AAAQ,uBAAY;AAC4B,YAAlD,AAAQ,sBAAW,wBAAwB,CAAC,IAAI;;;EAI3D;;AAEiB;AAQd,MAPD,MAAS,gCACC;AACS,UAAf;6CAEe;AACmB,UAAjB;;IAGvB;;;UC/C4B;AACxB,YAAO,sDACuB,cACrB,uBACU,AAAO,oDACR,cAEV;IAEV;;;;;;;;EACF;;;;;;;;;UAI4B;AACxB,YAAO,oCACG,kCACF,mDACe,iCACZ,4BACL,+BACQ,kBAAW,2BAAoB,sBAAS,KAAK,GAAG,KAAK,eACpD,WAET,+BACQ,kBAAW,gCAAyB,sBAAS,KAAK,GAAG,KAAK,cACzD,WAET,+BACQ,kBAAW,oCAA6B,sBAAS,KAAK,KAAK,IAAI,eAC9D,cAET,+BACQ,kBAAW,4BAAqB,sBAAS,KAAK,KAAK,GAAG,aACrD,SAET,+BACQ,kBAAW,2BAAoB,sBAAS,KAAK,KAAK,KAAK,eACtD,WAET,+BACQ,kBAAW,mCAA4B,sBAAS,KAAK,KAAK,KAAK,aAC9D;IAKjB;;;;;;;;EACF;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UAM4B;AACxB,YAAO,4DAEQ,uBACU,sBAAS,KAAK,KAAK,IAAI;IAElD;;AAG0B;IAAqC;;;AAZ/D;;EAAa;;;;;;;;;;;;;;;;;;;;;;;;UAmBa;AACxB,YAAO,8BACE,sDAEE,yCACgC;IAW7C;;;AAnBA;;EAAe;;;;;;;;;;;IAuBV;;;;;;IACE;;;;;;;;;;;;;QAEmB;QAAoB;IAApB;IAAoB;;EAAO;;;;;;;;;;;IAI9B;;;;;;;;;;kBAIA;AACG,MAAxB,WAAM,AAAiB,uBAAN,KAAK;IACxB;UAG0B;AACxB,YAAO,qEACE,+BACA,AACF,AACA,qEADI,QAAC,QAAS,kEAA8B,AAAK,IAAD,cAAc,AAAK,IAAD;IAG3E;;;QAd2B;;AAA3B;;EAAkC;;;;;;;;;;;;;;AAxGnB,IAAf,eAAO;EACT;;ECGwB","file":"main.js"}');
  // Exports:
  return {
    zapp__project__$46zapp_entry: $46zapp_entry,
    zapp__project__lib__main: main,
    zapp__project__$46dart_tool__dartpad__web_plugin_registrant: web_plugin_registrant
  };
}));

//# sourceMappingURL=main.js.map
