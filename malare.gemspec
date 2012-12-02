base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'malare'

Gem::Specification.new do |s|
	# Information
 	 s.name =  Malare::APP_NAME
	 s.version = Malare::VERSION
	 s.date = '2012-11-06'
	 s.summary = "A malware database"
	 s.description = "Stores malware samples and info in a malware database"
	 s.required_ruby_version = ">= 1.9.2"
	 s.author = 'Terje Haarstad'
	# Files
	 s.files = Dir['lib/**/*'] + Dir['bin/*'] + ['malare.gemspec']
	 s.executables << 'malare'
	# Dependencies 
         s.add_dependency('sqlite3', '>= 1.3.6')
end

