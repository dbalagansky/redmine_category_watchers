require 'redmine'

Redmine::Plugin.register :redmine_category_watchers do
  name 'Redmine Categories Watcher plugin'
  author 'Luis Fontes <mail.fontes@gmail.com>'
  description 'This is a plugin for Redmine to add automatically add watchers by category'
  version '0.0.1'
  #url 'http://example.com/path/to/plugin'
  #author_url 'http://example.com/about'


  permission :category_watchers, { :category_watchers => [:index, :add] }, :public => true
  
  permission :access_category_watchers, :category_watchers => :index
  permission :add_category_watchers,	:category_watchers => :add
  



   menu :project_menu, :category_watchers, { :controller => 'category_watchers', :action => 'index' }, 
  			:caption => :category_watchers, :after => :wiki,
  			:if => Proc.new {
    					User.current.allowed_to?(:access_category_watchers, nil, {global:true})
   			}

end


require_dependency 'redmine_category_watcher/hooks'
