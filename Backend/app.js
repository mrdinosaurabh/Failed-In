const express = require('express');
const morgan = require('morgan');

const app = express();

const errorHandler = require('./controllers/errorController');
const userRoutes = require('./routes/userRoutes');

app.use(morgan('dev'));

// Middleware to read the body of http post request
app.use(express.json());

//specifying routes
app.use('/users', userRoutes);

app.use('*', (req, res, next) => {
    res.status(404).send('This route is not defined!');
});
app.use(errorHandler);

module.exports = app;