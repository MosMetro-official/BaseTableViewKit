#
# Be sure to run `pod lib lint BaseTableViewOriginal.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'BaseTableViewKit'
    s.version          = '0.1.0'
    s.summary          = 'A short description of BaseTableViewKit.'
    s.swift_version    = ['4.2', '5.4']
    s.requires_arc     = true
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/MosMetro-official/BaseTableViewKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'viacheslavplatonov' => 'slava.p12@yandex.ru' }
    s.source           = { :git => 'https://github.com/MosMetro-official/BaseTableViewKit', :tag => s.version.to_s }
    
    s.ios.deployment_target = '11.0'
    
    s.source_files = 'BaseTableViewKit/Classes/*.swift'
    s.resource_bundles = {
        'BaseTableViewKit' => ['BaseTableViewKit/**/*.{xib,storyboard,xcassets}']
    }
    
    s.frameworks = 'UIKit'
    s.dependency 'DifferenceKit'

    s.subspec 'BaseTableView' do |s|
        s.source_files = 'BaseTableViewKit/Classes/BaseTableView/*'
    end

    s.subspec 'FooterView' do |s|
        s.source_files = 'BaseTableViewKit/Classes/FooterView/*'
    end

    s.subspec 'Extensions' do |s|
        s.source_files = 'BaseTableViewKit/Classes/Extensions/*'
    end

    s.subspec 'Cells' do |s|
        s.source_files = 'BaseTableViewKit/Classes/Cells/*'
    end

    s.subspec 'HeaderView' do |s|
        s.source_files = 'BaseTableViewKit/Classes/HeaderView/*'
    end
    
    s.subspec 'Data' do |s|
        s.source_files = 'BaseTableViewKit/Classes/Data/*'
    end
    
    s.subspec 'Protocols' do |s|
        s.source_files = 'BaseTableViewKit/Classes/Protocols/*'
    end
end

