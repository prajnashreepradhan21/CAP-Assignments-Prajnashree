module.exports = cds.service.impl(async function () {

//   const bupa = await cds.connect.to('API_BUSINESS_PARTNER');

//   this.on('READ', 'BusinessPartners',
//     req => bupa.run(req.query));
// });

const bupa = await cds.connect.to('API_BUSINESS_PARTNER');

this.on('READ', 'BusinessPartners', async (req) => {
  req.query.limit(10); // Limit the number of results to 10
  return await bupa.run(req.query);
})
});

