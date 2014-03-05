# manage nginx webserver

# Class: nginx
#
#
class nginx {
    package { 'apache2.2-common':
        ensure => absent,        
    }
    package { 'nginx':
        ensure => installed,       
        require => Package['apache2.2-common'],
    }
    service { "nginx":
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require => Package['nginx'],
        # pattern    => 'nginx',
    }
    file { '/etc/nginx/sites-enabled/default':
        ensure => file,
        source => 'puppet:///modules/nginx/cat-pictures.conf',
        notify => Service['nginx'],
    }
    file { '/var/www/cat-pictures/':
        ensure => directory,
    }
    file { '/var/www/cat-pictures/index.html':
        ensure => file,
        source => 'puppet:///modules/nginx/index.html',
        notify => Service['nginx'],
        require => File['/var/www/cat-pictures/'],
    }
}
