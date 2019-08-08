# Install Chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Puppet
choco install puppet-agent -y

# Install r10k
& 'C:\Program Files\Puppet Labs\Puppet\puppet\bin\gem' install r10k

# Workaround to fix r10k ssl issue with Windows
$CACertFile = Join-Path -Path $ENV:AppData -ChildPath 'RubyCACert.pem'

If (-Not (Test-Path -Path $CACertFile)) {
    "Downloading CA Cert bundle.."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri 'https://curl.haxx.se/ca/cacert.pem' -UseBasicParsing -OutFile $CACertFile | Out-Null
}

"Setting CA Certificate store set to $CACertFile.."
$ENV:SSL_CERT_FILE = $CACertFile
[System.Environment]::SetEnvironmentVariable('SSL_CERT_FILE',$CACertFile, [System.EnvironmentVariableTarget]::Machine)

# Install puppet modules for Packer's Puppet Masterless provisioner
Start-Process -Wait -NoNewWindow "cmd.exe" "/c C:\PROGRA~1\PUPPET~1\Puppet\puppet\bin\r10k puppetfile install --puppetfile C:\Temp\Puppetfile --moduledir C:\Temp\packer-puppet-masterless\module-0 --verbose"

