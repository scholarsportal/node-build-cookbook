name 'build_cookbook'
maintainer 'Alvaro Faundez'
maintainer_email 'alvaro@faundez.net'
license 'mit'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
