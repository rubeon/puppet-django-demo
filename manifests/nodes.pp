node 'puppet-standalone' {
    include nginx
    package { 'joe':
        ensure => installed,
        
    }
    package { 'git':
        ensure => installed,    
    }
    
}


node "lb-compute-web-nodes" {
  include nginx
  include cron
  
  package { 'git':
    ensure => installed,
  }
  package { 'joe':
    ensure => installed,
    
  }
  package { 'name':
    ensure => installed,
  }
  
  cron::job {
      'puppet-git-update':
      minute => '*/5',
      hour => '*',
      date => '*',
      month => '*',
      weekday => '*',
      user => 'root',
      command => '',
      
  }

  cron::job {
      'puppet-apply':
      minute => '*/5',
      hour => '*',
      date => '*',
      month => '*',
      weekday => '*',
      user => 'root',
      command => 'cd /opt/puppet-django-demo/ && git pull && puppet apply /opt/puppet-django-demo/manifests/sites.pp --modulepath=/opt/puppet-django-demo/modules',
      
  }
  
}
