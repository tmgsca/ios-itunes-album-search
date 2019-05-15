workspace 'AlbumSearch'
platform :ios, '12.2'
use_frameworks!

target 'AlbumSearch' do
  project 'AlbumSearch/AlbumSearch.xcodeproj'
  
  pod 'Kingfisher', '~> 5.0'
  pod 'SwiftGen', '~> 6.0'
  
  target 'AlbumSearchTests' do
    inherit! :search_paths
  end
  target 'AlbumSearchUITests' do
    inherit! :search_paths
  end
end

target 'AlbumSearchAPI' do
  project 'AlbumSearchAPI/AlbumSearchAPI.xcodeproj'
  pod 'Moya', '~> 13.0'
end

target 'AlbumSearchAPITests' do
  project 'AlbumSearchAPI/AlbumSearchAPI.xcodeproj'
  pod 'Moya', '~> 13.0'
end
