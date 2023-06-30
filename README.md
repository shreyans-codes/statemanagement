# Suchit - The News Application

I am currently leveraging the News API to retrieve news articles. In the previous iteration, I incorporated a language selection feature. In this updated version, I have implemented a card-based implementation where you can swipe news cards. Futher, I plan on enabling the capability to save news locally using a local database. This functionality is currently undergoing development and refinement.

## Screenshots

![Main Screen](https://github.com/shreyans-codes/statemanagement/blob/master/screenshot/main-screen.png?raw=true)

Home Screen

![Side Menu](https://github.com/shreyans-codes/statemanagement/blob/master/screenshot/news-side-menu.png?raw=true)

Hamburger Menu with options

![Side Menu Light](https://github.com/shreyans-codes/statemanagement/blob/master/screenshot/news-side-light.png?raw=true)

Dynamic Theme Switching

![News Screen](https://github.com/shreyans-codes/statemanagement/blob/master/screenshot/news-main.png?raw=true)

News Screen

## Run Locally

Clone the project

```bash
  git clone https://github.com/shreyans-codes/statemanagement.git
```

Go to the project directory

```bash
  cd statemanagement
```

Install dependencies

```bash
  flutter pub get
```

Check the health of the application

```bash
  flutter doctor
```

Run the application

```bash
  flutter doctor
```

## Environment Variables

To run this project, you will need to add the following environment variables to your `lib/doc/api_key.dart` file.

Add the following code:

`const String apiKey = 'YOUR_API_KEY';`

## Get Api Key

- [NewsAPI.org](https://newsapi.org/)
