# copyright: 2018, The Authors

# Windows Services
control "Windows Services" do
  impact 0.7
  title "Running Windows Services"
  desc "List of windows services that must be installed and running"
  describe service('DHCP Client') do
    it { should be_installed}
    it { should be_running}
  end
end

# Puppet Agent Control
control "Puppet Agent" do
  impact 0.7
  title "Install Puppet Agent v6.7.2"
  desc "Check if Puppet Agent is installed."
  describe package("Puppet Agent (64-bit)") do
    it { should be_installed }
    its('version') { should eq '6.7.2' }
  end
end
