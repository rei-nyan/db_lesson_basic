Q1

CREATE TABLE `departments` (
department_id INT UNSIGNED AUTO_INCREMENT,
name VARCHAR(20),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (department_id)
);

ALTER TABLE departments MODIFY name VARCHAR(20) NOT NULL;

Q2
ALTER TABLE people
ADD COLUMN  department_id int(10) unsigned AFTER email;

Q3
INSERT INTO departments (name)
VALUES ('営業'), ('開発'), ('経理'), ('人事'), ('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
('安達慶', 'adachi@gizumo.jp', 1, 25, 2),
('井上瑞樹', 'inoue@gizumo.jp', 1, 24, 1),
('猪狩宗也', 'igari@gizumo.jp', 1, 24, 2),
('伊藤篤志', 'ito@gizumo.jp', 2, 24, 1),
('浮所飛騨', 'ukisyo@gizumo.jp', 2, 34, 2),
('那須和樹', 'nasu@gizumo.jp', 2, 26, 1),
('藤井海', 'fujii@gizumo.jp', 2, 26, 1),
('佐藤隆', 'satou@gizumo.jp', 3, 23, 1),
('佐藤隆', 'takahashi@gizumo.jp', 4, 23, 1),
('東海斗', 'azuma@gizumo.jp', 5, 23, 1);

INSERT INTO reports (person_id, content)
VALUES
(7, 'プードル'),
(8, '青い鳥'),
(9, '赤とんぼ'),
(10, '秋田犬'),
(11, 'あこや貝'),
(12, 'あほう鳥'),
(13, '海すずめ'),
(14, '海つばめ'),
(15, 'おうむ貝'),
(16, 'キリン');

Q4
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;


Q5
SELECT name, age
FROM people WHERE gender = '1' ORDER BY age DESC;


Q6
SELECT `name`, `email`, `age`
FROM `people` WHERE `department_id` = 1 ORDER BY `created_at`;


peopleテーブルからdepartment_idレコードのカラム１を選択し、昇順で並べる
ascは省略できる

Q7
select name from people
where age between 20 and 29 and gender = '2'
or age between 40 and 49 and gender = '1';

Q8
select name,age from people where department_id = '1' order by  age asc;

Q9
select age as average_age from people where department_id = '2'
and gender = '2';

Q10
SELECT p.name,
d.name AS departments_name,
r.content AS reports_content
from people p
join departments d ON p.department_id = d.department_id
join reports r ON p.person_id = r.person_id;

Q11
select p.name from people p
left join reports r on p.person_id = r.person_id
where r.content IS NULL;

