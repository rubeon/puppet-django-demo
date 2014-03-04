node 'puppet-standalone' {
    user { 'ubuntu':
        comment => 'Ubuntu User',
        home => '/home/ubuntu',
        ensure => present,
        #shell => '/bin/bash',
        #uid => '501',
        #gid => '20',
        
    }
    
    ssh_authorized_key {
        'ubuntu_ssh':
            user => 'ubuntu',
            type => 'rsa',
            key => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAp8W4vSF1wr2JvU6rSr9nVclgcNCHYx+TS9CFa9qjFshPruLcGFbfQiT102Q/WeBhGNUHLQGmToNkOGyqJnJdjdQoNB7XeyYWIyxXBbPa9Zjj4+lgGUXhHsEiYhJtfqMZQvUuoKBgRFGmohJE+kpm9e6+pzpeWepBhnAIWq8sIQIoeoEIa8yl4UCmgxggTqZ9POLl1S4J5x9AN4cZgzZGtWNEiZnw+Ku04ASGqdXA9B869ilxCbhk7QmsZ6IUNr2bBd7Pd03e8zJgPRu3731feJmNgagNl42zxNEkp7L2pDquT2B0R5hKI8CYE1ogVq/tOFFHRms148FrqWOV93ufcw==',
    }   
    package { 'joe':
        ensure => installed,
        
    }
    package { 'git':
        ensure => installed,
        
    }
}
