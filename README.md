## 🍁💐🌹FlowerClassifierML🌻🪴🌵

# Flower classification app using coreML model, 

 🪷You can easily learn the name and description of flowers🌼 by taking a photo of them🌺.
 
 I took a pre-trained Caffe model-Oxford102 Flower Dataset- and converted it into a .mlmodel to use with Swift files
 
 To make that, i used Apple's open-source tools in Python to convert this pre-trained model
 
 To make it easy and not want you to install all tools such as Python2.7, i gave a link below which has a converted mlmodel
 
 
 # What I Learned
 
 - UIImagePicker
 - CoreML tools (VNCoreMLRequest VNCoreMLMolel est.)
 - Third Party Library (Alamofire, SwiftyJSON)
 - Made HTTP GET requests to Wikipedia using Alamofire
 - Parsed the JSON Result using SwiftyJSON
 
 # Usage 
 
 Just open app and hit use Photo! It will give name of the flower and some description pulled up from the Wikipedia article.
 

![IMG_0023](https://github.com/mesutgdk/FlowerClassifierML/assets/112901255/791c229f-5fec-4cfb-bc64-2b0e32edc1d4)

![IMG_0024](https://github.com/mesutgdk/FlowerClassifierML/assets/112901255/c390c659-c6b8-4ec6-bdc7-6543a30a4a13)


-  🪸First things first, you need download the .mlmodel from the link blow

https://drive.google.com/file/d/1CAxfhz3Ah-EsQRJ0n-AcOURiplHYRmdI/view?usp=sharing

<img width="1426" alt="Ekran Resmi 2023-05-12 17 47 37" src="https://github.com/mesutgdk/FlowerClassifierML/assets/112901255/5fc7b529-4d71-4968-af21-4ae850350afe">


- 🎋Open the app file u downloaded on terminal,

-> Drag the downloaded file into terminal after typing "cd " and press enter,

<img width="583" alt="Ekran Resmi 2023-05-12 17 49 38" src="https://github.com/mesutgdk/FlowerClassifierML/assets/112901255/42a44dcb-03b9-4f99-a42e-44f182a39c29">

- 🌴if the pod file is not inclueded and not downloaded, write "pod install" into terminal and press enter,

- 🎍After the installation is complete, open the project from "FlowerClassifierML.xcworkspace" file you downloaded, not ".xcodeproj" file.

- ☘️After unzipp the FlowerClassification.zip file u downloaded from the link above, implement 'FlowerClassifier.mlmodel' file by dragging it to the menu section of your xcode application.

<img width="825" alt="Ekran Resmi 2023-05-12 17 53 32" src="https://github.com/mesutgdk/FlowerClassifierML/assets/112901255/8ec3f28d-9929-4702-849c-5a3bb90b588f">

<img width="733" alt="Ekran Resmi 2023-05-12 17 54 29" src="https://github.com/mesutgdk/FlowerClassifierML/assets/112901255/86c66486-da93-4a6b-90ac-c40d32ba9e82">


