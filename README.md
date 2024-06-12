# Dad Jokes App

## Description

The Dad Jokes App is a fun and simple iOS application built using SwiftUI that displays random dad jokes. The jokes are stored in a MongoDB database and accessed directly from the app using MongoDB Realm. This project showcases the integration of MongoDB with a SwiftUI app without the need for a separate server.

## Features

- Fetch and display random dad jokes
- Simple and intuitive user interface
- Fetch new jokes with the press of a button

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.3+
- MongoDB Atlas account
- MongoDB Realm setup

## Setup

### MongoDB Atlas and Realm

1. **Create a MongoDB Atlas account:**
   - Sign up at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas).
   - Create a new cluster and database named `dadJokesDB`.
   - Inside `dadJokesDB`, create a collection named `jokes`.

2. **Create a MongoDB Realm app:**
   - Go to the Realm section in MongoDB Atlas and create a new Realm app.
   - Configure the Realm app to connect to your MongoDB cluster.

3. **Define the schema for jokes:**
   - In the Realm UI, go to the "Schemas" tab and define the following schema for your jokes collection:
     ```json
     {
       "title": "Joke",
       "properties": {
         "id": {
           "bsonType": "objectId"
         },
         "title": {
           "bsonType": "string"
         },
         "joke": {
           "bsonType": "string"
         }
       },
       "required": ["title", "joke"]
     }
     ```

4. **Insert sample data:**
   - Insert some sample dad jokes into your MongoDB collection using the Atlas UI or MongoDB Compass, e.g.:
     ```json
     {
       "title": "Skeleton Joke",
       "joke": "Why don't skeletons fight each other? They don't have the guts."
     }
     ```

### SwiftUI App

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/dad-jokes-app.git
   cd dad-jokes-app
