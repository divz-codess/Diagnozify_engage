## About The Project
Diagnozify is an initiative to make it easier for the needy to get hands on quality healthcare.
By the means of our app we aim to provide a platform where various syndromes can be detected just by a facial scan. 
This in turn will help millions of people affected by these diseases to directly meet the correct doctor for their particular disease. 
Diagnozify uses artificial intelligence to interpret the facial information and provide accurate results. 
Diagnozify detects 4 genetic syndromes namely:
 1. Down's Syndrome
 2. DiGeorge Syndrome
 3. William Buren Syndrome 
 4. Noonan Syndrome 


## Tech stacks used 



![enter image description here](https://img.icons8.com/fluency/52/flutter.png)![enter image description here](https://img.icons8.com/color/54/firebase.png)![enter image description here](https://img.icons8.com/color/54/tensorflow.png)![enter image description here](https://img.icons8.com/stickers/54/python.png)



## Application Demo 

[Download](asdasd) and install the apk file on your android mobile device.
Note - Please enable install app from unknown sources setting on your device to allow installation of application. 
 

## System Architecture 

<img width="800" alt="sys_arc" src="https://github.com/divz-codess/Diagnozify_engage/assets/88512639/50e53222-094e-4b8b-b96d-bd63ed0a7975" height=380 width=400>

The Diagnozify App has three major components to full full all its features 
1. An android application 
2. A backend server
3. A firebase storage & firestore database 

The major goal the the app is to predict different types of face syndromes once user captures the image or uploads photo from gallery, The image file is then encoded in base64 format and uploaded to static storage drive of firebase storage and image path is stored on user's collections. 



After saving, The image URL is then parsed into request body of the backend API which loads the image into CNN model trained on dataset of various face syndromes images, The model predicts the chances of various syndromes and responds to the client about its predictions, If the predicted values are high enough then the result is displayed on the user's app confirming about his/her syndromic conditions. 


## Future Scope
 1. Further improve on my ML model.
 2. Work on the dataset to include more diverse population patients.
 3. Include an exercises and therapy suggestor.
 4. Add an appointment scheduler.
 5. Include other syndromes detection too.


## Instructions For Contribution


 1. Fork the repo on your github account
 2. Clone the repo on your system 
 3. Download the face syndrome detection model from the google drive link ( _)
 4. Upload the model to your google drive 
 5. Run the google colab file to start API Server block by block
 6. Run the main.dart file inside lib folder to start the application in debug mode

## References 

 1. https://www.mayoclinic.org/
 2. https://api.flutter.dev/flutter/material/Scaffold-class.html
 3. https://api.flutter.dev/index.html
 4. https://www.google.com/amp/s/www.geeksforgeeks.org/introduction-to-tensorflow/amp/
 5. https://www.tensorflow.org/
 6. https://www.fullstackpython.com/flask.html
 7. https://www.w3schools.com/python/

## Video Demo 
  https://youtu.be/oM5OLq3ef9s
 
