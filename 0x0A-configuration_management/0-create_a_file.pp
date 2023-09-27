file { '/tmp/school':
  ensure  => 'file',           #Ensure it is regular file
  mode    => '0744',           #Set file permission
  owner   => 'www-data',       #Set file owner
  group   => 'www-data',       #Set file group
  content => 'I love Puppet',  #Set file content
}
