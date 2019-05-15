workspace 'AlbumSearch'
platform :ios, '12.2'
use_frameworks!

def api_pods
  pod 'Moya', '~> 13.0'
end

target 'AlbumSearch' do
  project 'AlbumSearch/AlbumSearch.xcodeproj'
  
  pod 'Kingfisher', '~> 5.0'
  pod 'SwiftGen', '~> 6.0'
  api_pods
  
  target 'AlbumSearchTests' do
    inherit! :search_paths
  end
  target 'AlbumSearchUITests' do
    inherit! :search_paths
  end
end

target 'AlbumSearchAPI' do
  project 'AlbumSearchAPI/AlbumSearchAPI.xcodeproj'
  api_pods
end

target 'AlbumSearchAPITests' do
  project 'AlbumSearchAPI/AlbumSearchAPI.xcodeproj'
  api_pods
end
