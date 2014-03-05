node 'puppet-standalone' {
    include nginx
    package { 'joe':
        ensure => installed,
        
    }
    package { 'git':
        ensure => installed,    
    }
    
}


node "lb-compute-nodes" {
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
      'puppet-apply':
      minute => '*',
      hour => '*',
      date => '*',
      month => '*',
      weekday => '*',
      user => 'root',
      command => 'puppet apply /opt/puppet-django-demo/manifests/sites.pp --modulepath=/opt/puppet-django-demo/modules',
      
  }
  
}
