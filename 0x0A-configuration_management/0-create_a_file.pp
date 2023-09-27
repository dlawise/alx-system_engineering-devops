#Ensure directory /tmp/school exists
file { '/tmp/school':
  ensure => directory,
  owner  => 'www-data',
  group  => 'www-data',
  mode   => '0744',
}

#Create file /tmp/school with content "I love Puppet"
file { '/tmp/school/school':
  ensure  => file,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
  content => 'I love Puppet',
}
