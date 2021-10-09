const router = require("express").Router();
const postController = require('./../controllers/postController');
const authController = require('./../controllers/authController');

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

module.exports = router;