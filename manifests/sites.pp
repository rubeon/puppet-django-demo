import  'nodes.pp'

node default {
    
}

user { 'eric':
    comment => 'Eric Williams',
    home => '/home/eric',
    ensure => present,
    #shell => '/bin/bash',
    #uid => '501',
    #gid => '20',
    managehome => true,
    
    
}

user { 'ubuntu':
    comment => 'Ubuntu User',
    home => '/home/ubuntu',
    ensure => present,
    #shell => '/bin/bash',
    #uid => '501',
    #gid => '20',
    
}