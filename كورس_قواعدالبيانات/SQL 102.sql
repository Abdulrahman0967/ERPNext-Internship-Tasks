-- استخدام قاعدة بيانات المدرسة من المشروع السابق
USE AlTamayyuz_School;

-- 1. إنشاء جدول للطلاب المتفوقين (معدل أعلى من 90) من جدول الطلاب الأساسي
CREATE TABLE Outstanding_Students AS 
SELECT * FROM Students 
WHERE gpa > 90;

-- 2. إنشاء جدول للطلاب الغير مجتازين (معدل أقل من 60)
CREATE TABLE Failing_Students AS 
SELECT * FROM Students 
WHERE gpa < 60;

-- 3. عرض أسماء الطلاب التي تبدأ بحرف A (أو حرف الألف باللغة العربية بناءً على بياناتنا)
SELECT student_name 
FROM Students 
WHERE student_name LIKE 'A%' OR student_name LIKE 'أ%';

-- 4. عرض أسماء الطلاب التي تحتوي أسمائهم على أربع خانات (4 حروف)
SELECT student_name 
FROM Students 
WHERE CHAR_LENGTH(student_name) = 4;

-- 5. تطبيق دوال التجميع (AVG, MAX, MIN) على المعدل التراكمي مع أسماء مستعارة واضحة
SELECT 
    AVG(gpa) AS Average_GPA, 
    MAX(gpa) AS Highest_GPA, 
    MIN(gpa) AS Lowest_GPA 
FROM Students;

-- 6. حصر وعرض أسماء الطلاب المتفوقين في المستوى السادس بمعدل يساوي 100
SELECT student_name 
FROM Students 
WHERE grade_level = 6 AND gpa = 100.00;

-- 7. عرض الطلاب في المستوى الأول وأعمارهم بين 15 و 16 سنة 
-- (نحسب العمر بطرح تاريخ الميلاد من التاريخ الحالي)
SELECT * 
FROM Students 
WHERE grade_level = 1 
AND TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 15 AND 16;

-- 8. عرض عدد الطلاب الموجودين بالمستوى 2
SELECT COUNT(*) AS Level_2_Students_Count 
FROM Students 
WHERE grade_level = 2;

-- 9. استعراض مسارات الطلاب في المدرسة بدون تكرار (استخدام DISTINCT)
SELECT DISTINCT track 
FROM Students;

-- 10. عرض أسماء المواد بحروف كبيرة (UPPER)
-- ملاحظة: استخدمنا اسم جدول Courses لأننا قمنا بتغييره في نهاية التاسك السابق
SELECT UPPER(subject_name) AS Subject_Name_Uppercase 
FROM Courses; 

-- 11. عرض المتوسط الحسابي للمعدل التراكمي وتقريبه لأقرب أصغر عدد صحيح (FLOOR)
SELECT FLOOR(AVG(gpa)) AS Rounded_Down_Average_GPA 
FROM Students;

-- 12. تبديل الجنس من F إلى Female ومن M إلى Male
-- خطوة أ: يجب توسيع حجم حقل gender لأنه كان مخصصاً لحرف واحد (CHAR(1))
ALTER TABLE Students MODIFY gender VARCHAR(10);
-- خطوة ب: تحديث البيانات باستخدام دالة REPLACE أو CASE
UPDATE Students 
SET gender = CASE 
    WHEN gender = 'M' THEN 'Male'
    WHEN gender = 'F' THEN 'Female'
    ELSE gender 
END;

-- 13. تحديث المعدل التراكمي للطلاب الذين معدلهم أقل من 60 بزيادته 5 درجات
UPDATE Students 
SET gpa = gpa + 5 
WHERE gpa < 60;