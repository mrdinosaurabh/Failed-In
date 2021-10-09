const Post = require("../models/postModel");
const Comment = require("../models/commentModel");
const Like = require("../models/likeModel");
const AppError = require("../utilities/appError");
const catchAsync = require('./../utilities/catchAsync');
const DbFeatures = require('./../utilities/dbFeatures');
const fileController = require('./../controllers/fileController');

const fs = require('fs');
const path = require('path');
const { default: axios } = require("axios");

const storageDir = `${__dirname}\\..\\app-data\\post-images\\`;
const serverUrl = `http://${process.env.SERVER_IP}/posts/image/`;

// Function to create a new post
exports.createAPost = catchAsync(async(req, res, next) => {

    const newPost = new Post(req.body);
    newPost.tags = await newPost.addTags(req.body.tags);
    newPost.userId = req.user._id;
    newPost.reportArray = [0,0,0,0];

    //Storing the post image
    if (req.files && req.files.image) {
        try {
            await fileController.storeFile(req.files.image, storageDir + newPost._id + '.jpg');
            newPost.image = serverUrl + newPost._id + '.jpg';
        } catch (e) {
            return next(new AppError('Error while uploading the file!', 400));
        }
    }

    const savedPost = await newPost.save();

    res.status(200).json({
        status: 'success',
        data: {
            post: savedPost
        }
    });
});

//Function to update a post
exports.updateAPost = catchAsync(async(req, res, next) => {

    let post = await Post.findOne({ _id: req.params.id, userId: req.user._id });

    if (!post) {
        return next(new AppError('Post not found!', 404));
    }

    if (req.body.tags) {
        post.tags = await post.addTags(req.body.tags);
        req.body.tags = post.tags;
    }

    // Update only the fields which are provided
    if(req.body.title != null)
        post.title = req.body.title;
    if(req.body.description != null)
        post.title = req.body.description;

    await post.save();
    res.status(200).json({
        status: 'success',
        data: {
            post: post
        }
    });
});

// Function to delete a post
exports.deleteAPost = catchAsync(async(req, res, next) => {

    const post = await Post.findOne({ _id: req.params.id, userId: req.user._id });
    if (!post) {
        return next(new AppError('Post not found!', 404));
    }
    await Comment.deleteMany({ postId: post._id });
    await post.deleteOne();
    res.status(200).json({
        status: 'success',
        message: 'The post has been deleted successfully!'
    });

});

// Function to get all posts
exports.getAllPosts = catchAsync(async(req, res, next) => {
    
    const dbFeatures = new DbFeatures(Post.find().lean().select('-likes -reportArray -updatedAt'), req.query)
        .filter()
        .sort()
        .filterFields()
        .paginate();

    let posts = await dbFeatures.dbQuery;

    //See if the user who has asked for the post has liked of not by adding isLiked field
    for(var postIndex in posts) {
        let post = posts[postIndex];
        const like = await Like.findOne({postId : post._id,userId : req.user._id}); 
        if(like) {
            posts[postIndex].likeType =  like.type;
        }
        else {
            posts[postIndex].likeType = 'None';
        }
    }

    res.status(200).json({
        status: 'success',
        data: {
            posts: posts
        }
    });
});

//Function to get the image of the requested post
exports.getPostImage = catchAsync(async(req, res, next) => {

    const file = path.resolve(storageDir + req.params.fileName);

    fs.stat(file, function(err, stat) {
        if (!err) {
            res.sendFile(file);
        } else {
            return next(new AppError('File not found!', 404));
        }
    });

});