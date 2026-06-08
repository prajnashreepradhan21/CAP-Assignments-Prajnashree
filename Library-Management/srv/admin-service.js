// srv/admin-service.js
const cds = require('@sap/cds');

module.exports = function () {

  // BOOK VALIDATION
  this.before('CREATE', 'Books', async (req) => {

    console.log('Creating Book:', req.data);

    const {
      title,
      isbn,
      pages,
      price,
      edition,
      totalCopies,
      availableCopies
    } = req.data;

    if (!title || title.trim() === '') {
      console.log('Title validation failed');
      req.error(400, 'Title is required', 'title');
    }

    if (isbn && !/^\d{13}$/.test(isbn)) {
      console.log('ISBN validation failed');
      req.error(400, 'ISBN must be exactly 13 digits', 'isbn');
    }

    if (pages !== undefined && pages <= 0) {
      console.log('Pages validation failed');
      req.error(400, 'Pages must be greater than zero', 'pages');
    }

    if (price === undefined || price === null || price <= 0) {
      console.log('Price validation failed');
      req.error(400, 'Price must be greater than zero', 'price');
    }

    if (edition !== undefined && edition <= 0) {
      console.log('Edition validation failed');
      req.error(400, 'Edition must be greater than zero', 'edition');
    }

    if (totalCopies !== undefined && totalCopies < 0) {
      console.log('Total Copies validation failed');
      req.error(400, 'Total copies cannot be negative', 'totalCopies');
    }

    if (availableCopies !== undefined && availableCopies < 0) {
      console.log('Available Copies validation failed');
      req.error(400, 'Available copies cannot be negative', 'availableCopies');
    }

    if (
      totalCopies !== undefined &&
      availableCopies !== undefined &&
      availableCopies > totalCopies
    ) {
      console.log('Available Copies > Total Copies');
      req.error(
        400,
        'Available copies cannot be greater than total copies',
        'availableCopies'
      );
    }

    console.log('Book validation passed');
  });

  this.after('CREATE', 'Books', (data) => {
    console.log('Book Created Successfully');
    console.log(data);
  });


  // AUTHOR VALIDATION
  this.before('CREATE', 'Authors', (req) => {

    console.log('Creating Author:', req.data);

    const { firstName, lastName, email } = req.data;

    if (!firstName || firstName.trim() === '') {
      console.log('First Name validation failed');
      req.error(400, 'First name is required', 'firstName');
    }

    if (!lastName || lastName.trim() === '') {
      console.log('Last Name validation failed');
      req.error(400, 'Last name is required', 'lastName');
    }

    if (email && !email.includes('@')) {
      console.log('Email validation failed');
      req.error(400, 'Please provide a valid email address', 'email');
    }

    console.log('Author validation passed');
  });

  this.after('CREATE', 'Authors', (data) => {
    console.log('Author Created Successfully');
    console.log(data);
  });

};