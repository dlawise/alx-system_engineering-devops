#Ensure SSH client configuration directory exists
file { '/home/your_username/.ssh':
  ensure => 'directory',
  mode   => '0700',
  owner  => 'your_username',
  group  => 'your_username',
}

#Configure SSH client to use the private key
file_line { 'Configure identity file':
  path  => '/home/your_username/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile.*$',
}

#Disable password authentication
file_line { 'Turn off passwd auth':
  path  => '/home/your_username/.ssh/config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication.*$',
}
