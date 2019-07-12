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
14查询各科成绩最高分、最低分和平均分
以如下形式显示：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率

及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
'''
#14
select r.cid as cids,course.cname,r.maxs,r.mins,r.mean,r.jige,r.zhongdeng,r.youliang,r.youxiu
 from (
   select cid,max(score) as maxs,min(score) as mins,avg(score) as mean,
   sum(case when sc.score>=60 then 1 else 0 end )/count(*)as jige,
   sum(case when sc.score>=70 and sc.score<80 then 1 else 0 end )/count(*)as zhongdeng,
   sum(case when sc.score>=80 and sc.score<90 then 1 else 0 end )/count(*)as youliang,
   sum(case when sc.score>=90 then 1 else 0 end )/count(*)as youxiu
   from sc
   group by cid
 )r
join course
on r.cid = course.cid;
