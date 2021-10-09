const mongoose = require("mongoose");
const tagController = require('./../controllers/tagController');

const postSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
        trim: true,
        minlength: [4, 'Minimum length of title must be 4.'],
        maxlength: [40, 'Maximum length of title must be 40.']
    },
    description: {
        type: String,
        required: true,
        trim: true,
        minlength: [4, 'Minimum length of description is 4.'],
        maxlength: [500, 'Maximum length of description is 500.'],
    },
    image: {
        type: String,
        trim: true
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },
    isUserPublic: {
        type: Boolean,
        default: false
    },
    commentCount: {
        type: Number,
        default: 0
    },
    likeCount: {
        type: Number,
        default: 0
    },
    reportArray: {
        type: Array,
        'default': [0,0,0,0,0]
    },
}, { timestamps: true });



module.exports = mongoose.model("Post", postSchema);