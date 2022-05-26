# Shapp
As quick as a click.
### Features
Order anything you want, and get it delivered wherever and whenever.  
Describe what you need, give some extra information about where to find it and a rider will deliver it to you.

The app is still available in the App Store, but the Stripe payment API and Google Maps API are not operational anymore.

Here are some of the main screens of the app.
Login | Home | Order Description | Order Details
:-------------------------:|:-------------------------: |:-------------------------: | :-------------------------:
![7](https://user-images.githubusercontent.com/45075577/170418621-4741b913-9f81-4e5e-a5de-1b3b7d7de174.png) | ![login](https://user-images.githubusercontent.com/45075577/170418626-0998c797-0197-4459-ae32-7013b427fb64.png) | ![home](https://user-images.githubusercontent.com/45075577/170418627-53b9e57f-2214-461b-9aff-8a33a586cf4e.png) | ![description](https://user-images.githubusercontent.com/45075577/170418628-c9e3f61b-ddf2-4a8e-8421-4622dc04666f.png)| ![details](https://user-images.githubusercontent.com/45075577/170418629-4d16d82c-5a22-4e0c-bd77-34c4007cb0fe.png)| 
Order Confirmed | Order Overview  |  Settings | Dark Mode
![confirmed](https://user-images.githubusercontent.com/45075577/170419050-510fce69-390e-49e0-96af-34e37477299b.png) | ![overview](https://user-images.githubusercontent.com/45075577/170418631-88b964d7-5df2-4d24-b3a1-1e364db02817.png)| ![settings](https://user-images.githubusercontent.com/45075577/170418632-b002d3eb-fa98-402d-9c9b-abe7490d6910.png)| ![dark mode](https://user-images.githubusercontent.com/45075577/170419976-232e73a7-ffb1-456b-8dc9-6e3c4a7ed640.png)

### Development details
The front-end is built with Flutter, the back-end is built with Firebase.

Next to the basic "business logic" features this app also offers:
 - Phone number based authentication with Firebase
 - Payments with Stripe
 - Dark/Light/System Mode
 - Multiple Language Support (Dutch & English)
 - Persistent user preferences 
 - Remotely configurable legal documents with Firebase Remote Config
 - Usage and behavioral analytics with Firebase Analytics
