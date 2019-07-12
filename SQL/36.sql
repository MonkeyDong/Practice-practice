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
35查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩
'''
#35
select t1.cid as ccc1,t2.cid as ccc2,t1.sid,t1.score
from sc as t1 join sc as t2 on t1.sid = t2.sid
where t1.score = t2.score and t1.cid != t2.cid;
