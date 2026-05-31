namespace platform.events;

type Email  : String(100);
type Phone  : String(15);
type Amount : Decimal(10,2);
type Rating : Decimal(2,1);
type Name   : String(100);
type URL    : String(300);

type EventType : String enum {
  Conference;
  Workshop;
  Seminar;
  Webinar;
  Meetup;
}

type EventStatus : String enum {
  Draft;
  Published;
  Ongoing;
  Completed;
  Cancelled;
}

type TicketType : String enum {
  General;
  VIP;
  Student;
}

type RegistrationStatus : String enum {
  Confirmed;
  Cancelled;
  Waitlisted;
  Attended;
}

type VenueType : String enum {
  Auditorium;
  ConferenceHall;
  Outdoor;
  Virtual;
}

entity Venues {
  key ID        : UUID;
  name          : Name;
  address       : String(200);
  city          : String(50);
  capacity      : Integer;
  type          : VenueType;
  amenities     : String(200);
  hourlyRate    : Amount;
  contactPerson : Name;
  phone         : Phone;
  isActive      : Boolean default true;
}

entity Events {
  key ID          : UUID;
  title           : String(100);
  description     : String(300);
  eventType       : EventType;
  venueId         : UUID;
  startDate       : Date;
  endDate         : Date;
  startTime       : Time;
  endTime         : Time;
  maxAttendees    : Integer;
  registeredCount : Integer default 0;
  ticketPrice     : Amount;
  status          : EventStatus default 'Draft';
  organizerName   : Name;
  organizerEmail  : Email;
  tags            : String(200);
}

entity Speakers {
  key ID      : UUID;
  name        : Name;
  email       : Email;
  phone       : Phone;
  bio         : String(300);
  company     : String(100);
  designation : String(100);
  expertise   : String(100);
  photoUrl    : URL;
  rating      : Rating;
  totalTalks  : Integer;
  isActive    : Boolean default true;
}

entity EventSpeakers {
  key eventId   : UUID;
  key speakerId : UUID;
  topic         : String(150);
  sessionTime   : Time;
  sessionDuration : Integer;
  roomNumber    : String(20);
}

entity Registrations {
  key ID           : UUID;
  eventId          : UUID;
  attendeeName     : Name;
  attendeeEmail    : Email;
  attendeePhone    : Phone;
  company          : String(100);
  ticketType       : TicketType;
  registrationDate : Date;
  status           : RegistrationStatus default 'Confirmed';
  amountPaid       : Amount;
  paymentId        : String(50);
}

entity Feedback {
  key ID        : UUID;
  eventId       : UUID;
  attendeeEmail : Email;
  overallRating : Integer;
  contentRating : Integer;
  venueRating   : Integer;
  speakerRating : Integer;
  comment       : String(300);
  submittedAt   : DateTime;
}