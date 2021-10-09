const express = require('express');
const userController = require('./../controllers/userController');
const authController = require('./../controllers/authController');
const router = express.Router();

// Signup request
router.post('/signup', authController.signUp);

// Email verification
router.post('/verifyEmail/:verificationToken', authController.verifyEmail);

// Login request
router.post('/login', authController.login);

// Forgot password request
router.post('/forgotPassword', authController.forgotPassword);

// Reset password request
router.post('/resetPassword/:passwordResetToken', authController.resetPassword);

// To fetch user info using bearer token
router.get('/me', authController.protectRoute, userController.getUser);

// To fetch user profile image
router.get('/image/:fileName', authController.protectRoute, userController.getUserImage);

router.put('/', authController.protectRoute, userController.updateUser);

// Get information of users
router.get('/', authController.protectRoute, userController.getAllUsers);

module.exports = router;