cd cw_core && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
cd cw_monero && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
cd cw_bitcoin && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
cd cw_haven && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
cd cw_ethereum && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
cd cw_nano && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
cd cw_bitcoin_cash && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ..
flutter packages pub run build_runner build --delete-conflicting-outputs