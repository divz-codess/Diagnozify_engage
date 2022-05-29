## About The Project
Diagnozify is an initiative to make it easier for the needy to get hands on quality healthcare.
By the means of our app we aim to provide a platform where various syndromes can be detected just by a facial scan. 
This in turn will help millions of people affected by these diseases to directly meet the correct doctor for their particular disease. 
Diagnozify uses artificial intelligence to interpret the facial information and provide accurate results. 



## Tech stacks used 



![enter image description here](https://img.icons8.com/fluency/52/flutter.png)![enter image description here](https://img.icons8.com/color/54/firebase.png)![enter image description here](https://img.icons8.com/color/54/tensorflow.png)![enter image description here](https://img.icons8.com/stickers/54/python.png)



## Application Demo 

[Download](asdasd) and install the apk file on your android mobile device.
Note - Please enable install app from unknown sources setting on your device to allow installation of application. 
 

## System Architecture 

The Diagnozify App has three major components to full full all its features 
1. An android application 
2. A backend server
3. A firebase storage & firestore database 

The major goal the the app is to predict different types of face syndromes once user captures the image or uploads photo from gallery, The image file is then encoded in base64 format and uploaded to static storage drive of firebase storage and image path is stored on user's collections. 

<img src="https://github.com/ishaandwivedi1234/Diagnozify/blob/main/screenshots/sys_arc.png" height="200px" width="500px"/>
<br>

After saving, The image URL is then parsed into request body of the backend API which loads the image into CNN model trained on dataset of various face syndromes images, The model predicts the chances of various syndromes and responds to the client about its predictions, If the predicted values are high enough then the result is displayed on the user's app confirming about his/her syndromic conditions. 


## Future Scope
further improve on my ml model
work on the dataset

## Instructions For Contribution


 1. Fork the repo on your github account
 2. Clone the repo on your system 
 3. Download the face syndrome detection model from the google drive link ( _)
 4. Upload the model to your google drive 
 5. Run the google colab file to start API Server block by block
 6. Run the main.dart file inside lib folder to start the application in debug mode

## References 




 
