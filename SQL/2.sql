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
2 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
这里只用根据学生ID把成绩分组，对分组中的score求平均值，最后在选取结果中AVG大于60的即可.
注意，这里必须要给计算得到的AVG结果一个alias.（AS ss）
得到学生信息的时候既可以用join也可以用一般的联合搜索
'''
#2
select r.sid,sname,mean from
(select sid,avg(score) as mean
from sc
group by sid
having avg(score)>60)r
join student
on student.sid = r.sid;
