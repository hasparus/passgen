#!/usr/local/bin/ruby
if (ARGV[0] == 'generate' || ARGV[0] == 'g')
    require 'securerandom'
    dict = []
    Dir.foreach('.').select {|x| File.extname(x) == '.dic' }.each do |x|
        dict += File.readlines(x, encoding: 'UTF-8')
    end

    n = ARGV[1].to_i
    n = 4 if n.zero?
    puts (1..n).map { dict[SecureRandom.random_number(dict.length)] }
else
    puts \
" Place all your .dic files in current folder, then enter 'passgen generate X', \n" \
" where X equals number of words you want to generate. \n" \
" I assume X == 4 if you forget about it. \n\n"
end
