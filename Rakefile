desc "Build gem package"
task :build do
  system "gem build huesos.gemspec"
end

desc "Release gem"
task :release => :build do
  system "gem push snailmail-0.2.gem"
end
