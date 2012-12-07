#
# Malare CLI
# 
#
module Malare
	class CLI
		def initialize(args)
			run(args)
		end
		def run(args)
			parseOptions(args)
			
			db = Malare::MalwareDB.new
			if @options[:add]
				puts db.addSample(args[1], args[2], args[3], args[4])
			elsif @options[:remove]
				puts db.removeSample(args[1])
			elsif @options[:list]
				puts db.listSamples
			elsif @options[:search]
				results = db.searchSample(args[1])
				i = 1
				results.each do |hash|
					print "Result #{i} \\ \n"
					hash.each_pair do |key, value|
						print "\t [+]#{key}: #{value}\n"
					end
					i += 1
					
				end
			else
				puts parseOptions
			end
		end
		
		def parseOptions(args = "--help")
			begin
				@options = {}
				opts = OptionParser.new do |opts|
					opts.banner = "#{Malare::APP_NAME} v.#{Malare::VERSION} - A Malware database by Terje Haarstad."
					opts.separator("------------------------------------------")
					opts.separator("Usage: #{$0} OPTIONS ")
					opts.separator("Options:")
					
					opts.on('-h', '--help', 'This Screen') do
						puts opts
						exit
					end
					
					opts.on('-a', '--add FILE SOURCE CC (IP) (NOTES)', 'Add sample to database.') do
						@options[:add] = true
					end
					opts.on('-r', '--remove MD5', 'Remove samples from database') do
						@options[:remove] = true
					end
					
					opts.on('-l', '--list', 'List all samples in DB') do
						@options[:list] = true
					end
					opts.on('-s', '--search search-string', 'Searches for a md5-hash, C&C or filename in the database.') do
						@options[:search] = true
					end
					opts.separator("------------------------------------------")
					opts.separator("Example:")
					opts.separator("#{$0} --add malware.exe igotitfrom.com c&cDomain.com (c&c-IP) ('Some notes')")
					opts.separator("Note: Options in () are optional ")
					opts.separator("")
					opts.separator("#{$0} --search <md5> || <c&c> || <filename>.")
					
				end
			
			if ARGV.length != 0
				opts.parse(args)
			else 
				puts opts.to_s + "\n"
				exit
			end
			rescue OptionParser::InvalidOption => i
				puts "[!!] #{i}"
			rescue OptionParser::MissingArgument => m
				puts "[!!] #{m}"
			end
		end
	end
end
