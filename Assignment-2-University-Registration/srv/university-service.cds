using edu.university as university from '../db/schema';

service UniversityService {
  entity Departments as projection on university.Departments;
  entity Professors  as projection on university.Professors;
  entity Courses     as projection on university.Courses;
  entity Students    as projection on university.Students;
  entity Enrollments as projection on university.Enrollments;
  entity Exams       as projection on university.Exams;
}