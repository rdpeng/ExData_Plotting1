



<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>Exploratory-Data-Analysis/plot1.R at master · semenoffalex/Exploratory-Data-Analysis</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="semenoffalex/Exploratory-Data-Analysis" name="twitter:title" /><meta content="Exploratory-Data-Analysis - Repository for the course &amp;quot;Exploratory Data Analysis&amp;quot;" name="twitter:description" /><meta content="https://avatars3.githubusercontent.com/u/1209785?v=3&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars3.githubusercontent.com/u/1209785?v=3&amp;s=400" property="og:image" /><meta content="semenoffalex/Exploratory-Data-Analysis" property="og:title" /><meta content="https://github.com/semenoffalex/Exploratory-Data-Analysis" property="og:url" /><meta content="Exploratory-Data-Analysis - Repository for the course &quot;Exploratory Data Analysis&quot;" property="og:description" />

      <meta name="browser-stats-url" content="/_stats">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    <link rel="xhr-socket" href="/_sockets">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="7B7DD41C:0F96:B8E3AA7:5480280D" name="octolytics-dimension-request_id" /><meta content="8093645" name="octolytics-actor-id" /><meta content="eiffel100" name="octolytics-actor-login" /><meta content="1f27f92eab1ca34e8da300e3030a3294c07f4641132dc775ec80097963d94a46" name="octolytics-actor-hash" />
    
    <meta content="Rails, view, blob#show" name="analytics-event" />

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="PrKSmAeM5nYCwhAWb7gp4OAuThxqxAg5aOqUA4EdMN9QgdFOfjx8v/elB8RTbulfFMlaoPACSQ7Ji4odssh4vA==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-3b230f82a0b851c99d89b2bf05aa48231c73dbb9ac7a3e425b3d9751746b4eb5.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://assets-cdn.github.com/assets/github2-fa4131d40212d3a8d5f0db6761cbe13ad7581ee5e269a2f89a5637cb3f13a8d0.css" media="all" rel="stylesheet" type="text/css" />
    
    


    <meta http-equiv="x-pjax-version" content="b61ea63d768e4e4fc6661b563752ccc3">

      
  <meta name="description" content="Exploratory-Data-Analysis - Repository for the course &quot;Exploratory Data Analysis&quot;">
  <meta name="go-import" content="github.com/semenoffalex/Exploratory-Data-Analysis git https://github.com/semenoffalex/Exploratory-Data-Analysis.git">

  <meta content="1209785" name="octolytics-dimension-user_id" /><meta content="semenoffalex" name="octolytics-dimension-user_login" /><meta content="19666546" name="octolytics-dimension-repository_id" /><meta content="semenoffalex/Exploratory-Data-Analysis" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="19666546" name="octolytics-dimension-repository_network_root_id" /><meta content="semenoffalex/Exploratory-Data-Analysis" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/semenoffalex/Exploratory-Data-Analysis/commits/master.atom" rel="alternate" title="Recent Commits to Exploratory-Data-Analysis:master" type="application/atom+xml">

  </head>


  <body class="logged_in  env-production windows vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" ga-data-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <form accept-charset="UTF-8" action="/semenoffalex/Exploratory-Data-Analysis/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/semenoffalex/Exploratory-Data-Analysis/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <input type="text"
    class="js-site-search-field is-clearable"
    data-hotkey="s"
    name="q"
    placeholder="Search"
    data-global-scope-placeholder="Search GitHub"
    data-repo-scope-placeholder="Search"
    tabindex="1"
    autocapitalize="off">
  <div class="scope-badge">This repository</div>
</form>
      </div>
      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item explore">
          <a class="header-nav-link" href="/explore" data-ga-click="Header, go to explore, text:explore">Explore</a>
        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="Header, go to blog, text:blog">Blog</a>
          </li>
        <li class="header-nav-item">
          <a class="header-nav-link" href="https://help.github.com" data-ga-click="Header, go to help, text:help">Help</a>
        </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name" href="/eiffel100" data-ga-click="Header, go to profile, text:username">
      <img alt="Hongyi Yin" class="avatar" data-user="8093645" height="20" src="https://avatars0.githubusercontent.com/u/8093645?v=3&amp;s=40" width="20" />
      <span class="css-truncate">
        <span class="css-truncate-target">eiffel100</span>
      </span>
    </a>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link js-menu-target tooltipped tooltipped-s" href="#" aria-label="Create new..." data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      
<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>


    <li class="dropdown-divider"></li>
    <li class="dropdown-header">
      <span title="semenoffalex/Exploratory-Data-Analysis">This repository</span>
    </li>
      <li>
        <a href="/semenoffalex/Exploratory-Data-Analysis/issues/new"><span class="octicon octicon-issue-opened"></span> New issue</a>
      </li>
</ul>

    </div>
  </li>

  <li class="header-nav-item">
        <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
        <span class="mail-status all-read"></span>
        <span class="octicon octicon-inbox"></span>
</a>
  </li>

  <li class="header-nav-item">
    <a class="header-nav-link tooltipped tooltipped-s" href="/settings/profile" id="account_settings" aria-label="Settings" data-ga-click="Header, go to settings, icon:settings">
      <span class="octicon octicon-gear"></span>
    </a>
  </li>

  <li class="header-nav-item">
    <form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="N6YuXWCZQ74WqNX4pKgFGVK8S4Zd0oJTKgeMNN10buHPlwApLKUhwVz1p3+FIHwSXgtr9OtIvpxuz6176evi5Q==" /></div>
      <button class="header-nav-link sign-out-button tooltipped tooltipped-s" aria-label="Sign out" data-ga-click="Header, sign out, icon:logout">
        <span class="octicon octicon-sign-out"></span>
      </button>
</form>  </li>

</ul>


    
  </div>
</div>

      

        


      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="MDDizmbVwSNie54ojqGQdp6pX4xR/eCMrGam4l7YTJ57Fo76oA19T7TWeMg9lyFyPwC/R5tsJb8uRUh3GoXeeQ==" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="19666546" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/semenoffalex/Exploratory-Data-Analysis/watchers">
        3
      </a>
      <a href="/semenoffalex/Exploratory-Data-Analysis/subscription"
        class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0" aria-haspopup="true">
        <span class="js-select-button">
          <span class="octicon octicon-eye"></span>
          Watch
        </span>
      </a>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
          <div class="select-menu-header">
            <span class="select-menu-title">Notifications</span>
            <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">Be notified when participating or @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">Be notified of all conversations.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">Never be notified.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <form accept-charset="UTF-8" action="/semenoffalex/Exploratory-Data-Analysis/unstar" class="js-toggler-form starred js-unstar-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="FqNOgWygMkSwGtPp6UKp+iNegM8HNQw34Sxl/UJhV28sblyMydUu1PnRFBQQbozO/4wZ1zNz4J8wL8t5t8Cmsg==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Unstar this repository" title="Unstar semenoffalex/Exploratory-Data-Analysis">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/semenoffalex/Exploratory-Data-Analysis/stargazers">
          0
        </a>
</form>
    <form accept-charset="UTF-8" action="/semenoffalex/Exploratory-Data-Analysis/star" class="js-toggler-form unstarred js-star-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ZNU9C50aVPPL+dEOHhWZyntf+AOJ11CDlckYVhK3OjHZ10+srh0J23+IrCCqCcsnd7hkJynQVyc5kL9UOv0rMw==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Star this repository" title="Star semenoffalex/Exploratory-Data-Analysis">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/semenoffalex/Exploratory-Data-Analysis/stargazers">
          0
        </a>
</form>  </div>

  </li>


        <li>
          <a href="/semenoffalex/Exploratory-Data-Analysis/fork" class="minibutton with-count js-toggler-target fork-button tooltipped-n" title="Fork your own copy of semenoffalex/Exploratory-Data-Analysis to your account" aria-label="Fork your own copy of semenoffalex/Exploratory-Data-Analysis to your account" rel="nofollow" data-method="post">
            <span class="octicon octicon-repo-forked"></span>
            Fork
          </a>
          <a href="/semenoffalex/Exploratory-Data-Analysis/network" class="social-count">29</a>
        </li>

</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/semenoffalex" class="url fn" itemprop="url" rel="author"><span itemprop="title">semenoffalex</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/semenoffalex/Exploratory-Data-Analysis" class="js-current-repository" data-pjax="#js-repo-pjax-container">Exploratory-Data-Analysis</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/semenoffalex/Exploratory-Data-Analysis/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/semenoffalex/Exploratory-Data-Analysis" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /semenoffalex/Exploratory-Data-Analysis">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/semenoffalex/Exploratory-Data-Analysis/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /semenoffalex/Exploratory-Data-Analysis/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
      <a href="/semenoffalex/Exploratory-Data-Analysis/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /semenoffalex/Exploratory-Data-Analysis/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>


      <li class="tooltipped tooltipped-w" aria-label="Wiki">
        <a href="/semenoffalex/Exploratory-Data-Analysis/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g w" data-selected-links="repo_wiki /semenoffalex/Exploratory-Data-Analysis/wiki">
          <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/semenoffalex/Exploratory-Data-Analysis/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /semenoffalex/Exploratory-Data-Analysis/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/semenoffalex/Exploratory-Data-Analysis/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /semenoffalex/Exploratory-Data-Analysis/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


</nav>

              <div class="only-with-full-nav">
                
  
<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/semenoffalex/Exploratory-Data-Analysis.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=clone">
  <h3><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="git@github.com:semenoffalex/Exploratory-Data-Analysis.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/semenoffalex/Exploratory-Data-Analysis" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>


  <a href="github-windows://openRepo/https://github.com/semenoffalex/Exploratory-Data-Analysis" class="minibutton sidebar-button" title="Save semenoffalex/Exploratory-Data-Analysis to your computer and use it in GitHub Desktop." aria-label="Save semenoffalex/Exploratory-Data-Analysis to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

                <a href="/semenoffalex/Exploratory-Data-Analysis/archive/master.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download the contents of semenoffalex/Exploratory-Data-Analysis as a zip file"
                   title="Download the contents of semenoffalex/Exploratory-Data-Analysis as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/semenoffalex/Exploratory-Data-Analysis/blob/6d0d60bfd01f4a9f7be40c7c08a38cd5a758d7be/plot1.R" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:2c7c7d1f658647298eb8fe4672896017 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/semenoffalex/Exploratory-Data-Analysis/blob/master/plot1.R"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="button-group right">
    <a href="/semenoffalex/Exploratory-Data-Analysis/find/master"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/semenoffalex/Exploratory-Data-Analysis" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">Exploratory-Data-Analysis</span></a></span></span><span class="separator">/</span><strong class="final-path">plot1.R</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="semenoffalex" class="avatar" data-user="1209785" height="24" src="https://avatars3.githubusercontent.com/u/1209785?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/semenoffalex" rel="author">semenoffalex</a></span>
        <time datetime="2014-05-11T21:49:18Z" is="relative-time">May 12, 2014</time>
        <div class="commit-title">
            <a href="/semenoffalex/Exploratory-Data-Analysis/commit/e4f9dceeba3dabfe2ea397436e34c16157ba5b7b" class="message" data-pjax="true" title="Create plot1.R">Create plot1.R</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>1</strong>
           contributor
        </a>
      </p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="semenoffalex" data-user="1209785" height="24" src="https://avatars3.githubusercontent.com/u/1209785?v=3&amp;s=48" width="24" />
            <a href="/semenoffalex">semenoffalex</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>21 lines (16 sloc)</span>
          <span class="meta-divider"></span>
        <span>0.741 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/semenoffalex/Exploratory-Data-Analysis/raw/master/plot1.R" class="minibutton " id="raw-url">Raw</a>
            <a href="/semenoffalex/Exploratory-Data-Analysis/blame/master/plot1.R" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/semenoffalex/Exploratory-Data-Analysis/commits/master/plot1.R" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->

          <a class="octicon-button tooltipped tooltipped-nw"
             href="github-windows://openRepo/https://github.com/semenoffalex/Exploratory-Data-Analysis?branch=master&amp;filepath=plot1.R" aria-label="Open this file in GitHub for Windows">
              <span class="octicon octicon-device-desktop"></span>
          </a>

              <a class="octicon-button tooltipped tooltipped-n js-update-url-with-hash"
                 aria-label="Clicking this button will fork this project so you can edit the file"
                 href="/semenoffalex/Exploratory-Data-Analysis/edit/master/plot1.R"
                 data-method="post" rel="nofollow"><span class="octicon octicon-pencil"></span></a>

            <a class="octicon-button danger tooltipped tooltipped-s"
               href="/semenoffalex/Exploratory-Data-Analysis/delete/master/plot1.R"
               aria-label="Fork this project and delete file"
               data-method="post" data-test-id="delete-blob-file" rel="nofollow">
          <span class="octicon octicon-trashcan"></span>
        </a>
      </div><!-- /.actions -->
    </div>
    

  <div class="blob-wrapper data type-r">
      <table class="highlight tab-size-8 js-file-line-container">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code js-file-line"><span class="pl-c">## Getting full dataset</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code js-file-line"><span class="pl-vo">data_full</span> <span class="pl-k">&lt;-</span> read.csv(<span class="pl-s1"><span class="pl-pds">&quot;</span>./Data/household_power_consumption.txt<span class="pl-pds">&quot;</span></span>, <span class="pl-v">header</span><span class="pl-k">=</span><span class="pl-c1">T</span>, <span class="pl-v">sep</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&#39;</span>;<span class="pl-pds">&#39;</span></span>, <span class="pl-v">na.strings</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>?<span class="pl-pds">&quot;</span></span>, </td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code js-file-line">                      <span class="pl-v">nrows</span><span class="pl-k">=</span><span class="pl-c1">2075259</span>, <span class="pl-v">check.names</span><span class="pl-k">=</span><span class="pl-c1">F</span>, <span class="pl-v">stringsAsFactors</span><span class="pl-k">=</span><span class="pl-c1">F</span>, <span class="pl-v">comment.char</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-v">quote</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&#39;</span><span class="pl-cce">\&quot;</span><span class="pl-pds">&#39;</span></span>)</td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code js-file-line"><span class="pl-vo">data_full</span><span class="pl-k">$</span><span class="pl-vo">Date</span> <span class="pl-k">&lt;-</span> as.Date(<span class="pl-vo">data_full</span><span class="pl-k">$</span><span class="pl-vo">Date</span>, <span class="pl-v">format</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>%d/%m/%Y<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code js-file-line"><span class="pl-c">## Subsetting the data</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code js-file-line"><span class="pl-vo">data</span> <span class="pl-k">&lt;-</span> subset(<span class="pl-vo">data_full</span>, <span class="pl-v">subset</span><span class="pl-k">=</span>(<span class="pl-vo">Date</span> <span class="pl-k">&gt;</span><span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>2007-02-01<span class="pl-pds">&quot;</span></span> <span class="pl-k">&amp;</span> <span class="pl-vo">Date</span> <span class="pl-k">&lt;</span><span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>2007-02-02<span class="pl-pds">&quot;</span></span>))</td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code js-file-line">rm(<span class="pl-vo">data_full</span>)</td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code js-file-line"><span class="pl-c">## Converting dates</span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code js-file-line"><span class="pl-vo">datetime</span> <span class="pl-k">&lt;-</span> paste(as.Date(<span class="pl-vo">data</span><span class="pl-k">$</span><span class="pl-vo">Date</span>), <span class="pl-vo">data</span><span class="pl-k">$</span><span class="pl-vo">Time</span>)</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code js-file-line"><span class="pl-vo">data</span><span class="pl-k">$</span><span class="pl-vo">Datetime</span> <span class="pl-k">&lt;-</span> as.POSIXct(<span class="pl-vo">datetime</span>)</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code js-file-line"><span class="pl-c">## Plot 1</span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code js-file-line">hist(<span class="pl-vo">data</span><span class="pl-k">$</span><span class="pl-vo">Global_active_power</span>, <span class="pl-v">main</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>Global Active Power<span class="pl-pds">&quot;</span></span>, </td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code js-file-line">     <span class="pl-v">xlab</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>Global Active Power (kilowatts)<span class="pl-pds">&quot;</span></span>, <span class="pl-v">ylab</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>Frequency<span class="pl-pds">&quot;</span></span>, <span class="pl-v">col</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>Red<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code js-file-line"><span class="pl-c">## Saving to file</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code js-file-line">dev.copy(<span class="pl-vo">png</span>, <span class="pl-v">file</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>plot1.png<span class="pl-pds">&quot;</span></span>, <span class="pl-v">height</span><span class="pl-k">=</span><span class="pl-c1">480</span>, <span class="pl-v">width</span><span class="pl-k">=</span><span class="pl-c1">480</span>)</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code js-file-line">dev.off()</td>
      </tr>
</table>

  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="https://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.06140s from github-fe132-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder=""></textarea>
      <div class="suggester-container">
        <div class="suggester fullscreen-suggester js-suggester js-navigation-container"></div>
      </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-153d6254b838872c8db73c8bd92905913f6f5b2164b7e40e5292286bd5a39403.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-e8ca46a2e29541d45494e81776bef3c24c5a9e08fcf9e2bea936409c77390776.js" type="text/javascript"></script>
      
      
  </body>
</html>

