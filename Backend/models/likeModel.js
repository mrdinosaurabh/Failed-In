const mongoose = require("mongoose");
const Post = require('./../models/postModel');

const LikeSchema = new mongoose.Schema({
    type: {
        type: String,
        enum: ['Love', 'BetterLuckNextTime', 'Support', 'Relatable'],
        default: 'Love'
    },
    postId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Post'
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
});

//middleware to populate username and image while fetching reactions(to be displayed on frontend)
LikeSchema.pre('find', async function(next) {
    this.populate('userId', ['username', 'image']);
    next();
});

module.exports = mongoose.model("Like", LikeSchema);