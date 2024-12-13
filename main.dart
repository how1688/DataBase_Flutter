import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

// 帳號皆為admin  
// 密碼皆為1234
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '高雄大學激發學生創意競賽管理系統',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'images/leftpose.png',
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Text(
                  '高雄大學激發學生創意競賽管理系統',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 底部選單左右間距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(context, '管理員系統', Page1()),
                _buildNavButton(context, '學生系統', Page2()),
                _buildNavButton(context, '指導老師系統', Page3()),
                _buildNavButton(context, '評審系統', Page4()),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 面包屑導航
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // 在此實現首頁導航邏輯
                    print("導航到首頁");
                  },
                  child: const Text(  
                    "公告資訊",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const Text(
                  " / ",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    // 在此實現公告頁導航邏輯
                    print("導航到公告頁");
                  },
                  child: const Text(
                    "得獎名單",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 公告標題
            Text(
              "公告",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 3,
              ),
            ),
            Text(
              "\n下一個夢想實踐家就是你!"
              "\n跨出創新道路，釋放創意潛能，點燃創業夢想，"
              "\n透過業師助陣的系列工作坊，你將學會如何將創意轉化為可行計劃，"
              "\n並在競賽中驗證你的實力，成為未來市場上不可或缺的創新人才！",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
    ),
    );
  }

  // 建立導航按鈕
  Widget _buildNavButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

// 以下為不同頁面的範例
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('管理員登入系統')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '用戶名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入用戶名';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '密碼'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入密碼';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('登入'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // 假設驗證邏輯 (可替換為 API 驗證)
      if (username == 'admin' && password == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => adminSystem()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登入失敗'),
            content: Text('用戶名或密碼錯誤'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('確定'),
              ),
            ],
          ),
        );
      }
    }
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'images/leftpose.png',
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Text(
                  '高雄大學激發學生創意競賽管理系統',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 底部選單左右間距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(context, '登入', Page5()),
                _buildNavButton(context, '報名', register()),
                _buildNavButton(context, '瀏覽歷屆作品', History()),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 面包屑導航
            const SizedBox(height: 10),
            // 公告標題
            Text(
              "\n請點選上方導覽列進行報名或登入",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 3,
              ),
            ),
          ],
        ),
    ),
    );
  }

  // 建立導航按鈕
  Widget _buildNavButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('指導老師登入系統')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '用戶名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入用戶名';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '密碼'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入密碼';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('登入'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // 假設驗證邏輯 (可替換為 API 驗證)
      if (username == 'admin' && password == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => teacherSystem()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登入失敗'),
            content: Text('用戶名或密碼錯誤'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('確定'),
              ),
            ],
          ),
        );
      }
    }
  }
}

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('評審登入系統')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '用戶名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入用戶名';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '密碼'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入密碼';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('登入'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // 假設驗證邏輯 (可替換為 API 驗證)
      if (username == 'admin' && password == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => judgeSystem()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登入失敗'),
            content: Text('用戶名或密碼錯誤'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('確定'),
              ),
            ],
          ),
        );
      }
    }
  }
}

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('學生登入系統')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '用戶名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入用戶名';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '密碼'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入密碼';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('登入'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // 假設驗證邏輯 (可替換為 API 驗證)
      if (username == 'admin' && password == '1234') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => teacherSystem()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登入失敗'),
            content: Text('用戶名或密碼錯誤'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('確定'),
              ),
            ],
          ),
        );
      }
    }
  }
}

class adminSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'images/leftpose.png',
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Text(
                  '高雄大學激發學生創意競賽管理系統',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 底部選單左右間距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(context, '查詢學生資料', LOOK_STU()),
                _buildNavButton(context, '修改報名資料', EDIT_STU()),
                _buildNavButton(context, '評審資料', LOOK_JUD()),
                _buildNavButton(context, '查看評分資料', LOOK_SCORE()),
                _buildNavButton(context, '公告重要事項', announce()),
                // _buildNavButton(context, '評分資料', Page5()),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 面包屑導航
            const SizedBox(height: 10),
            // 公告標題
            Text(
              "歡迎林老虎管理員",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 3,
              ),
            ),
            Text(
              "\n請點選上方導覽列進行操作",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
    ),
    );
  }

  // 建立導航按鈕
  Widget _buildNavButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class teacherSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'images/leftpose.png',
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Text(
                  '高雄大學激發學生創意競賽管理系統',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 底部選單左右間距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(context, '指導學生作品', Instrctor_work()),
                _buildNavButton(context, '歷屆作品', History()),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // 公告標題
            Text(
              "歡迎XC指導老師",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 3,
              ),
            ),
          ],
        ),
    ),
    );
  }

  // 建立導航按鈕
  Widget _buildNavButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class judgeSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'images/leftpose.png',
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Text(
                  '高雄大學激發學生創意競賽管理系統',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 底部選單左右間距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(context, '填寫評分資料', Rate()),
                _buildNavButton(context, '修改評分資料', Edit_Rate()),
                _buildNavButton(context, '歷屆作品', History()),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // 公告標題
            Text(
              "歡迎呵呵宇評審",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 3,
              ),
            ),
          ],
        ),
    ),
    );
  }

  // 建立導航按鈕
  Widget _buildNavButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '報名系統',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Declare controllers for input fields
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _posterController = TextEditingController();
  final TextEditingController _ytLinkController = TextEditingController();
  final TextEditingController _ghLinkController = TextEditingController();

  List<TextEditingController> nameControllers = List.generate(4, (_) => TextEditingController());
  List<TextEditingController> departmentControllers = List.generate(4, (_) => TextEditingController());
  List<TextEditingController> phoneControllers = List.generate(4, (_) => TextEditingController());
  List<TextEditingController> emailControllers = List.generate(4, (_) => TextEditingController());
  List<TextEditingController> gradeControllers = List.generate(4, (_) => TextEditingController());
  List<TextEditingController> idControllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    _teamNameController.dispose();
    _descriptionController.dispose();
    _posterController.dispose();
    _ytLinkController.dispose();
    _ghLinkController.dispose();
    for (var controller in nameControllers +
        departmentControllers +
        phoneControllers +
        emailControllers +
        gradeControllers +
        idControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Collect all entered data
      final teamName = _teamNameController.text;
      final description = _descriptionController.text;
      final posterLink = _posterController.text;
      final ytLink = _ytLinkController.text;
      final ghLink = _ghLinkController.text;

      List<Map<String, String>> members = List.generate(4, (index) {
        return {
          "name": nameControllers[index].text,
          "department": departmentControllers[index].text,
          "phone": phoneControllers[index].text,
          "email": emailControllers[index].text,
          "grade": gradeControllers[index].text,
          "id": idControllers[index].text,
        };
      });

      // Log the data or send it to backend
      print("隊伍名稱: $teamName");
      print("說明書: $description");
      print("海報連結: $posterLink");
      print("YouTube 連結: $ytLink");
      print("學生資料: ");
      for (var member in members) {
        print(member);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('報名成功！')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('報名系統'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 報名基本資訊區塊
              TextFormField(
                controller: _teamNameController,
                decoration: InputDecoration(labelText: '隊伍名稱'),
                validator: (value) => value!.isEmpty ? '請輸入隊伍名稱' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: '說明書'),
                validator: (value) => value!.isEmpty ? '請輸入說明書內容' : null,
              ),
              TextFormField(
                controller: _posterController,
                decoration: InputDecoration(labelText: '海報連結'),
                validator: (value) => value!.isEmpty ? '請輸入海報連結' : null,
              ),
              TextFormField(
                controller: _ytLinkController,
                decoration: InputDecoration(labelText: 'YouTube 連結'),
                validator: (value) => value!.isEmpty ? '請輸入YouTube 連結' : null,
              ),
              TextFormField(
                controller: _ghLinkController,
                decoration: InputDecoration(labelText: 'Github 連結'),
                validator: (value) => value!.isEmpty ? '請輸入Github 連結' : null,
              ),
              Divider(),
              // 學生資訊輸入欄位
              Text(
                '請填寫四位學生資訊',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < 4; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('學生 ${i + 1}'),
                    TextFormField(
                      controller: nameControllers[i],
                      decoration: InputDecoration(labelText: '姓名'),
                      validator: (value) => value!.isEmpty ? '請輸入姓名' : null,
                    ),
                    TextFormField(
                      controller: departmentControllers[i],
                      decoration: InputDecoration(labelText: '科系'),
                      validator: (value) => value!.isEmpty ? '請輸入科系' : null,
                    ),
                    TextFormField(
                      controller: phoneControllers[i],
                      decoration: InputDecoration(labelText: '電話'),
                      validator: (value) => value!.isEmpty ? '請輸入電話' : null,
                    ),
                    TextFormField(
                      controller: emailControllers[i],
                      decoration: InputDecoration(labelText: '電子郵件'),
                      validator: (value) => value!.isEmpty ? '請輸入電子郵件' : null,
                    ),
                    TextFormField(
                      controller: gradeControllers[i],
                      decoration: InputDecoration(labelText: '年級'),
                      validator: (value) => value!.isEmpty ? '請輸入年級' : null,
                    ),
                    TextFormField(
                      controller: idControllers[i],
                      decoration: InputDecoration(labelText: '學號'),
                      validator: (value) => value!.isEmpty ? '請輸入學號' : null,
                    ),
                    Divider(),
                  ],
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('提交'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 
class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '瀏覽歷屆作品',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BrowseWorksPage(),
    );
  }
}

class BrowseWorksPage extends StatefulWidget {
  @override
  _BrowseWorksPageState createState() => _BrowseWorksPageState();
}

class _BrowseWorksPageState extends State<BrowseWorksPage> {
  int? selectedYear = 100; // 預設選擇 100 年
  List<Map<String, String>> works = [];

  // 模擬歷屆作品資料，這裡以年份為鍵，存儲對應的作品資料
  final Map<int, List<Map<String, String>>> yearWorks = {
    100: [
      {"group": "隊伍A", "description": "作品A說明書"},
      {"group": "隊伍B", "description": "作品B說明書"},
    ],
    101: [
      {"group": "隊伍C", "description": "作品C說明書"},
      {"group": "隊伍D", "description": "作品D說明書"},
    ],
    // 可以繼續擴充資料
    102: [
      {"group": "隊伍E", "description": "作品E說明書"},
      {"group": "隊伍F", "description": "作品F說明書"},
    ],
    // ...
  };

  @override
  void initState() {
    super.initState();
    _loadWorks(selectedYear!);
  }

  // 根據選擇的年份加載資料
  void _loadWorks(int year) {
    setState(() {
      works = yearWorks[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('瀏覽歷屆作品'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 下拉選單選擇年份
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  _loadWorks(newValue!);
                });
              },
              items: List.generate(15, (index) {
                int year = 100 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text('$year 年'),
                );
              }),
            ),
            SizedBox(height: 20),
            // 顯示作品資料的表格
            works.isEmpty
                ? Text('該年份沒有資料。')
                : Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '組別名稱',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '說明書',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // 顯示每一組的資料
                      for (var work in works)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(work["group"]!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(work["description"]!),
                            ),
                          ],
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class Instrctor_work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '瀏覽指導學生作品',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: STUWorksPage(),
    );
  }
}

class STUWorksPage extends StatelessWidget {
  // 單組資料
  final Map<String, String> work = {
    "group": "隊伍A",
    "description": "作品A說明書"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('瀏覽指導學生作品'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 顯示作品資料的表格
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '組別名稱',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '說明書',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(work["group"]!),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(work["description"]!),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class announce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '公告重要事項',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnnouncementPage(),
    );
  }
}

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  List<Map<String, String>> announcements = [];
  File? selectedImageFile; // 存放圖片預覽
  File? selectedFile; // 存放檔案

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  // 上傳圖片選擇
  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImageFile = File(pickedFile.path);
      });
    }
  }

  // 選擇檔案
  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _addAnnouncement() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新增公告'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: '標題'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: '內容'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('選擇圖片'),
              ),
              if (selectedImageFile != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.file(
                    selectedImageFile!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('選擇檔案'),
              ),
              if (selectedFile != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '已選擇檔案: ${selectedFile!.path.split('/').last}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty &&
                  _contentController.text.isNotEmpty) {
                setState(() {
                  announcements.add({
                    "title": _titleController.text,
                    "content": _contentController.text,
                    "image": selectedImageFile?.path ?? '',
                    "file": selectedFile?.path ?? '',
                  });
                });
                _titleController.clear();
                _contentController.clear();
                selectedImageFile = null;
                selectedFile = null;
                Navigator.of(context).pop();
              }
            },
            child: Text('新增'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公告重要事項'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _addAnnouncement,
            child: Text('新增公告'),
          ),
          SizedBox(height: 10),
          Expanded(
            child: announcements.isEmpty
                ? Center(
                    child: Text('目前沒有公告'),
                  )
                : ListView.builder(
                    itemCount: announcements.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(announcements[index]['title'] ?? ''),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(announcements[index]['content'] ?? ''),
                            if (announcements[index]['image'] != '')
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.file(
                                  File(announcements[index]['image']!),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (announcements[index]['file'] != '')
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '檔案: ${announcements[index]['file']!.split('/').last}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class LOOK_STU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '查詢學生資料',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BrowseWorksPage_STU(),
    );
  }
}

class BrowseWorksPage_STU extends StatefulWidget {
  @override
  _BrowseWorksPageState_STU createState() => _BrowseWorksPageState_STU();
}

class _BrowseWorksPageState_STU extends State<BrowseWorksPage_STU> {
  int? selectedYear = 100; // 預設選擇 100 年
  List<Map<String, String>> works = [];

  // 模擬歷屆作品資料，這裡以年份為鍵，存儲對應的作品資料
  final Map<int, List<Map<String, String>>> yearWorks = {
    100: [
      {"group": "隊伍A"},
      {"group": "隊伍B"},
    ],
    101: [
      {"group": "隊伍C"},
      {"group": "隊伍D"},
    ],
    // 可以繼續擴充資料
    102: [
      {"group": "隊伍E"},
      {"group": "隊伍F"},
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadWorks(selectedYear!);
  }

  // 根據選擇的年份加載資料
  void _loadWorks(int year) {
    setState(() {
      works = yearWorks[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查詢學生資料'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 下拉選單選擇年份
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  _loadWorks(newValue!);
                });
              },
              items: List.generate(15, (index) {
                int year = 100 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text('$year 年'),
                );
              }),
            ),
            SizedBox(height: 20),
            // 顯示組別名稱的超連結
            works.isEmpty
                ? Text('該年份沒有資料。')
                : Expanded(
                    child: ListView(
                      children: works.map((work) {
                        return ListTile(
                          title: GestureDetector(
                            onTap: () {
                              // 在這裡實作點擊超連結的邏輯，例如跳轉到詳細資訊頁面
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkDetailPage(
                                    groupName: work["group"]!,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              work["group"]!,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// 詳細資訊頁面
class WorkDetailPage extends StatelessWidget {
  final String groupName;

  WorkDetailPage({required this.groupName});

  @override
  Widget build(BuildContext context) {
    // 模擬學生資料
    final List<Map<String, String>> students = [
      {"name": "學生A", "id": "11001"},
      {"name": "學生B", "id": "11002"},
      {"name": "學生C", "id": "11003"},
      {"name": "學生D", "id": "11004"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('詳細資訊'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '組別名稱: $groupName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('姓名', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('學號', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                for (var student in students)
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(student["name"]!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(student["id"]!),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class EDIT_STU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '修改學生資料',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BrowseWorksPage_STU(),
    );
  }
}

class LOOK_JUD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '查詢評審資料',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BrowseWorksPage_JUD(),
    );
  }
}

class BrowseWorksPage_JUD extends StatefulWidget {
  @override
  _BrowseWorksPageState_JUD createState() => _BrowseWorksPageState_JUD();
}

class _BrowseWorksPageState_JUD extends State<BrowseWorksPage_JUD> {
  int? selectedYear = 100; // 預設選擇 100 年
  List<Map<String, String>> judges = [];

  // 模擬歷屆評審資料，這裡以年份為鍵，存儲對應的評審資料
  final Map<int, List<Map<String, String>>> yearJudges = {
    100: [
      {"name": "評審A", "profession": "教授"},
      {"name": "評審B", "profession": "工程師"},
    ],
    101: [
      {"name": "評審C", "profession": "設計師"},
      {"name": "評審D", "profession": "企業家"},
    ],
    // 可以繼續擴充資料
    102: [
      {"name": "評審E", "profession": "研究員"},
      {"name": "評審F", "profession": "律師"},
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadJudges(selectedYear!);
  }

  // 根據選擇的年份加載資料
  void _loadJudges(int year) {
    setState(() {
      judges = yearJudges[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查詢評審資料'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 下拉選單選擇年份
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  _loadJudges(newValue!);
                });
              },
              items: List.generate(15, (index) {
                int year = 100 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text('$year 年'),
                );
              }),
            ),
            SizedBox(height: 20),
            // 顯示評審資料的表格
            judges.isEmpty
                ? Text('該年份沒有資料。')
                : Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '評審名字',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '職業',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // 顯示每位評審的資料
                      for (var judge in judges)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(judge["name"]!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(judge["profession"]!),
                            ),
                          ],
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class LOOK_SCORE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '查詢評分資料',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BrowseWorksPage_SCORE(),
    );
  }
}

class BrowseWorksPage_SCORE extends StatefulWidget {
  @override
  _BrowseWorksPageState_SCORE createState() => _BrowseWorksPageState_SCORE();
}

class _BrowseWorksPageState_SCORE extends State<BrowseWorksPage_SCORE> {
  int? selectedYear = 100; // 預設選擇 100 年
  List<Map<String, String>> judges = [];

  // 模擬歷屆評分資料，這裡以年份為鍵，存儲對應的評分資料
  final Map<int, List<Map<String, String>>> yearJudges = {
    100: [
      {"name": "評審A", "score": "85"},
      {"name": "評審B", "score": "90"},
    ],
    101: [
      {"name": "評審C", "score": "88"},
      {"name": "評審D", "score": "92"},
    ],
    // 可以繼續擴充資料
    102: [
      {"name": "評審E", "score": "87"},
      {"name": "評審F", "score": "89"},
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadJudges(selectedYear!);
  }

  // 根據選擇的年份加載資料
  void _loadJudges(int year) {
    setState(() {
      judges = yearJudges[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查詢評分資料'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 下拉選單選擇年份
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  _loadJudges(newValue!);
                });
              },
              items: List.generate(15, (index) {
                int year = 100 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text('$year 年'),
                );
              }),
            ),
            SizedBox(height: 20),
            // 顯示評分資料的表格
            judges.isEmpty
                ? Text('該年份沒有資料。')
                : Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '評審名字',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '評分',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // 顯示每位評審的資料
                      for (var judge in judges)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(judge["name"]!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(judge["score"]!),
                            ),
                          ],
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class Rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '評分頁面',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RatingPage(),
    );
  }
}

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int? selectedYear = 100; // 預設選擇 100 年
  List<Map<String, dynamic>> groups = [];

  // 模擬資料
  final Map<int, List<Map<String, dynamic>>> yearGroups = {
    100: [
      {"group": "隊伍A", "score": null},
      {"group": "隊伍B", "score": null},
    ],
    101: [
      {"group": "隊伍C", "score": null},
      {"group": "隊伍D", "score": null},
    ],
    102: [
      {"group": "隊伍E", "score": null},
      {"group": "隊伍F", "score": null},
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadGroups(selectedYear!);
  }

  void _loadGroups(int year) {
    setState(() {
      groups = yearGroups[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('評分頁面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 下拉選單選擇年份
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  _loadGroups(newValue!);
                });
              },
              items: List.generate(15, (index) {
                int year = 100 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text('$year 年'),
                );
              }),
            ),
            SizedBox(height: 20),
            // 顯示組別和可填寫的分數
            groups.isEmpty
                ? Text('該年份沒有資料。')
                : Expanded(
                    child: ListView.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(group['group']),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: '分數',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      group['score'] = int.tryParse(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Edit_Rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '修改評分頁面',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ERatingPage(),
    );
  }
}

class ERatingPage extends StatefulWidget {
  @override
  _ERatingPageState createState() => _ERatingPageState();
}

class _ERatingPageState extends State<ERatingPage> {
  int? selectedYear = 100; // 預設選擇 100 年
  List<Map<String, dynamic>> groups = [];

  // 模擬資料
  final Map<int, List<Map<String, dynamic>>> yearGroups = {
    100: [
      {"group": "隊伍A", "score": 80},
      {"group": "隊伍B", "score": 70},
    ],
    101: [
      {"group": "隊伍C", "score": null},
      {"group": "隊伍D", "score": null},
    ],
    102: [
      {"group": "隊伍E", "score": null},
      {"group": "隊伍F", "score": null},
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadGroups(selectedYear!);
  }

  void _loadGroups(int year) {
    setState(() {
      groups = yearGroups[year] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('評分頁面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 下拉選單選擇年份
            DropdownButton<int>(
              value: selectedYear,
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue;
                  _loadGroups(newValue!);
                });
              },
              items: List.generate(15, (index) {
                int year = 100 + index;
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text('$year 年'),
                );
              }),
            ),
            SizedBox(height: 20),
            // 顯示組別和可填寫的分數
            groups.isEmpty
                ? Text('該年份沒有資料。')
                : Expanded(
                    child: ListView.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(group['group']),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: '分數',
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                    text: group['score']?.toString() ?? '',
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      group['score'] = int.tryParse(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
