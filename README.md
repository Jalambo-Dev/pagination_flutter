# 📱 Pagination with Flutter & Cubit

A simple project that demonstrates how to implement **pagination** using `Dio` for API requests and `Cubit` for state management in Flutter.

## ✨ Features

- 📜 **Infinite Scroll**: Loads more posts as you scroll down.
- 🔄 **Dio for HTTP Requests**: Fast and efficient API calls.
- 🎯 **Cubit for State Management**: Clean and easy-to-use state handling.
- 🛠 **Error Handling & Loading Indicators**: Displays errors and loading spinners appropriately.

## 🚀 Quick Start

1. **Clone the Repo**:

   ```
   git clone https://github.com/your-username/flutter-pagination-cubit.git
   cd flutter-pagination-cubit
   ```

2. **Install Dependencies**:
   ```
   flutter pub get
   ```
3. **Run the App**:
   ```
   flutter run
   ```
## 📂 Project Structure
   ```
   lib/
   ├── cubit/              # Business logic (Cubit and states)
   ├── data/               # Data management
   │   ├── models/         # Data models (Post)
   │   ├── repository/     # Repository for data fetching
   │   └── service/        # API service using Dio
   └── ui/
   ```

## 🛠 How It Works
   - API: Fetches posts from the JSONPlaceholder API.
   - Pagination: Loads more posts when the user scrolls to the bottom.
   - Cubit: Manages the loading, loaded, and error states for the posts.

     
## 📸 Screenshots .GIF
![pagination_screen_record copy](https://github.com/user-attachments/assets/79a52081-b8b2-400c-b510-aee154548a45)


   
   
