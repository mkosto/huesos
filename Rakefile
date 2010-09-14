desc "Build gem package"
task :build do
  system "gem build huesos-generator.gemspec"
end

desc "Release gem"
task :release => :build do
  system "gem push snailmail-0.1.gem"
end
