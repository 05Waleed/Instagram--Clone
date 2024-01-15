# Instagram--Clone
This is an Instagram clone built with UIKit.
# Instagram Clone App in Swift UIKit - README

## Overview
This Instagram Clone App is a Swift UIKit project following the MVC pattern, designed to replicate the user interface and features of Instagram. It includes networking managers for fetching data from custom APIs, a text field UI manager for dynamic UI updates, and various models for handling different data types. The app is built with UIKit, incorporating XIBs for custom table view cells and collection view cells.

## Project Structure

### Managers
1. **TextFieldUIManager**
   - Manages the appearance of a text field, label, and height constraint based on its activity.
   - Dynamically updates UI elements during user interaction.

2. **NetworkingManager**
   - Handles data fetching from custom APIs.
   - Connects with the backend to retrieve HomeData, SearchData, ReelsData, and ProfileData.

### Models
- **HomeData**
- **SearchData**
- **ReelsData**
- **ProfileData**
  - Models representing different data types used in the app.

### Views
- **Main.storyboard**
  - Main storyboard containing the app's main views and navigation flow.
- **LaunchScreen.storyboard**
  - Storyboard for the app's launch screen.
- **XIBs**
  - Custom table view cells and collection view cells to enhance the UI.

### Controllers
1. **LoginController**
   - Handles user login.
2. **CreateNewAccountController**
   - Manages the process of creating a new user account.
3. **ExistingProfileLoginController**
   - Controls the login flow for existing user profiles.
4. **TabBarController**
   - Main tab bar controller managing five major sections of the app:
     - **Home Feed**
     - **Search Feed**
     - **Upload Content**
     - **Reels**
     - **Profile**

### Features
- Replicates the Instagram UI with complete AutoLayout.
- Dark mode accessible.
- Utilizes custom APIs for data fetching.
- Includes a tab bar with distinct controllers for various sections.

## Getting Started
1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

## Dependencies
- UIKit
- AVFoundation
- AVKit

## Contribution Guidelines
Feel free to contribute by submitting bug reports, feature requests, or pull requests. Please follow the established coding style and contribute in a respectful and collaborative manner.
