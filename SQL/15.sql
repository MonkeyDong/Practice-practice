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
15按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺
'''
#15
select a.cid, a.sid, a.score, count(b.score)+1 as rank
from sc as a
left join sc as b
on a.score<b.score and a.cid = b.cid
group by a.cid, a.sid,a.score
order by a.cid, rank ASC;
