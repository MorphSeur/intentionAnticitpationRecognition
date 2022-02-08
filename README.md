# Human Intention Anticipation Recognition
Using pretraind YOLO v5 models.  
Models obteined are in .pt format which are converted to .onnx format.  
.onnx are exploited to recognize rhand, lhand, banana, robot, pen, paper, laptop, phone, cup, mouse from both robot and egocentric perspectives.  

[YOLO v5](https://github.com/ultralytics/yolov5) is used to recognize objects including left and right hands.  
[OpenCV-YOLO-ONNX](https://github.com/doleron/yolov5-opencv-cpp-python) is used to read .onnx trained models to recognize objects.

## Labels
rhand, lhand, banana, robot, pen, paper, laptop, phone, cup, mouse.

## Pre-trained Models
Download the folder with the pre-trained models from this [link](https://mega.nz/folder/BzQnUQzR#w9TrGGnVpelhE_XxskPDew). And put all the folders in the ./modelsONNX/ folder.

## Requirements
Please refer to [requirements.txt](https://github.com/MorphSeur/intentionAnticitpationRecognition/blob/master/requirements.txt).

## Notebook
### [mainIntention.ipynb](https://github.com/MorphSeur/intentionAnticitpationRecognition/blob/master/mainIntention.ipynb)
- Contains functions to load YOLO model 
- Contains functions to perform the EC-based reasoning.  
- Contains functions to load affordances from ConceptNet.
- Contains functions to resize and build the recognized videos.

## Issues
Set the probabilities related to the objects of interest.  
Set the labels related to the location detection and its probabilities using [mainSceneDetection.ipynb](https://github.com/MorphSeur/SceneRecognition/blob/master/mainSceneDetection.ipynb).