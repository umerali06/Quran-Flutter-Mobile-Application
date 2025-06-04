# 📖 Holy Quran Flutter App

A cross-platform mobile application built using **Flutter** that provides users with access to the complete Holy Quran in Arabic, with translations in **English**, **Urdu**, and **Chinese**.

This project was developed as a semester-end project for the **Mobile Application Development** course (CS-512) at the University of Agriculture, Faisalabad.

---

## 🎯 Objectives

- Display all 114 Surahs with Arabic text, transliteration, and multilingual translations.
- Support dynamic search for Surahs by name or content.
- Verse-by-verse navigation in a scrollable view.
- Feedback system for collecting user input.
- Verse sharing functionality across platforms.

---

## 🗂️ Dataset

- `all_surahs.json`: Metadata for all Surahs.
- `1.json`, `2.json`, ..., `114.json`: Per-Surah files with verses, Arabic text, and translations.

---

## 🔧 Technologies Used

- **Flutter** (Dart)
- **GetX** – for state management and navigation
- **flutter_plus** – UI components and custom animations
- **scrollable_positioned_list** – smooth scrolling through verses
- **flutter_svg** – SVG support
- **share** – cross-platform content sharing
- **loading_animation_widget** – loading indicators

---

## 📱 System Requirements

- **OS**: Android 8.0+ or iOS 13+
- **RAM**: Minimum 2GB
- **Storage**: ~50 MB
- **Internet**: Required for first-time data initialization

---

## 🧱 App Architecture

- **UI Layer**: List and detail views using Flutter widgets
- **Business Logic**: Managed via GetX controllers
- **Data Layer**: JSON files stored locally

---

## ✨ Key Features

- 🔍 **Surah Listing & Search**: Real-time filtering and custom tiles
- 📑 **Single Surah View**: Dynamic scrolling with verse highlights
- 🌐 **Multilingual Translation Toggle**: English, Urdu, Chinese
- 📤 **Verse Sharing**: Share any verse via apps using the `share` package
- 💬 **Feedback Form**: Simple UI with validation and submission logging

---

## 📁 Code Structure
- lib/
- ├── main.dart # App entry point with GetMaterialApp
- ├── quran_page.dart # Surah list and search
- ├── single_surah_page.dart # Detailed Surah view
- ├── ayat_view.dart # Custom verse display widget
- ├── screen.dart # Feedback form screen
- assets/
- ├── data/
- ├── all_surahs.json
- ├── 1.json ... 114.json

---

## 📈 Future Enhancements

- 🔊 Audio Recitation
- 🔖 Bookmarks
- 🌙 Dark Mode
- ☁️ Cloud Sync for preferences

---

## ✅ Evaluation Highlights

- ⚙️ **Functionality**: Complete and accurate rendering of all Surahs.
- 🖥️ **UI/UX**: Clean, responsive design with a consistent theme.
- 🚀 **Performance**: Fast load times and smooth scrolling even on large Surahs.
- 📩 **Feedback**: User input system built and ready for backend integration.

---

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/9d5dae63-4aad-4808-b4b4-e3e11bd27dc1" width="150"/>
  <img src="https://github.com/user-attachments/assets/9a7f0608-f970-42cc-8246-24651dd32c9c" width="150"/>
  <img src="https://github.com/user-attachments/assets/b4617f7a-876e-45ba-803a-653c4562e6d1" width="150"/>
  <img src="https://github.com/user-attachments/assets/f6091b8b-5951-4a8a-91ef-82cdab543a37" width="150"/>
  <img src="https://github.com/user-attachments/assets/56ae5a15-79cb-4017-8b07-72f37ea829cf" width="150"/>
  <img src="https://github.com/user-attachments/assets/d0be7e28-2487-4f9a-9284-d80fa5a449fb" width="150"/>
  <img src="https://github.com/user-attachments/assets/cc6fb5f9-e55c-4091-8911-fcff4d84d636" width="150"/>
  <img src="https://github.com/user-attachments/assets/a0a8b035-bda2-47a1-b3c2-7bc818649d7d" width="150"/>
  <img src="https://github.com/user-attachments/assets/9b85ab77-60a0-43b7-a5fd-ca60466a055d" width="150"/>
  <img src="https://github.com/user-attachments/assets/8d7f5176-a32d-4819-8bc7-344becd86804" width="150"/>
  <img src="https://github.com/user-attachments/assets/6019b843-fe17-44a6-924f-83fd28c51dd1" width="150"/>
</p>


---

## 👨‍💻 Developed By

**Umer Ali**  
University of Agriculture, Faisalabad

---

## 📜 License

This project is for educational purposes.

