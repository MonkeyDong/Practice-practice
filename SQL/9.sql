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
9 查询和" 01 "号的同学学习的课程完全相同的其他同学的信息
'''
#9
select student.* from student right join(
select r.sid from
(select sid,avg(cast(cid as integer)) as mean,sum(cast(cid as integer))as sums
from sc
group by sid)r
where r.mean = 2.0 and sums = 6
)s on s.sid = student.sid ;
