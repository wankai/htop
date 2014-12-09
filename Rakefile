task :build do
  sh "gem build htop.gemspec"
end

task :install => :build do
  sh "gem install htop-0.0.0.gem"
end
