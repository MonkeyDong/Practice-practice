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
27查询课程名称为「数学」，且分数低于 60 的学生姓名和分数
'''
#27
select student.sname,r.score
from student right join
(select sc.sid,sc.score
from sc,course
where sc.score < 60 and course.cname = 'Math' and course.cid = sc.cid)r
on r.sid = student.sid;
