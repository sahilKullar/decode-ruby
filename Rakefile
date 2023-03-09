require 'rdoc/task'

# Rake::RDocTask.new('rdoc') do |t|
#   t.rdoc_files.include('README.md', './**/*.rb')
#   t.main = 'README'
#   t.title = "Decode Ruby documentation"
# end

Rake::RDocTask.new('doc') do |t|
  t.rdoc_files.include('README.md', './**/*.rb')
  t.main = 'README.md'
  t.title = "Decode Ruby documentation"
  t.author = "Sahil"
end

desc 'Upload documentation to RubyForge.'
task 'upload' => 'doc' do
  # command(s) to upload html/ and contents to RubyForge
end
desc 'Remove generated and backup files.'
task 'clobber' => 'clobber_doc' do
  # command(s) to remove all files ending in ~ or .bak
end

task :default => ['doc']
