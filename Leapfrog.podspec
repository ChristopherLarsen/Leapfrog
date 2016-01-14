Pod::Spec.new do |spec|
  spec.name = "Leapfrog"
  spec.version = "1.0.0"
  spec.summary = "Swift Framework to jumpstart new Apps."
  spec.homepage = "https://github.com/christopherlarsen/Leapfrog"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Your Name" => 'christopher@deadratgames.com' }
  spec.social_media_url = "http:www.google.ca"

  spec.platform = :ios, "9.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/christopherlarsen/Leapfrog.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "Leapfrog/**/*.{h,m,swift}"

  #spec.dependency "SomePodName", "~> 1.0.0"
end