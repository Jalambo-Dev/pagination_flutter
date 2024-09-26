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
   cd flutter-pagination-cubi
   ```
2. **Instll Dependencies**:
   ```
   flutter pub get
   ```
## 📂 Porject Structure
```
lib/
├── cubit/              # Business logic (Cubit and states)
├── data/               # Data management
│   ├── models/         # Data models (Post)
│   ├── repository/     # Repository for data fetching
│   └── service/        # API service using Dio
└── ui/                 # User Interface (Pagination UI)
```



## 🛠 How It Works
- API: Fetches posts from the JSONPlaceholder API.
- Pagination: Loads more posts when the user scrolls to the bottom.
- Cubit: Manages the loading, loaded, and error states for the posts.

## 📸 ScreenShots
![pagination_screen_record copy](https://github.com/user-attachments/assets/65744d28-b8a5-4dd2-9b2d-0e17256ebbc4)
 
 
