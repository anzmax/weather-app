# Weather App

Welcome to the Weather App repository! This app provides real-time weather updates by utilizing the Yandex Weather API. It's designed with a clean, user-friendly interface and built using the MVC architecture enhanced by a coordinator pattern for navigation.

## Features

- **Real-time weather data**: Fetch weather conditions such as temperature, humidity, wind speed, and more.
- **Local weather**: Uses CoreLocation to obtain the current location and display local weather.
- **Data persistence**: CoreData and UserDefaults are used to store user settings and favorite locations.
- **Geocoding capabilities**: Integrated with a geocoder to transform addresses into geographic coordinates.
- **Networking**: Uses URLSession for networking tasks to interact with the Yandex API.
- **Yandex API**: The app is powered by the Yandex Weather API, which requires an API key valid for 7 days.

## Architecture

This app employs the Model-View-Controller (MVC) architecture with an added Coordinator for better navigation and separation of concerns.

- **Model**: Handles the data logic.
- **View**: Manages the display of information.
- **Controller**: Acts as an intermediary between the model and the view.
- **Coordinator**: Manages the navigation logic for the app.

## Getting Started

### Prerequisites

Before you can run the app, you'll need:
- Xcode 15.3 
- iOS 17.0
- A valid Yandex API key

### Installation

1. Clone this repository
2. Open `TheWeatherApp.xcodeproj` in Xcode.
3. Insert your Yandex API key into the designated place in the network manager.
4. Build and run the app on your iOS device or simulator.

## Usage

Once installed, the app will request permission to access your location. Grant permission to see the weather in your current location. Use the search function to explore weather in different locations worldwide. Your settings and preferences are saved automatically.

## Contributing

Contributions to the Weather App are welcome! Please feel free to fork the repository, make changes, and submit pull requests. You can also open issues if you find bugs or have feature requests.

## Screenshots

<div style="display: flex; flex-wrap: wrap;">
    <img src="https://github.com/anzmax/weather-app/blob/main/1.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/2.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/3.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/4.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/5.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/6.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/7.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/8.png" style="width: 30%;" />
    <img src="https://github.com/anzmax/weather-app/blob/main/9.png" style="width: 30%;" />
</div>

