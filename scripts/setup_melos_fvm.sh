# Setup dart/flutter with fvm
echo "fvm dart \"\$@\"" > ~/.pub-cache/bin/dart
echo "fvm flutter \"\$@\"" > ~/.pub-cache/bin/flutter
chmod +x ~/.pub-cache/bin/dart
chmod +x ~/.pub-cache/bin/flutter

# Active melos
fvm dart pub global activate melos
