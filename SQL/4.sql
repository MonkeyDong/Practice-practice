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
4.查询所有同学的学生编号、学生姓名、选课总数、所有课程的成绩总和
联合查询不会显示没选课的学生
'''
#4
select s.sid,s.sname,r.nums,r.alls
from (
  select sid,sname from student
)s left join
(
  select sc.sid,sum(sc.score) as alls,count(sc.cid) as nums
  from sc
  group by sc.sid
)r on s.sid = r.sid;


#4.1 查有成绩的学生信息
select * from student
where exists (select sc.sid from sc where student.sid = sc.sid);
