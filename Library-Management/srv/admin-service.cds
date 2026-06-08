using lib.management as db from '../db/schema';

service AdminService @(path:'/admin') {
  entity Books as projection on db.Books;
  entity Authors as projection on db.Authors;
  entity Genres as projection on db.Genres;
  entity Members as projection on db.Members;
  entity Reviews as projection on db.Reviews;
  entity Borrowings as projection on db.Borrowings;
}