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
10 查询没学过"张三"老师讲授的任一门课程的学生姓名
'''
#10
select sname
from student
where sid not in (
  select sid
  from sc
  where cid in (
    select cid from course,teacher
    where teacher.tname = 'TeaWang' and teacher.tid = course.tid
  )
);