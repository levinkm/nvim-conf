local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- StatefulWidget
    s("stful", {
        t("class "), i(1, "MyWidget"), t(" extends StatefulWidget {"),
        t({"", "  const "}), i(1, "MyWidget"), t("({Key? key}) : super(key: key);"),
        t({"", "  @override", "  State<"}), i(1, "MyWidget"), t("> createState() => _"),
        i(1, "MyWidget"), t("State();", "}", ""),
        t({"class _"}), i(1, "MyWidget"), t("State extends State<"), i(1, "MyWidget"),
        t({"> {", "  @override", "  Widget build(BuildContext context) {", "    return "}),
        i(2, "Container()"), t(";", "  }", "}"),
    }),

    -- StatelessWidget
    s("stless", {
        t("class "), i(1, "MyWidget"), t(" extends StatelessWidget {"),
        t({"", "  const "}), i(1, "MyWidget"), t("({Key? key}) : super(key: key);"),
        t({"", "  @override", "  Widget build(BuildContext context) {", "    return "}),
        i(2, "Container()"), t(";", "  }", "}"),
    }),

    -- Constructor
    s("ctor", {
        t({"const "}), i(1, "ClassName"), t("({"),
        i(2, "Key? key"), t("}) : super(key: key);"),
    }),

    -- Column Widget
    s("column", {
        t("Column("),
        t({"", "  children: [", "    "}), i(1, "// Add widgets here"),
        t({"", "  ],", "}),"}),
    }),

    -- Row Widget
    s("row", {
        t("Row("),
        t({"", "  children: [", "    "}), i(1, "// Add widgets here"),
        t({"", "  ],", "}),"}),
    }),

    -- ListView Widget
    s("listview", {
        t("ListView.builder("),
        t({"", "  itemCount: "}), i(1, "itemCount"),
        t({",", "  itemBuilder: (context, index) {", "    return "}),
        i(2, "Container()"), t(";", "  },", "}),"}),
    }),

    -- ElevatedButton
    s("button", {
        t("ElevatedButton("),
        t({"", "  onPressed: () {", "    "}), i(1, "// Add your action here"),
        t({"", "  },", "  child: Text("}), i(2, "\"Button\""), t("),", "}),"}),
    }),

    -- Padding Widget
    s("padding", {
        t("Padding("),
        t({"", "  padding: EdgeInsets.all("}), i(1, "8.0"), t("),"),
        t({"", "  child: "}), i(2, "Container()"),
        t({",", "}),"}),
    }),

    -- Scaffold Widget
    s("scaffold", {
        t("Scaffold("),
        t({"", "  appBar: AppBar(", "    title: Text("}), i(1, "\"App Title\""), t("),"),
        t({"  ),", "  body: "}), i(2, "Center("), t({")", "}),", "}),"}),
    }),

    -- Center Widget
    s("center", {
        t("Center("),
        t({"", "  child: "}), i(1, "Container()"),
        t({",", "}),"}),
    }),

    -- Text Widget
    s("text", {
        t("Text("),
        i(1, "\"Hello World\""), t(","),
        t({"", "  style: TextStyle(", "    fontSize: "}), i(2, "16.0"), t(","),
        t({"", "    fontWeight: FontWeight."}), i(3, "bold"), t(","),
        t({"", "  ),", "}),"}),
    }),

    -- FutureBuilder Widget
    s("futurebuilder", {
        t("FutureBuilder("),
        t({"", "  future: "}), i(1, "yourFuture"),
        t({",", "  builder: (context, snapshot) {", "    if (snapshot.connectionState == ConnectionState.waiting) {", "      return "}),
        i(2, "CircularProgressIndicator()"), t(";", "    } else if (snapshot.hasError) {", "      return Text(\"Error: ${snapshot.error}\");", "    } else {", "      return "}),
        i(3, "YourWidget()"), t(";", "    }", "  },", "}),"}),
    }),

    -- Container Widget
    s("container", {
        t("Container("),
        t({"", "  width: "}), i(1, "100.0"),
        t({",", "  height: "}), i(2, "100.0"),
        t({",", "  decoration: BoxDecoration(", "    color: Colors."}), i(3, "blue"),
        t({",", "    borderRadius: BorderRadius.circular("}), i(4, "8.0"), t("),"),
        t({"  ),", "  child: "}), i(5, "Text(\"Hello\")"),
        t({",", "}),"}),
    }),

    -- StreamBuilder Widget
    s("streambuilder", {
        t("StreamBuilder("),
        t({"", "  stream: "}), i(1, "yourStream"),
        t({",", "  builder: (context, snapshot) {", "    if (snapshot.connectionState == ConnectionState.waiting) {", "      return "}),
        i(2, "CircularProgressIndicator()"), t(";", "    } else if (snapshot.hasError) {", "      return Text(\"Error: ${snapshot.error}\");", "    } else {", "      return "}),
        i(3, "YourWidget()"), t(";", "    }", "  },", "}),"}),
    }),

    -- BlocBuilder Widget
    s("blocbuilder", {
        t("BlocBuilder<"), i(1, "BlocType"), t(", "), i(2, "StateType"), t(">("),
        t({"", "  builder: (context, state) {", "    if (state is "}), i(3, "InitialState"), t(") {"),
        t({"", "      return "}), i(4, "YourInitialWidget()"), t(";", "    } else if (state is "}),
        i(5, "OtherState"), t(") {", "      return "), i(6, "YourOtherWidget()"), t(";", "    } else {", "      return "}),
        i(7, "Container()"), t(";", "    }", "  },", "}),"}),
    }),

    -- ListTile Widget
    s("listtile", {
        t("ListTile("),
        t({"", "  leading: "}), i(1, "Icon(Icons.icon)"),
        t({",", "  title: Text("}), i(2, "\"Title\""), t("),"),
        t({"", "  subtitle: Text("}), i(3, "\"Subtitle\""), t("),"),
        t({"", "  trailing: "}), i(4, "Icon(Icons.arrow_forward)"),
        t({",", "  onTap: () {", "    "}), i(5, "// Add action"),
        t({"", "  },", "}),"}),
    }),

    -- AlertDialog Widget
    s("alertdialog", {
        t("showDialog("),
        t({"", "  context: context,", "  builder: (context) {", "    return AlertDialog("}),
        t({"      title: Text("}), i(1, "\"Dialog Title\""), t("),"),
        t({"      content: Text("}), i(2, "\"Dialog Content\""), t("),"),
        t({"      actions: [", "        TextButton(", "          onPressed: () {", "            Navigator.of(context).pop();"}),
        t({";", "          },", "          child: Text("}), i(3, "\"Cancel\""), t("),", "        ),"}),
        t({"        TextButton(", "          onPressed: () {", "            "}), i(4, "// Add action here"),
        t({";", "          },", "          child: Text("}), i(5, "\"OK\""), t("),", "        ),", "      ],", "    );", "  },", "});"}),
    }),

    -- Drawer Widget
    s("drawer", {
        t("Drawer("),
        t({"", "  child: ListView(", "    children: [", "      DrawerHeader("}),
        t({"        decoration: BoxDecoration(", "          color: Colors."}), i(1, "blue"),
        t({",", "        ),", "        child: Text("}), i(2, "\"Header\""),
        t({"),", "      ),", "      ListTile(", "        leading: Icon(Icons."}), i(3, "home"),
        t({"),", "        title: Text("}), i(4, "\"Home\""), t("),", "        onTap: () {", "          "}),
        i(5, "// Add action here"), t({";", "        },", "      ),", "    ],", "  ),", "}),"}),
    }),

    -- BottomNavigationBar
    s("bottomnav", {
        t("BottomNavigationBar("),
        t({"", "  items: [", "    BottomNavigationBarItem(", "      icon: Icon(Icons."}), i(1, "home"),
        t({"),", "      label: \""}), i(2, "Home"), t("\","), t({"", "    ),", "    BottomNavigationBarItem(", "      icon: Icon(Icons."}),
        i(3, "search"), t({"),", "      label: \""}), i(4, "Search"), t("\","), t({"", "    ),", "  ],", "  currentIndex: "}),
        i(5, "0"), t({",", "  onTap: (index) {", "    "}), i(6, "// Handle navigation"),
        t({";", "  },", "}),"}),
    }),

    -- TextFormField
    s("textfield", {
        t("TextFormField("),
        t({"", "  decoration: InputDecoration(", "    labelText: \""}), i(1, "Label"),
        t("\",", "    hintText: \""), i(2, "Hint text"), t("\","),
        t({"    border: OutlineInputBorder(),", "  ),", "  validator: (value) {", "    if (value == null || value.isEmpty) {", "      return \""}),
        i(3, "Please enter some text"), t("\";", "    }", "    return null;", "  },", "  onSaved: (value) {", "    "}),
        i(4, "// Save value here"), t({";", "  },", "}),"}),
    }),

    -- SizedBox Widget
    s("sizedbox", {
        t("SizedBox("),
        t({"", "  width: "}), i(1, "10.0"),
        t({",", "  height: "}), i(2, "10.0"),
        t({",", "  child: "}), i(3, "Container()"),
        t({",", "}),"}),
    }),

    -- Divider Widget
    s("divider", {
        t("Divider("),
        t({"", "  height: "}), i(1, "1.0"),
        t({",", "  color: Colors."}), i(2, "black"),
        t({",", "}),"}),
    }),

    -- AppBar with title and actions
    s("appbar", {
        t("AppBar("),
        t({"", "  title: Text("}), i(1, "\"Title\""), t("),"),
        t({"", "  actions: [", "    IconButton("}),
        t({"      icon: Icon(Icons."}), i(2, "menu"), t({"),", "      onPressed: () {", "        "}),
        i(3, "// Add action here"), t({";", "      },", "    ),", "  ],", "}),"}),
    }),

    -- FutureBuilder with API call
    s("futureapi", {
        t("FutureBuilder<"), i(1, "DataType"), t(">("),
        t({"", "  future: fetch"}), i(2, "Data"), t("(),"),
        t({",", "  builder: (context, snapshot) {", "    if (snapshot.connectionState == ConnectionState.waiting) {", "      return CircularProgressIndicator();", "    } else if (snapshot.hasError) {", "      return Text(\"Error: ${snapshot.error}\");", "    } else {", "      final data = snapshot.data;"}),
        t({"", "      return "}), i(3, "WidgetUsingData(data)"), t(";", "    }", "  },", "});"}),
    }),

    -- BottomSheet Widget
    s("bottomsheet", {
        t("showModalBottomSheet("),
        t({"", "  context: context,", "  builder: (context) {", "    return Container("}),
        t({"      padding: EdgeInsets.all("}), i(1, "16.0"), t("),"),
        t({"      child: Column(", "        mainAxisSize: MainAxisSize.min,", "        children: [", "          "}), i(2, "// Add widgets here"),
        t({"", "        ],", "      ),", "    );", "  },", "});"}),
    }),

    -- GestureDetector Widget
    s("gesture", {
        t("GestureDetector("),
        t({"", "  onTap: () {", "    "}), i(1, "// Add your action here"),
        t({"", "  },", "  child: "}), i(2, "YourWidget"),
        t({",", "}),"}),
    }),

    -- Hero Animation
    s("hero", {
        t("Hero("),
        t({"", "  tag: \""}), i(1, "heroTag"), t("\","),
        t({"", "  child: "}), i(2, "YourWidget"),
        t({",", "}),"}),
    }),

    -- TabBar with TabController
    s("tabbar", {
        t("DefaultTabController("),
        t({"", "  length: "}), i(1, "3"), t({",", "  child: Scaffold(", "    appBar: AppBar(", "      bottom: TabBar(", "        tabs: ["}),
        t({"          Tab(icon: Icon(Icons."}), i(2, "home"), t({")),", "          Tab(icon: Icon(Icons."}), i(3, "search"), t({")),", "          Tab(icon: Icon(Icons."}), i(4, "settings"), t({")),", "        ],", "      ),", "      title: Text("}), i(5, "\"TabBar Example\""), t("),"),
        t({"    ),", "    body: TabBarView(", "      children: ["}),
        i(6, "Tab1Widget(), Tab2Widget(), Tab3Widget()"), t({"", "      ],", "    ),", "  ),", "});"}),
    }),

    -- Navigation with Navigator.push
    s("navpush", {
        t("Navigator.push("),
        t({"", "  context,", "  MaterialPageRoute("}),
        t({"    builder: (context) => "}), i(1, "NextPage"), t({",", "  ),", "});"}),
    }),

    -- Form Widget
    s("form", {
        t("Form("),
        t({"", "  key: "}), i(1, "_formKey"), t({",", "  child: Column(", "    children: ["}),
        i(2, "// Add TextFormFields here"), t({",", "      ElevatedButton(", "        onPressed: () {", "          if ("}), i(1, "_formKey"), t({".currentState!.validate()) {", "            // Process data", "          }", "        },", "        child: Text("}), i(3, "\"Submit\""), t("),", "      ),", "    ],", "  ),", "}),"}),
    }),

    -- ClipRRect with BorderRadius
    s("cliprrect", {
        t("ClipRRect("),
        t({"", "  borderRadius: BorderRadius.circular("}), i(1, "8.0"), t("),"),
        t({"", "  child: "}), i(2, "YourWidget"),
        t({",", "}),"}),
    }),

    -- SliverAppBar in a CustomScrollView
    s("sliverappbar", {
        t("CustomScrollView("),
        t({"", "  slivers: [", "    SliverAppBar("}),
        t({"      expandedHeight: "}), i(1, "200.0"), t({",", "      floating: true,", "      flexibleSpace: FlexibleSpaceBar(", "        title: Text("}), i(2, "\"Title\""), t("),"),
        t({"      ),", "    ),", "    SliverList(", "      delegate: SliverChildBuilderDelegate(", "        (context, index) => ListTile("}),
        t({"          title: Text(\"Item \$index\"),", "        ),", "        childCount: "}), i(3, "50"), t({",", "      ),", "    ),", "  ],", "}),"}),
    }),

    -- AspectRatio Widget
    s("aspectratio", {
        t("AspectRatio("),
        t({"", "  aspectRatio: "}), i(1, "16 / 9"), t(","),
        t({"", "  child: "}), i(2, "YourWidget"),
        t({",", "}),"}),
    }),

    -- Stack with Positioned Widgets
    s("stack", {
        t("Stack("),
        t({"", "  children: [", "    "}), i(1, "YourWidget"),
        t({",", "    Positioned(", "      top: "}), i(2, "10.0"), t({",", "      left: "}), i(3, "10.0"), t({",", "      child: "}), i(4, "AnotherWidget"), t({",", "    ),", "  ],", "}),"}),
    }),

    -- Provider State Management
    s("provider", {
        t("ChangeNotifierProvider("),
        t({"", "  create: (context) => "}), i(1, "YourNotifier()"), t({",", "  child: "}),
        i(2, "YourWidget()"), t({",", "}),"}),
    }),

    -- Consumer for Provider
    s("consumer", {
        t("Consumer<"), i(1, "YourNotifier"), t({">("}),
        t({"", "  builder: (context, "}), i(2, "notifier"), t({", child) {", "    return "}),
        i(3, "YourWidget()"), t({";", "  },", "}),"}),
    }),

    -- Animated Container
    s("animatedcontainer", {
        t("AnimatedContainer("),
        t({"", "  duration: Duration(milliseconds: "}), i(1, "300"), t({"),", "  curve: Curves."}), i(2, "easeInOut"), t({",", "  width: "}), i(3, "100.0"), t({",", "  height: "}), i(4, "100.0"), t({",", "  color: "}), i(5, "Colors.blue"), t({",", "  child: "}), i(6, "YourWidget()"), t({",", "});"}),
    }),

    -- FadeTransition
    s("fadetransition", {
        t("FadeTransition("),
        t({"", "  opacity: animation,", "  child: "}), i(1, "YourWidget()"),
        t({",", "});"}),
    }),

    -- StreamBuilder
    s("streambuilder", {
        t("StreamBuilder<"), i(1, "DataType"), t({">("}),
        t({"", "  stream: "}), i(2, "stream"), t({",", "  builder: (context, snapshot) {", "    if (!snapshot.hasData) {", "      return CircularProgressIndicator();", "    } else {", "      final data = snapshot.data;"}),
        t({"", "      return "}), i(3, "YourWidget(data)"), t({";", "    }", "  },", "});"}),
    }),

    -- ListView.builder
    s("listviewbuilder", {
        t("ListView.builder("),
        t({"", "  itemCount: "}), i(1, "10"), t({",", "  itemBuilder: (context, index) {", "    return "}),
        i(2, "ListTile(title: Text(\"Item \$index\"))"), t({";", "  },", "});"}),
    }),

    -- Draggable Widget
    s("draggable", {
        t("Draggable<"), i(1, "DataType"), t({">("}),
        t({"", "  data: "}), i(2, "YourData"), t({",", "  feedback: "}), i(3, "YourFeedbackWidget()"), t({",", "  child: "}), i(4, "YourChildWidget()"),
        t({",", "});"}),
    }),

    -- Custom Painter
    s("custompainter", {
        t("CustomPaint("),
        t({"", "  size: Size("}), i(1, "200"), t(", "), i(2, "200"), t({"),", "  painter: "}), i(3, "YourCustomPainter()"),
        t({",", "});"}),
    }),

    -- AlertDialog
    s("alertdialog", {
        t("showDialog("),
        t({"", "  context: context,", "  builder: (context) {", "    return AlertDialog("}),
        t({"      title: Text("}), i(1, "\"Title\""), t({"),", "      content: Text("}), i(2, "\"Content\""), t({"),", "      actions: [", "        TextButton("}),
        t({"          onPressed: () {", "            Navigator.of(context).pop();", "          },", "          child: Text("}), i(3, "\"OK\""), t({"),", "        ),", "      ],", "    );", "  },", "});"}),
    }),

    -- ExpansionTile
    s("expansiontile", {
        t("ExpansionTile("),
        t({"", "  title: Text("}), i(1, "\"Title\""), t({"),", "  children: [", "    "}), i(2, "YourWidget()"),
        t({",", "  ],", "});"}),
    }),

    -- DataTable
    s("datatable", {
        t("DataTable("),
        t({"", "  columns: [", "    DataColumn(label: Text("}), i(1, "\"Column1\""), t({")),", "    DataColumn(label: Text("}), i(2, "\"Column2\""), t({")),", "  ],", "  rows: [", "    DataRow(cells: ["}),
        t({"      DataCell(Text("}), i(3, "\"Cell1\""), t({")),", "      DataCell(Text("}), i(4, "\"Cell2\""), t({")),", "    ]),", "  ],", "});"}),
    }),

    -- PageView
    s("pageview", {
        t("PageView("),
        t({"", "  controller: "}), i(1, "PageController()"), t({",", "  children: [", "    "}), i(2, "Page1(), Page2(), Page3()"),
        t({",", "  ],", "});"}),
    }),

    -- Divider
    s("divider", {
        t("Divider("),
        t({"", "  color: "}), i(1, "Colors.black"), t({",", "  thickness: "}), i(2, "1.0"), t({",", "});"}),
    }),

    -- BlocProvider
    s("blocprovider", {
        t("BlocProvider("),
        t({"", "  create: (context) => "}), i(1, "YourBloc()"), t({",", "  child: "}),
        i(2, "YourWidget()"), t({",", "}),"}),
    }),

    -- BlocBuilder
    s("blocbuilder", {
        t("BlocBuilder<"), i(1, "YourBloc"), t(", "), i(2, "YourState"), t({">("}),
        t({"", "  builder: (context, state) {", "    if (state is "}), i(3, "LoadingState"), t({") {", "      return CircularProgressIndicator();", "    } else if (state is "}),
        i(4, "LoadedState"), t({") {", "      return "}), i(5, "YourWidget(state.data)"), t({";", "    } else {", "      return Text(\"Error\");", "    }", "  },", "});"}),
    }),

    -- BlocListener
    s("bloclistener", {
        t("BlocListener<"), i(1, "YourBloc"), t(", "), i(2, "YourState"), t({">("}),
        t({"", "  listener: (context, state) {", "    if (state is "}), i(3, "SuccessState"), t({") {", "      // Handle success", "    } else if (state is "}),
        i(4, "ErrorState"), t({") {", "      // Handle error", "    }", "  },", "  child: "}), i(5, "YourWidget()"), t({",", "});"}),
    }),

    -- BlocConsumer
    s("blocconsumer", {
        t("BlocConsumer<"), i(1, "YourBloc"), t(", "), i(2, "YourState"), t({">("}),
        t({"", "  listener: (context, state) {", "    if (state is "}), i(3, "ErrorState"), t({") {", "      // Handle error", "    }", "  },", "  builder: (context, state) {", "    if (state is "}),
        i(4, "LoadingState"), t({") {", "      return CircularProgressIndicator();", "    } else if (state is "}),
        i(5, "LoadedState"), t({") {", "      return "}), i(6, "YourWidget(state.data)"), t({";", "    } else {", "      return Text(\"Error\");", "    }", "  },", "});"}),
    }),

    -- GoRouter Setup
    s("gorouter", {
        t("final GoRouter _router = GoRouter("),
        t({"", "  routes: [", "    GoRoute("}),
        t({"      path: '/'", ",", "      builder: (context, state) => "}), i(1, "HomeScreen()"), t({",", "    ),", "    GoRoute("}),
        t({"      path: '/details'", ",", "      builder: (context, state) => "}), i(2, "DetailsScreen()"), t({",", "    ),", "  ],", "});"}),
    }),

    -- GoRouter Navigation
    s("goroute", {
        t("context.go("), t("'"), i(1, "/yourpath"), t({"');"}),
    }),

    -- GoRouter Navigation with Parameters
    s("gorouteparam", {
        t("context.go("), t("'"), i(1, "/details"), t("?id="), i(2, "123"), t({"');"}),
    }),

    -- Bloc Event
    s("blocevent", {
        t("abstract class "), i(1, "YourEvent"), t({" extends Equatable {", "  const "}), i(1, "YourEvent"), t("();"),
        t({"", "  @override", "  List<Object> get props => [];"}),
        t({"", "}", "", "class "}), i(2, "SpecificEvent"), t({" extends "}), i(1, "YourEvent"), t({" {", "  const "}), i(2, "SpecificEvent"), t("();", "}"),
    }),

    -- Bloc State
    s("blocstate", {
        t("abstract class "), i(1, "YourState"), t({" extends Equatable {", "  const "}), i(1, "YourState"), t("();"),
        t({"", "  @override", "  List<Object> get props => [];"}),
        t({"", "}", "", "class "}), i(2, "InitialState"), t({" extends "}), i(1, "YourState"), t({" {", "  const "}), i(2, "InitialState"), t("();", "}"),
    }),

    -- GoRouter State Extension
    s("gorouterextension", {
        t("extension GoRouterStateExtension on GoRouterState {"),
        t({"", "  String? getParam(String key) => queryParams[key];", "}"}),
    }),

    -- Loading Indicator Widget
    s("loading", {
        t("Center("),
        t({"", "  child: CircularProgressIndicator(),", "});"}),
    }),

    -- Padding Widget
    s("padding", {
        t("Padding("),
        t({"", "  padding: EdgeInsets.all("}), i(1, "8.0"), t({"),", "  child: "}), i(2, "YourWidget()"), t({",", "});"}),
    }),

    -- InkWell (for Clickable Widgets)
    s("inkwell", {
        t("InkWell("),
        t({"", "  onTap: () {", "    "}), i(1, "// Handle tap"), t({"", "  },", "  child: "}), i(2, "YourWidget()"), t({",", "});"}),
    }),

    -- Freezed Bloc Event Class
    s("freezed_event", {
        t({"import 'package:freezed_annotation/freezed_annotation.dart';", ""}),
        t({"part '"}), i(1, "your_bloc_event"), t({".freezed.dart';", ""}),
        t({"", "@freezed", "abstract class "}), i(2, "YourEvent"), t({" with _$"}), i(2, "YourEvent"), t({" {", ""}),
        t({"  const factory "}), i(2, "YourEvent"), t({"."}), i(3, "eventName"), t({"() = _"}), i(3, "EventName"), t({";", "}"}),
    }),

    -- Freezed Bloc State Class
    s("freezed_state", {
        t({"import 'package:freezed_annotation/freezed_annotation.dart';", ""}),
        t({"part '"}), i(1, "your_bloc_state"), t({".freezed.dart';", ""}),
        t({"", "@freezed", "abstract class "}), i(2, "YourState"), t({" with _$"}), i(2, "YourState"), t({" {", ""}),
        t({"  const factory "}), i(2, "YourState"), t({"."}), i(3, "initial"), t({"() = _"}), i(3, "Initial"), t({";", ""}),
        t({"  const factory "}), i(2, "YourState"), t({"."}), i(4, "loading"), t({"() = _"}), i(4, "Loading"), t({";", ""}),
        t({"}"}),
    }),

    -- Column Widget
    s("column", {
        t("Column("),
        t({"", "  children: [", "    "}), i(1, "YourWidget()"), t({",", "  ],", "});"}),
    }),

    -- Row Widget
    s("row", {
        t("Row("),
        t({"", "  mainAxisAlignment: MainAxisAlignment."}), i(1, "start"), t({",", "  children: [", "    "}), i(2, "YourWidget()"), t({",", "  ],", "});"}),
    }),

    -- Expanded Widget
    s("expanded", {
        t("Expanded("),
        t({"", "  child: "}), i(1, "YourWidget()"), t({",", "});"}),
    }),

    -- ListView.builder
    s("listview", {
        t("ListView.builder("),
        t({"", "  itemCount: "}), i(1, "itemCount"), t({",", "  itemBuilder: (context, index) {", "    return "}),
        i(2, "YourWidget()"), t({";", "  },", "});"}),
    }),

    -- StreamBuilder for Bloc Streams
    s("streambuilder", {
        t("StreamBuilder<"), i(1, "YourType"), t({">("}),
        t({"", "  stream: "}), i(2, "yourStream"), t({",", "  builder: (context, snapshot) {", "    if (snapshot.connectionState == ConnectionState.waiting) {", "      return CircularProgressIndicator();", "    } else if (snapshot.hasData) {", "      return "}),
        i(3, "YourWidget(snapshot.data)"), t({";", "    } else {", "      return Text(\"No data available\");", "    }", "  },", "});"}),
    }),

    -- Custom Stateless Widget
    s("stateless", {
        t("class "), i(1, "MyWidget"), t(" extends StatelessWidget {"),
        t({"", "  const "}), i(1, "MyWidget"), t("({Key? key}) : super(key: key);"),
        t({"", "", "  @override", "  Widget build(BuildContext context) {", "    return "}),
        i(2, "Container()"), t({";", "  }", "}"}),
    }),

    -- Custom Stateful Widget
    s("stateful", {
        t("class "), i(1, "MyWidget"), t(" extends StatefulWidget {"),
        t({"", "  const "}), i(1, "MyWidget"), t("({Key? key}) : super(key: key);"),
        t({"", "  @override", "  State<"}), i(1, "MyWidget"), t("> createState() => _"),
        i(1, "MyWidget"), t("State();", "}"),
        t({"", "class _"}), i(1, "MyWidget"), t("State extends State<"), i(1, "MyWidget"),
        t({"> {", "  @override", "  Widget build(BuildContext context) {", "    return "}),
        i(2, "Container()"), t(";", "  }", "}"),
    }),

    -- Navigator.push
    s("navigator", {
        t("Navigator.push("),
        t({"", "  context,", "  MaterialPageRoute(", "    builder: (context) => "}), i(1, "YourScreen()"), t({",", "  ),", ");"}),
    }),

    -- Navigator.pop
    s("navigatorpop", {
        t("Navigator.pop("),
        t({"context", ");"}),
    }),

    -- MediaQuery for Responsive Layout
    s("mediaquery", {
        t("MediaQuery.of(context).size."),
        i(1, "width"), t(" * "), i(2, "0.8"),
    }),

    -- AspectRatio Widget
    s("aspectratio", {
        t("AspectRatio("),
        t({"", "  aspectRatio: "}), i(1, "16 / 9"), t({",", "  child: "}), i(2, "YourWidget()"), t({",", "});"}),
    }),

    -- TextFormField with Validator
    s("textformfield", {
        t("TextFormField("),
        t({"", "  controller: "}), i(1, "yourController"), t({",", "  decoration: InputDecoration("}),
        t({"", "    labelText: "}), i(2, "'Your Label'"), t({",", "  ),", "  validator: (value) {", "    if (value == null || value.isEmpty) {", "      return 'This field cannot be empty';", "    }", "    return null;", "  }", "});"}),
    }),

    -- ChangeNotifier for Provider
    s("changemodel", {
        t("class "), i(1, "YourModel"), t(" extends ChangeNotifier {"),
        t({"", "  String _value = '';", "", "  String get value => _value;", "  set value(String newValue) {", "    _value = newValue;", "    notifyListeners();", "  }", "}"}),
    }),

    -- Consumer for Provider
    s("consumer", {
        t("Consumer<"), i(1, "YourModel"), t({">("}),
        t({"", "  builder: (context, model, child) {", "    return "}), i(2, "YourWidget()"), t({";", "  },", "});"}),
    }),

    -- AnimationController for simple animations
s("animationcontroller", {
    t("class "), i(1, "YourAnimation"), t(" extends StatefulWidget {"),
    t({"", "  const "}), i(2, "YourAnimation"), 
    t("({Key? key}) : super(key: key);", "", 
       "  @override", "  _YourAnimationState createState() => _YourAnimationState();", "}"}),
    t({"", "class _"}), i(3, "YourAnimationState"), t(" extends State<"), i(4, "YourAnimation"), t("> {"),
    t({"", "  late AnimationController _controller;", "  late Animation<double> _animation;", "", 
       "  @override", "  void initState() {", "    super.initState();", 
       "    _controller = AnimationController(", "      vsync: this,", 
       "      duration: const Duration(seconds: 2),", "    );", 
       "    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);", 
       "    _controller.repeat(reverse: true);", "  }", "", 
       "  @override", "  Widget build(BuildContext context) {", 
       "    return AnimatedBuilder(", "      animation: _animation,", 
       "      builder: (context, child) {", 
       "        return Opacity(", "          opacity: _animation.value,", 
       "          child: YourWidget(),", "        );", "      },", 
       "    );", "  }", "}"})
}),
    -- InheritedWidget for data passing
    s("inheritedwidget", {
        t("class "), i(1, "YourInheritedWidget"), t(" extends InheritedWidget {"),
        t({"", "  final String data;", "", "  const "}), i(1, "YourInheritedWidget"), t({"({Key? key, required this.data, required Widget child}) : super(key: key, child: child);", "", "  static YourInheritedWidget? of(BuildContext context) {", "    return context.dependOnInheritedWidgetOfExactType<YourInheritedWidget>();", "  }", "", "  @override", "  bool updateShouldNotify(covariant InheritedWidget oldWidget) {", "    return true;", "  }", "}"}),
    }),

    -- FadeTransition Example
    s("fadetransition", {
        t("FadeTransition("),
        t({"", "  opacity: "}), i(1, "yourAnimation"), t({",", "  child: "}), i(2, "YourWidget()"), t({",", "});"}),
    }),

    -- SlideTransition Example
    s("slidetransition", {
        t("SlideTransition("),
        t({"", "  position: "}), i(1, "yourAnimation"), t({",", "  child: "}), i(2, "YourWidget()"), t({",", "});"}),
    }),

    -- Hero Widget for Transitions
    s("hero", {
        t("Hero("),
        t({"", "  tag: 'yourTag',", "  child: "}), i(1, "YourWidget()"), t({",", "});"}),
    }),

    -- Drawer Navigation
    s("drawer", {
        t("Drawer("),
        t({"", "  child: ListView(", "    children: ["}),
        t({"", "      ListTile(", "        title: Text('Item 1'),", "        onTap: () {", "          Navigator.pop(context);", "        },", "      ),"}),
        t({"", "      ListTile(", "        title: Text('Item 2'),", "        onTap: () {", "          Navigator.pop(context);", "        },", "      ),"}),
        t({"", "    ],", "  ),", "});"}),
    }),

    -- Scaffold with AppBar and Body
    s("scaffold", {
        t("Scaffold("),
        t({"", "  appBar: AppBar(", "    title: Text('Your App'),", "  ),", "  body: "}), i(1, "YourBodyWidget()"), t({",", "});"}),
    }),

    -- Padding and ElevatedButton
    s("elevatedbutton", {
        t("Padding("),
        t({"", "  padding: EdgeInsets.all(16.0),", "  child: ElevatedButton("}),
        t({"", "    onPressed: () {", "      // Handle Press", "    },", "    child: "}), i(1, "Text('Click Me')"), t({",", "  ),", "});"}),
    }),

    -- Container with BoxDecoration
    s("container", {
        t("Container("),
        t({"", "  decoration: BoxDecoration(", "    color: Colors.blue,", "    borderRadius: BorderRadius.circular(8.0),", "  ),", "  child: "}), i(1, "YourWidget()"), t({",", "});"}),
    }),

    -- Positioned Widget inside Stack
    s("positioned", {
        t("Positioned("),
        t({"", "  top: "}), i(1, "20.0"), t({",", "  left: "}), i(2, "30.0"), t({",", "  child: "}), i(3, "YourWidget()"), t({",", "});"}),
    }),

    -- Stack Widget
    s("stack", {
        t("Stack("),
        t({"", "  children: [", "    "}), i(1, "YourWidget()"), t({",", "  ],", "});"}),
    }),
}
