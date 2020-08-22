# XcodeSqlite
Test Sqlite in Xcode &amp; Swift

build setup
#install cocoapods
sudo gem install cocoapods
or sudo gem install cocoapods -n /usr/local/bin

#init pod
move to project root directary and run
pod init

#change Podfile
open 'Podfile' and change content to
  use_frameworks!
  pod 'SQLite.swift', :git => 'https://github.com/stephencelis/SQLite.swift.git', :branch => 'master'
  
#install Sqlite
move to project root directary and run
pod install
