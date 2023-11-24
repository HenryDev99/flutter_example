# goodiez_abalone

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# M2 pod install error 해결
- ios/Podfile -> platform :ios, '12.0'로 변경 후 다시 빌드
- 라이브러리 문제 발생 시
1. flutter clean
2. sudo arch -x86_64 gem install ffi
3. arch -x86_64 sudo gem install cocoapods -n /usr/local/bin
4. arch -x86_64 pod install
5. flutter run

# Intel MAC 사용자 Push 규칙
- 빌드 환경을 제외한 수정한 dart 파일만 푸쉬할 것
- android, ios 빌드 파일은 Manifest, gradle 관련 파일, *.plist, *.json, *.swift 까지 푸쉬 가능

## 빌드 문의 =====> henry@goodiez.io