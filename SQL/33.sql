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
33成绩不重复，查询选修「张三」老师所授课程的学生中，成绩最高的学生信息及其成绩
'''
#33
select sc.sid as id,sum(sc.score) as sums,student.sname as name from sc,course,teacher,student
where sc.cid = course.cid and teacher.tid = course.tid
and student.sid = sc.sid and tname = 'TeaCang'
group by sc.sid,student.sname
order by sum(sc.score) desc
limit 1;
