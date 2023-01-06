from deepface import DeepFace
import cv2
import matplotlib.pyplot as plt
import serial
import time
import requests
from playsound import playsound
while True:
  videoCaptureObject = cv2.VideoCapture(0)
  result = True
  while(result):
  ret,frame = videoCaptureObject.read()
  cv2.imwrite("NewPicture.jpg",frame)
  result = False
  videoCaptureObject.release()
  cv2.destroyAllWindows()
  img=cv2.imread('NewPicture.jpg')
  plt.imshow(img[:,:,::-1])
  plt.show()
  result=DeepFace.analyze(img,actions=['emotion'])
  s=result['dominant_emotion']
  if s[0]=='s' or s[0]=='f':
  requests.post('http://maker.ifttt.com/trigger/BABYCRYING/with/key/bahVEYeEL8d3ijNqE3-qIC')
  playsound('C:\\Users\\ANISHA\\Downloads\\twinkle.mp3')
  print('playing sound using playsound')
  time.sleep(1800)
