task :server do
	require 'pty'
  cmd = "thin start --ssl  --ssl-key-file server.key --ssl-cert-file server.crt"
	begin
	  PTY.spawn( cmd ) do |stdout, stdin, pid|
	    begin
	      stdout.each { |line| print line }
	    rescue Errno::EIO
	      puts "Errno:EIO error, but this probably just means " +
	            "that the process has finished giving output"
	    end
	  end
	rescue PTY::ChildExited
	  puts "The child process exited!"
	end
end

