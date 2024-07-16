import 'dart:math'; // استيراد مكتبة dart:math لاستخدام Random()
import 'package:flutter/material.dart'; // استيراد مكتبة flutter/material لاستخدام مكونات Flutter

void main() {
  runApp(MyApp()); // تشغيل التطبيق باستخدام MyApp كنقطة انطلاق رئيسية
}

class MyApp extends StatefulWidget {
  // كلاس MyApp كـ StatefulWidget لإدارة حالة داخلية
  @override
  _MyAppState createState() => _MyAppState(); // إنشاء حالة داخلية لـ MyApp
}

class _MyAppState extends State<MyApp> {
  // كلاس _MyAppState يمثل الحالة الداخلية لـ MyApp
  final List<String> images = [
    // قائمة من المسارات للصور المستخدمة
    'images/ball1.png',
    'images/ball2.png',
    'images/ball3.png',
    'images/ball4.png',
    'images/ball5.png',
  ];
  String currentImage = 'images/ball1.png'; // الصورة الحالية المُعروضة

  @override
  Widget build(BuildContext context) {
    // دالة build تبني واجهة المستخدم للتطبيق
    return MaterialApp(
      // إنشاء تطبيق MaterialApp
      title: 'Ask Me Question', // عنوان التطبيق
      home: Scaffold(
        // استخدام Scaffold كهيكل رئيسي للصفحة
      
        backgroundColor: Colors.blueAccent, // تعيين لون الخلفية بلون blue
        appBar: AppBar(
          // إضافة AppBar كشريط عنوان للصفحة
          title: Text('Ask Me Question'), // عنوان الشريط
          backgroundColor: Colors.blueGrey, // تعيين لون خلفية الشريط
          centerTitle: true, // توسيط عنوان الشريط
        ),
        body: SafeArea(
          // استخدام SafeArea لتجنب التداخل مع الشريط العلوي للجهاز
          child: Center(
            // عنصر وسطي لتركيز المحتوى في الشاشة
            child: GestureDetector(
              // عنصر GestureDetector للاستجابة للنقرات
              onTap: () {
                // التفاعل عند النقر على العنصر
                int randomIndex = Random()
                    .nextInt(images.length); // توليد رقم عشوائي لاختيار صورة
                setState(() {
                  // تحديث الحالة لإعادة بناء واجهة المستخدم
                  currentImage =
                      images[randomIndex]; // تعيين الصورة الحالية المُعروضة
                  print(currentImage);//طباعة الصورة التي تم عرضها
                });
              },
              child: Row(
                // صف أفقي يحتوي على العناصر المركزة في المنتصف
                mainAxisAlignment:
                    MainAxisAlignment.center, // توسيط العناصر في الصف
                children: <Widget>[
                  Container(
                    // استخدام Container لتحديد حجم وخصائص الصورة
                    width: 445, // عرض الصورة بـ 400 بكسل
                    height: 400, // ارتفاع الصورة بـ 400 بكسل
                    decoration: BoxDecoration(
                      // تزيين الـ Container
                      shape:
                          BoxShape.rectangle, // تعيين شكل الـ Container كدائرة
                      image: DecorationImage(
                        // استخدام DecorationImage كخلفية للـ Container
                        fit: BoxFit.cover, // ضبط التكيف لتغطية الحاوية بالكامل
                        image: AssetImage(
                            currentImage), // استخدام الصورة الحالية كمسار للصورة
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
