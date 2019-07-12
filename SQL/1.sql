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
1.查询" 01 "课程比" 02 "课程成绩高的学生的信息及课程分数

1.1 查询同时存在" 01 "课程和" 02 "课程的情况
1.2 查询存在" 01 "课程但可能不存在" 02 "课程的情况(不存在时显示为 null )
1.3 查询不存在" 01 "课程但存在" 02 "课程的情况
'''
#1
select student.* from student right join(
select t1.sid,t1.score from
    (select sid,score from sc where cid = '01')as t1,
    (select sid,score from sc where cid = '02')as t2
where t1.score > t2.score and t1.sid = t2.sid)r
on student.sid = r.sid;

#1.1
select t1.sid from
    (select sid,score from sc where cid = '01')as t1,
    (select sid,score from sc where cid = '02')as t2
where t1.sid = t2.sid;

#1.2
select t1.sid,sc1,sc2 from
    (select sid,score as sc1 from sc where cid = '01')as t1 left join
    (select sid,score as sc2 from sc where cid = '02')as t2 on t1.sid = t2.sid;

#1.3
select sid,sc2 from
(select t2.sid,sc1,sc2 from
    (select sid,score as sc1 from sc where cid = '01')as t1 right join
    (select sid,score as sc2 from sc where cid = '02')as t2 on t1.sid = t2.sid)r
where sc1 is null;
