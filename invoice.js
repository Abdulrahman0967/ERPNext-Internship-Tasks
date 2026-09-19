// المهمة الأولى: دالة حساب المجموع وتغيير النص في الصفحة
function calculateTotal() {
    // افترض أننا جلبنا القيم أو حسبناها
    let price1 = 100;
    let price2 = 50;
    let finalTotal = price1 + price2;

    // نبحث عن الخانة التي تحمل الآيدي grand-total ونغير النص بداخلها
    document.getElementById("grand-total").innerText = finalTotal + "$";
    console.log("تم تحديث المجموع بنجاح!");
}

// المهمة الثانية: جلب بيانات من سيرفر خارجي (API)
function fetchUserData() {
    // نستخدم fetch للاتصال برابط API مجاني يعيد بيانات بصيغة JSON
    fetch('https://jsonplaceholder.typicode.com/users/1')
        .then(response => response.json()) // نحول الرد إلى كائن JSON
        .then(data => {
            // نبحث عن المكان المخصص للنتيجة ونطبع فيه اسم المستخدم القادم من السيرفر
            document.getElementById("api-result").innerText = data.name;
            console.log("تم جلب البيانات:", data);
        })
        .catch(error => {
            console.log("حدث خطأ في جلب البيانات:", error);
        });
}

// استدعاء الدالة لتعمل فور تحميل الصفحة
fetchUserData();
//4 دالة جديدة