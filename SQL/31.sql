'''
--1.学生表
Student(SId,Sname,Sage,Ssex)
--SId 学生编号,Sname 学生姓名,Sage 出生年月,Ssex 学生性别
--2.课程表
Course(CId,Cname,TId)
--CId 课程编号,Cname 课程名称,TId 教师编号
--3.教师表
Teacher(TId,Tname)
--TId 教师编号,Tname 教师姓名
--4.成绩表
SC(SId,CId,score)
--SId 学生编号,CId 课程编号,score 分数
'''

'''
31查询课程编号为 01 且课程成绩在 80 分及以上的学生的学号和姓名
'''
#31
select sc.sid,student.sname
from sc,student
where cid = '01' and score >= 80
and sc.sid = student.sid;
