# ObjectRecognitionMobileApplication
The application and deployment of machine learning models in mobile devices has increased in past years as the processing capacity of mobile devices has increased. This brought a whole new level of user experience by giving mobile app developers the ability to integrate the power of machine learning into their apps. This represents a big step forward in mobile development. As well as normal people, the interest of disabled people in smartphones is increasing. Thanks to the developing machine learning applications, the lives of people with disabilities will become easier. We are now able to offer the option to experience this on iOS devices. In this thesis, expecting to develop an IOS application that can identify the objects in the environment and notify the user with a voice command. It is aimed to provide the best and fastest service to users by using IOS-specific machine learning Frameworks. Project goal is to create a well-thought-out application that will help society and is aligned with the Engineering field we are currently studying.



Used Frameworks,Libraries and Models for Object Recognition Mobile Application

• Vision : Used for Image Classification

• AVKit : It creates media playback user interfaces that include transport controls,
chapter navigation, picture-in-picture support, and the display of subtitles and closed
captions.

• UIKit : It covers table views and navigation controllers, including core labels and
buttons for the iOS app.

• AVFoundation : Used for text to speech of Classificated Object.

• Core ML : It supports Vision for analyzing images

• Resnet50: It’s trained model.


The interface of the Object Recognition Mobile Application is designed very simply. After the application receives permission to access the camera from the phone, the real-time camera view will take up most of the application screen.
The application contains only one screen, and the recognized object information on this screen will appear as text in the lower or upper corner.
At the same time, we have printed the information of the object for which Image Classification has been made, as text, and this information will be translated into voice commands using the necessary libraries. As the app developer, a simple speaker icon was used for voice command, considering the interface should be simple. When the user wants to hear the information of the object by voice command, he will press the speaker icon. This icon can be placed anywhere on the screen, but since right-handed users make up the majority of the population, it would be more logical to put it on the right side.


To explain in order the Classes that form the basis of the project you see above;
• AppDelegate.swift : It is responsible for handling application-level events such as application launch.

• SceneDelegate.swift : Responsible for a UISceneSession's scene lifecycle events such as scene creation, destruction, and state restore.

• ViewController.swift: It is the part where the Vision, Core ML, Classification codes used in the project are included.

• Helper.swift: It is the class that contains the codes written to transmit the information of the classified object to the user audibly, thanks to the AVFoundation library.

• Main.storyboard,LunchScreen.storyboard : It is the class where the interface of the application is created.

• Assets.xcassets: It is the place where files such as png, jpeg that should be in the application are kept. Usually icon design is done here.

• Resnet50.mlmodel : Model weights are stored using full accuracy (32 bit) floating point values in this trained model.

• infoplist : The .plist extension is a format produced by Apple that allows you to use it by reading or adding data from the system by saving data in Xml format as a structure on Xcode.


