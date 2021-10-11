<h1 align="center">Failed-In</i></h1>
<h2 align="center"><i>Flaunt Your Failures!</i></h2>
<h2 align="center">✨Succeeded in winning the Most Funny Hack in HackHarvard 2021✨</h4>
<p align="center"><img alt="pic" height="600" width="300px"  src="https://user-images.githubusercontent.com/59930598/136701189-5226c8f0-d4f8-4810-8831-200376241c6b.gif"/>
</p>
<hr>

# Table of Contents

* [ Inspiration ](#inspiration)
* [ What it does ](#features)
* [ How we built it ](#made)
* [Challenges we ran into](#challenges)
* [What's next for Failed-in](#future)
* [ Contributors ](#contributors)
* [ Images ](#images)

# <a name="inspiration"></a>Inspiration
On social media, most of the things that come up are success stories. We've seen a lot of our friends complain that there are platforms where people keep bragging about what they've been achieving in life, but not a single one showing their failures. 
<br><br>
We realized that there's a need for a platform where people can share their failure episodes for open and free discussion. 
So we have now decided to take matters in our own hands and are creating Failed-In to break the taboo around failures! On Failed-in, you realize - "You're NOT alone!"

# <a name="features"></a>What it does
* It is a no-judgment platform to learn to celebrate failure tales.
* Enabled User to add failure episodes (anonymously/non-anonymously), allowing others to react and comment. 
* Each episode on the platform has #tags associated with it, which helps filter out the episodes easily. A user's recommendation is based on the #tags with which they usually interact
* Implemented sentiment analysis to predict the sentiment score of a user from the episodes and comments posted.
* We have a motivational bot to lighten the user's mood.
* Allowed the users to report the episodes and comments for
    * NSFW images (integrated ML check to detect nudity)
    * Abusive language (integrated ML check to classify texts)
    * Spam (Checking the previous activity and finding similarities)
    * Flaunting success (Manual checks)

# <a name="made"></a>How we built it
* We used Node for building REST API and MongoDb as database.
* For the client side we used flutter.
* Also we used tensorflow library and its built in models for NSFW, abusive text checks and sentiment analysis.

# <a name="challenges"></a>Challenges we ran into
* It was the first time we tried using Flutter-beta instead of React with MongoDB and node. It took a little longer than usual to integrate the server-side with the client-side.
* Finding the versions of tensorflow and other libraries which could integrate with the remaining code.

# <a name="future"></a>What's next for Failed-in
* Improve the model of sentiment analysis to get more accurate results so we can understand the users and recommend them famous failure to success stories using web scraping.
* Create separate discussion rooms for each #tag, facilitating users to communicate and discuss their failures.
* Also provide the option to follow/unfollow a user.


# <a name="contributors"></a>Contributors
* [Harsh Gyanchandani](https://github.com/harshh3010)
* [Saurabh Singh](https://github.com/mrdinosaurabh)
* [Pranavi](https://github.com/pranavi79)
* [Gursimran Kaur Saini](https://github.com/gursimran18)

# <a name="images"></a>Images


<div align="left">
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136700478-d4ab7dd4-c5a8-4f48-9e5f-4fab5c0c2d67.png"  hspace="20px"/>
    <img height="500px" width="250px"src="https://user-images.githubusercontent.com/59930598/136700562-dee3b15e-8c3f-4b4a-9770-87d93e8a0ae0.png"  hspace="20px"/>
    <img height="500px" width="250px"src="https://user-images.githubusercontent.com/59930598/136700614-1b9f5694-3a18-44c3-8bd0-f19408d827d7.png"  hspace="20px"/>
    <br><br>
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136700653-d1b6cb03-271d-41be-ae75-a12ae14a9e5c.png" hspace="20px"/>
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136700752-59488b6d-eeb5-48d7-88c4-26b237f3d70e.png" hspace="20px"/>
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136700760-e4c9baf8-c331-4fcc-84e4-ed740caf9a5f.png"  hspace="20px"/>
    <br><br>
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136700911-2da05549-5e3c-41f8-8916-2a85a57b9934.png" hspace="20px"/>
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136700969-f68a3233-c542-487f-82aa-f9cce2b7114e.png" hspace="20px"/>
    <img height="500px" width="250px" src="https://user-images.githubusercontent.com/59930598/136754956-09fee6d4-f9ed-4f24-8c6d-b5464a502006.png"  hspace="20px"/>
    <br><br><br>
</div>


Built At [HACK HARVARD](https://hackharvard.io/)
