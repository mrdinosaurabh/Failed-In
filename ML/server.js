const express = require('express');
const app = express();
app.use(express.json());
//The ML checks will run parallely on this port
const port = 8800;
const router = express.Router();
const offensiveTextsCheck = require('./offensiveTextsCheck');

//Setting route for analysing the text which has been sent for analysis
router.get('/text/', async (req,res) => {
    await offensiveTextsCheck.textAnalysis(res,req.headers.text);
});

app.use('/',router);

const server = app.listen(port, "0.0.0.0", () => {
console.log(`Server started on port ${port}`);
}).then(res => auth = res.data.token).catch(error => console.log(error));
