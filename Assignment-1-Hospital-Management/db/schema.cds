namespace hospital.management;

type Name        : String(100);
type Phone       : String(15);
type Email       : String(100);
type Amount      : Decimal(10,2);
type MedicalNote : String(500);

type Gender : String enum { Male; Female; Other; }
type BloodGroup : String enum {
  APositive; ANegative; BPositive; BNegative;
  OPositive; ONegative; ABPositive; ABNegative;
}
type AppointmentStatus : String enum {
  Scheduled; Completed; Cancelled; NoShow;
}

entity Departments {
  key ID   : UUID;
  name     : Name;
  floor    : Integer;
  head     : Name;
  capacity : Integer;
  phone    : Phone;
  isActive : Boolean default true;
}

entity Doctors {
  key ID         : UUID;
  firstName      : Name;
  lastName       : Name;
  specialization : String(100);
  qualification  : String(100);
  experience     : Integer;
  fee            : Amount;
  departmentId   : UUID;
  phone          : Phone;
  email          : Email;
  availableDays  : String(50);
  isActive       : Boolean default true;
}

entity Patients {
  key ID           : UUID;
  firstName        : Name;
  lastName         : Name;
  dateOfBirth      : Date;
  gender           : Gender;
  bloodGroup       : BloodGroup;
  phone            : Phone;
  email            : Email;
  address          : String(300);
  emergencyContact : Phone;
  registrationDate : Date;
}

entity Appointments {
  key ID          : UUID;
  patientId       : UUID;
  doctorId        : UUID;
  appointmentDate : Date;
  appointmentTime : Time;
  status          : AppointmentStatus default 'Scheduled';
  reason          : MedicalNote;
  notes           : MedicalNote;
  fee             : Amount;
}

entity MedicalRecords {
  key ID          : UUID;
  patientId       : UUID;
  doctorId        : UUID;
  appointmentId   : UUID;
  diagnosis       : MedicalNote;
  prescription    : MedicalNote;
  testRecommended : MedicalNote;
  recordDate      : Date;
}