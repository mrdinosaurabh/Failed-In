const express = require('express');
const morgan = require('morgan');

const app = express();

app.use(morgan('dev'));

// Middleware to read the body of http post request
app.use(express.json());

app.use('*', (req, res, next) => {
    res.status(404).send('This route is not defined!');
});

module.exports = app;