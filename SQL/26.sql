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
26查询平均成绩大于等于 85 的所有学生的学号、姓名和平均成绩
'''
#26
select student.sname,r.sid,r.mean
from student right join
(select avg(score) as mean,sid
from sc
group by sid
having avg(score)>85)r
on r.sid = student.sid;
