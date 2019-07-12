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
8 查询至少有一门课与学号为" 01 "的同学所学相同的同学的信息
'''
#8
select student.* from
student right join (select distinct sid from sc
where cid in (select cid from sc where sid = '01')
and sid != '01')r
on student.sid = r.sid;
