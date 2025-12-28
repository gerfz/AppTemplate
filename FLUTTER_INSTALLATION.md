# Flutter Installation Guide for Windows

## 🚀 Quick Installation Steps

### Method 1: Using Git (Recommended)

1. **Install Git first (if not already installed)**
   - Download from: https://git-scm.com/download/win
   - Or check if installed: `git --version`

2. **Clone Flutter SDK**
   ```powershell
   # Choose a location (e.g., C:\src)
   cd C:\
   mkdir src
   cd src
   git clone https://github.com/flutter/flutter.git -b stable
   ```

3. **Add Flutter to PATH**
   - Open "Edit system environment variables" (search in Windows)
   - Click "Environment Variables"
   - Under "User variables", find "Path"
   - Click "Edit" → "New"
   - Add: `C:\src\flutter\bin` (or wherever you installed Flutter)
   - Click "OK" on all windows

4. **Restart your terminal/PowerShell**

5. **Verify installation**
   ```powershell
   flutter --version
   ```

### Method 2: Direct Download

1. **Download Flutter SDK**
   - Go to: https://docs.flutter.dev/get-started/install/windows
   - Download the latest stable release (ZIP file)

2. **Extract the ZIP**
   - Extract to: `C:\src\flutter` (or any location without spaces)
   - Avoid: Program Files, folders with spaces, or special characters

3. **Add to PATH** (same as Method 1, step 3)

4. **Restart terminal and verify**

## 🔧 Complete Setup

After installing Flutter, run:

```powershell
# Check what's needed
flutter doctor

# Accept Android licenses (if you have Android Studio)
flutter doctor --android-licenses
```

## 📦 Additional Requirements

### For Android Development
- **Android Studio** (recommended)
  - Download: https://developer.android.com/studio
  - Install Android SDK
  - Accept licenses: `flutter doctor --android-licenses`

### For iOS Development (Mac only)
- Xcode from App Store

### For Windows Desktop Development
```powershell
# Enable Windows desktop support
flutter config --enable-windows-desktop
```

## ✅ Verify Everything Works

```powershell
# Check Flutter setup
flutter doctor -v

# Should show:
# ✓ Flutter (Channel stable, version...)
# ✓ Android toolchain (if installed)
# ✓ VS Code or Android Studio (if installed)
```

## 🎯 Quick Start After Installation

```powershell
# Navigate to your project
cd C:\Users\PC\Desktop\FlutterTemplate

# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Or specify platform
flutter run -d windows    # Windows desktop
flutter run -d chrome     # Web browser
flutter run -d android    # Android device/emulator
```

## 🐛 Troubleshooting

### "flutter not recognized"
- Make sure you added Flutter to PATH correctly
- Restart your terminal/PowerShell
- Check PATH: `echo $env:PATH` (should include flutter\bin)

### "Unable to locate Android SDK"
- Install Android Studio
- Run: `flutter config --android-sdk <path-to-sdk>`
- Or let Flutter auto-detect: `flutter doctor`

### "cmdline-tools component is missing"
- Open Android Studio
- Tools → SDK Manager → SDK Tools
- Check "Android SDK Command-line Tools"
- Click "Apply"

### PowerShell Execution Policy Error
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## 🎮 Running Your Template

Once Flutter is installed:

```powershell
# 1. Navigate to project
cd C:\Users\PC\Desktop\FlutterTemplate

# 2. Get dependencies
flutter pub get

# 3. Check available devices
flutter devices

# 4. Run the app
flutter run
```

## 📱 Setting Up Emulators

### Android Emulator
1. Open Android Studio
2. Tools → Device Manager
3. Create Virtual Device
4. Choose device (e.g., Pixel 5)
5. Download system image
6. Finish setup

### Test it:
```powershell
flutter emulators                    # List emulators
flutter emulators --launch <name>    # Start emulator
flutter run                          # Run on emulator
```

## 💡 Pro Tips

1. **Add VS Code Flutter extension**
   - Install "Flutter" extension by Dart Code

2. **Enable hot reload**
   - While app is running, press `r` for hot reload
   - Press `R` for hot restart

3. **Check for updates**
   ```powershell
   flutter upgrade
   ```

4. **Clean build if issues**
   ```powershell
   flutter clean
   flutter pub get
   ```

## 🆘 Need Help?

If you get stuck during installation:
1. Run `flutter doctor -v` and check what's missing
2. Visit: https://docs.flutter.dev/get-started/install/windows
3. Common issues: https://flutter.dev/docs/get-started/install/windows#troubleshooting

---

**Estimated Installation Time**: 15-30 minutes (depending on internet speed)

After installation, you'll be ready to run your Flutter template! 🚀

