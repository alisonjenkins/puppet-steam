require 'open3'

Facter.add(:steam) do
  setcode do
    facts = {}

    # find gpu vendor
    facts[:gpu_vendors] = {}
    stdin, stdout, stderr = Open3.popen3('/usr/bin/lspci | grep VGA')

    stdout.each do |line|
      if line.include? "NVIDIA"
        facts[:gpu_vendors][:NVIDIA] = true
      end

      if line.include? "AMD"
        facts[:gpu_vendors][:ATI] = true
      end

      if line.include? "ATI"
        facts[:gpu_vendors][:ATI] = true
      end

    end

    facts
  end
end
