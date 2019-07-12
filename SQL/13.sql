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
13按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
'''
#13
select s.sids,s.cid,s.score,s.mean
from(select sc.sid as sids,r.mean,cid,score from
  (select sid,avg(score) as mean
  from sc
  group by sid)r right join sc
  on sc.sid = r.sid
)s
order by mean desc;
