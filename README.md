# Shoe Store App

A modern mobile e-commerce application for shoes built with Flutter and Provider state management.

## Features

### 🛍️ Shopping Experience
- **Shoes Collection**: Browse through a curated collection of shoes from popular brands
- **Brand Filtering**: Filter shoes by brand (Nike, Adidas, Bata, etc.)
- **Product Details**: View detailed product information including pricing and size options
- **Size Selection**: Choose from available sizes for each shoe
- **Add to Cart**: Seamless cart functionality with item management
- **Search Functionality**: Search through the shoe collection

### 🎨 User Interface
- Clean and modern design with intuitive navigation
- Product cards with high-quality shoe images
- Brand-specific categorization with filter tabs
- Shopping cart with item management
- Responsive layout optimized for mobile devices

### 🏗️ Technical Features
- Built with **Flutter** for cross-platform compatibility
- **Provider** state management for efficient app state handling
- Bottom navigation for easy app navigation
- Product catalog with detailed views
- Cart persistence and management

## Screenshots are in the folder

The app includes:
- **Collection View**: Browse all available shoes with filtering options
- **Product Details**: Detailed view with pricing, sizes, and add-to-cart functionality
- **Shopping Cart**: View and manage selected items

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd shoe-store-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### For Development

- **Debug mode**: `flutter run`
- **Release mode**: `flutter run --release`
- **Specific device**: `flutter run -d <device-id>`


## Dependencies

Key dependencies used in this project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0

```

## Features in Detail

### Brand Filtering
- Filter shoes by popular brands (Nike, Adidas, Bata)
- "All" option to view complete collection

### Product Management
- High-quality product images
- Price display in USD
- Size availability and selection
- Easy add-to-cart functionality

### Cart Management
- Add items to cart with selected size
- Remove items from cart
- Persistent cart state across app sessions

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

---

**Built with ❤️ using Flutter**