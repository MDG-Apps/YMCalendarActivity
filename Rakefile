APP_NAME = "YMCalendarActivity"
PROJECT_DIR = File.expand_path("#{APP_NAME}.xcodeproj")

SDK = "iphoneos"
SCHEME = APP_NAME
CONFIGURATION = "Release"

DESTINATIONS = ["name=iPhone,OS=6.0",
                "name=iPhone Retina (3.5-inch),OS=6.0",
                "name=iPhone Retina (3.5-inch),OS=7.0",
                "name=iPhone Retina (4-inch),OS=6.0",
                "name=iPhone Retina (4-inch),OS=7.0",
                "name=iPhone Retina (4-inch 64-bit),OS=7.0"]

task :default => [:build]

task :test do
  DESTINATIONS.each do |destination|
    sh "xcodebuild -project #{PROJECT_DIR} -sdk iphonesimulator -scheme #{SCHEME} -configuration Debug -destination '#{destination}' test | xcpretty -c; exit ${PIPESTATUS[0]}"
  end
end

desc "Build"
task :build do
    sh "xcodebuild -project #{PROJECT_DIR} -sdk #{SDK} -scheme #{SCHEME} -configuration #{CONFIGURATION} clean build | xcpretty -c; exit ${PIPESTATUS[0]}"
end

desc "Clean"
task :clean do
    sh "xcodebuild -project #{PROJECT_DIR} clean"
end
