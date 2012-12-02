module Malare
	APP_NAME = "malare"
	VERSION = "0.0.9"
end

#MalwareDB 
require 'sqlite3'
require 'fileutils'
require 'digest/md5'
#CLI
require 'optparse'

require 'malare/malwaredb.rb'
require 'malare/CLI.rb'
