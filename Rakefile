require 'rake/testtask'

task 'default' => ["test"]

Rake::TestTask.new('test') do |t|
  t.pattern = '*.rb'
  #t.warnig = true # out-date!!
  # rake aborted!
  #undefined method `warninig=' for #<Rake::TestTask:0x007f8e5496d978>
end