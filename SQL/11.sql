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
11查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
'''
#11
select s.sname,s.mean,s.sids
from (select * from student join
  (select sid as sids,avg(score) as mean from sc group by sid)r
  on student.sid = r.sids)s
where s.sids in
(select sid from sc group by sid
  having count(cid)>2 and avg(score)<60);
