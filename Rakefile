#!/usr/bin/env rake

require 'kitchen/rake_tasks'
require 'foodcritic'

Kitchen::RakeTasks.new
FoodCritic::Rake::LintTask.new do |t|
    t.options = { :fail_tags => ['any'] }
end

task :default => [ :foodcritic ]

# vim: ai et ts=2 sts=2 sw=2 ft=ruby fdm=marker
