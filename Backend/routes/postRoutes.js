const router = require("express").Router();
const postController = require('./../controllers/postController');
const authController = require('./../controllers/authController');
const likeController = require('./../controllers/likeController');

//create a post
router.post("/", authController.protectRoute, postController.createAPost);

//Update a post
router.put("/:id", authController.protectRoute, postController.updateAPost);

//Delete a post
router.delete("/:id", authController.protectRoute, postController.deleteAPost);

//Get all post
router.get("/", authController.protectRoute, postController.getAllPosts);

//Get post image
router.get("/image/:fileName", authController.protectRoute, postController.getPostImage);

//React on a particular post
router.post('/:id/like', authController.protectRoute, likeController.likePost);

//fetch all reactions on a particular post
router.get('/like', authController.protectRoute, likeController.getAllLikes)

module.exports = router;