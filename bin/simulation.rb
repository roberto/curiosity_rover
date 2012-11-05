require_relative '../lib/mission_parser'

puts MissionParser.new(ARGF).run
