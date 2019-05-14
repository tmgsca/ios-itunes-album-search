workspace 'AlbumSearch'


platform :ios, '12.0'

target 'AlbumSearch' do
  use_frameworks!
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
  use_frameworks!
  project 'AlbumSearchAPI/AlbumSearchAPI.xcodeproj'

  pod 'Moya', '~> 13.0'

  target 'AlbumSearchAPITests' do
    inherit! :search_paths
  end
end

