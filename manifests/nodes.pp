node 'puppet-standalone' {
    include nginx
    package { 'joe':
        ensure => installed,
        
    }
    package { 'git':
        ensure => installed,    
    }
    
}
