task :server do
	require "readline"
	require 'open3'

	Open3.popen3("thin start --ssl  --ssl-key-file server.key --ssl-cert-file server.crt") do |i, o, e, th|
	  Thread.new {
	    while !i.closed? do
	      input =Readline.readline("", true).strip 
	      i.puts input
	    end
	  }

	  t_err = Thread.new {
	    while !e.eof?  do
	      putc e.readchar
	    end
	  }

	  t_out = Thread.new {
	    while !o.eof?  do
	      putc o.readchar
	    end
	  }

	  Process::waitpid(th.pid) rescue nil 
	  # "rescue nil" is there in case process already ended.

	  t_err.join
	  t_out.join

	end
end

