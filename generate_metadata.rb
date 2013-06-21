#!/usr/bin/ruby

puts 'Generating metadata.json files for all cookbooks...'

Dir.entries('cookbooks').each { |cookbook|
  system("knife cookbook metadata #{cookbook} -o cookbooks/")
}