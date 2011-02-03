<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: twit.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=twit.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: twit.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=twit.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for twit.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=twit.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22twit.el%22">twit.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/twit.el">Download</a></p><pre class="code"><span class="linecomment">;;; Twit.el --- interface with twitter.com</span>
(defvar twit-version-number "<span class="quote">0.3.6</span>")
<span class="linecomment">;; Copyright (c) 2007 Theron Tlax</span>
<span class="linecomment">;;           (c) 2008-2009 Jonathan Arkell</span>
<span class="linecomment">;; Time-stamp: &lt;2007-03-19 18:33:17 thorne&gt;</span>
<span class="linecomment">;; Author: thorne &lt;thorne@timbral.net&gt;, jonnay &lt;jonnay@jonnay.net&gt;</span>
<span class="linecomment">;; Created: 2007.3.16</span>
<span class="linecomment">;; Keywords: comm</span>
<span class="linecomment">;; Favorite Poet: E. E. Cummings</span>

<span class="linecomment">;; This file is not part of GNU Emacs.</span>

<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation version 2.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful, but</span>
<span class="linecomment">;; WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="linecomment">;; General Public License for more details.</span>

<span class="linecomment">;; For a copy of the GNU General Public License, search the Internet,</span>
<span class="linecomment">;; or write to the Free Software Foundation, Inc., 59 Temple Place,</span>
<span class="linecomment">;; Suite 330, Boston, MA 02111-1307 USA</span>

<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This is the beginnings of a library for interfacing with</span>
<span class="linecomment">;; twitter.com from Emacs.  It is also (more importantly) some</span>
<span class="linecomment">;; interactive functions that use that library.  It's a hack, of</span>
<span class="linecomment">;; course; RMS i am not.  Maybe one of you real programmers would</span>
<span class="linecomment">;; like to clean it up?</span>
<span class="linecomment">;;    -- Theron Tlax</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Okay! ;)</span>
<span class="linecomment">;;    -- JonathanArkell</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Twit.el is rapidly maturing library.  Currently it handles your</span>
<span class="linecomment">;; friends timeline, direct messagse (sending and receiving) and</span>
<span class="linecomment">;; even searches.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can use the function `twit-post' to send a tweet.  Heck</span>
<span class="linecomment">;; I'd appreciate knowing who uses twit.el so go ahead and tweet</span>
<span class="linecomment">;; something to that effect!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can use the function `twit-follow-recent-tweets' to have</span>
<span class="linecomment">;; twit.el constantly check updates, and write them in a buffer.</span>
<span class="linecomment">;; alternatly, you can just use `twit-show-recent-tweets'</span>
<span class="linecomment">;; to just show you the last 15 tweets.  In this timeline view</span>
<span class="linecomment">;; type ? to show you a list of commands you can use.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; For searches, you an use `twit-search' to run a general search.</span>
<span class="linecomment">;; The search will remember the terms you used, so you can use</span>
<span class="linecomment">;; tab completion when promped.  Also, you can customize the</span>
<span class="linecomment">;; variable `twit-completing-searches' to store your common</span>
<span class="linecomment">;; searches for later.  The command `twit-search-at-to-me' to do</span>
<span class="linecomment">;; a @&lt;username&gt; search.  The search functions were just recently</span>
<span class="linecomment">;; added, and their output will be improved soon.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; For direct messages you can use `twit-show-direct-tweets' to</span>
<span class="linecomment">;; get your direct messages, and `twit-direct' to send them.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If you want, you can display images on the timeline as well,</span>
<span class="linecomment">;; customize the variable `twit-show-user-images', and set it to</span>
<span class="linecomment">;; true.  When you do that, you'll also get tab completion on</span>
<span class="linecomment">;; the twit direct function.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Both `twit-show-direct-tweets' and `twit-show-recent-tweets'</span>
<span class="linecomment">;; can accept numeric prefix commands.  With a numeric prefix,</span>
<span class="linecomment">;; they will skip to that page.  So:</span>
<span class="linecomment">;;      C-u 2 M-x twit-show-recent-tweets</span>
<span class="linecomment">;; will take you to the next page of recent tweets (older ones)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This uses Twitter's XML-based api, not the JSON one because i</span>
<span class="linecomment">;; would like to avoid making the user install third-party libraries</span>
<span class="linecomment">;; to use it.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Even though twit.el uses Basic Authentication, it also uses HTTPS</span>
<span class="linecomment">;; to connect to twitter (for all auth based services anyway).  So</span>
<span class="linecomment">;; security problems are dealt with.</span>
<span class="linecomment">;;</span>

<span class="linecomment">;;; Notes:</span>
<span class="linecomment">;; `twit-user' gets my vote for variable name of the year.  Ditto</span>
<span class="linecomment">;; `twit-minor-mode' for mode names.</span>
<span class="linecomment">;; `twit.el' is pronounced twit-el.  When said fast, it should</span>
<span class="linecomment">;;   sound like "tiddle"</span>

<span class="linecomment">;;; Hacking:</span>
<span class="linecomment">;; Feel free to hack on this if you like, and post it back to</span>
<span class="linecomment">;; the emacswiki.  Just be sure to increment the version number</span>
<span class="linecomment">;; and write a change to the change log.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Mutli-user support is still very experimental right now.</span>
<span class="linecomment">;; use the macro `with-twit-auth' to temporarily switch auth.</span>
<span class="linecomment">;; This needs better support, coming soon.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; From versions 0.1.0 onwards, versions are incremented like so:</span>
<span class="linecomment">;; &lt;major&gt;.&lt;minor&gt;.&lt;bugfix/feature&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Major versions are only incremented when a release is considered</span>
<span class="linecomment">;; truely stable (i.e. no memory leaks) and doesn't have any bugs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Minor version increments happen when there are significant changes</span>
<span class="linecomment">;; to the file (like changing twit-post-function to twit-post-status)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; bugfix/feature releases are incremented when new features are added</span>
<span class="linecomment">;; or bugs are fixed, that have little impact.</span>

<span class="linecomment">;;; Testing:</span>
<span class="linecomment">;; Best way to test it in default mode:</span>
<span class="linecomment">;;   emacs --no-site-file --no-init-file</span>
<span class="linecomment">;; In scratch buffer:</span>
<span class="linecomment">;; (load "~/my-elisp/twit.el")</span>
<span class="linecomment">;; (twit-show-recent-tweets)</span>
<span class="linecomment">;; (twit-follow-recent-tweets)</span>

<span class="linecomment">;;; History:</span>
<span class="linecomment">;; Originally by theron tlax &lt;thorne@timbral.net&gt; 2007-3-16</span>
<span class="linecomment">;; * 0.0.1 -- Initial release.  Posting only. (TT)</span>
<span class="linecomment">;; * 0.0.2 -- Near-total rewrite; better documentation; use standard</span>
<span class="linecomment">;;            Emacs xml and url packages; minor mode; a little</span>
<span class="linecomment">;;            abstraction; some stubs for the reading functions. (TT)</span>
<span class="linecomment">;; * 0.0.3 -- Doc and other minor changes. (TT)</span>
<span class="linecomment">;; * 0.0.4 -- (released as 0.0.3 -- Added twit-show-recent-tweets</span>
<span class="linecomment">;;             by Jonathan Arkell)</span>
<span class="linecomment">;; * 0.0.5 -- Add source parameter to posts (TT)</span>
<span class="linecomment">;; * 0.0.6 -- Re-working twit-show-recent-tweets to show more info</span>
<span class="linecomment">;;            (and to get it working for me) -- by H Durer</span>
<span class="linecomment">;; * 0.0.7 -- Keymaps in the buffers for twit-show-recent-tweets and</span>
<span class="linecomment">;;            twit-list-followers; encode the post argument so that it</span>
<span class="linecomment">;;            is a valid post request (TT)</span>
<span class="linecomment">;; * 0.0.8 -- faces/overlays to make the *Twit-recent* buffer look</span>
<span class="linecomment">;;            prettier and more readable (at least for me) -- by H Durer</span>
<span class="linecomment">;; * 0.0.9 -- follow-recent-tweets function created so automagickally</span>
<span class="linecomment">;;            follow tweets every 5 mins.  Also removed twit-mode</span>
<span class="linecomment">;;            on twit-show-recent-tweets.  (it was setting twit-mode</span>
<span class="linecomment">;;            globally, and interfering with planner)  (JA)</span>
<span class="linecomment">;; * 0.0.10 - There is a hook that is run when a new tweet is seen.</span>
<span class="linecomment">;;            This can be used to interface with the todochiku package</span>
<span class="linecomment">;;            to send a notification that there is a new tweet.</span>
<span class="linecomment">;;            (or anything else for that matter)</span>
<span class="linecomment">;;            Twit-user and Twit-pass are now customizeable variables</span>
<span class="linecomment">;;            that work.  Finally, no more constant re-entry of your</span>
<span class="linecomment">;;            username and password. (JA)</span>
<span class="linecomment">;; * 0.0.11 - Updated to set a customization for the</span>
<span class="linecomment">;;            follow-recent-tweets idle timer.  This is so that you</span>
<span class="linecomment">;;            wont get throttled when twitter changes their throttle</span>
<span class="linecomment">;;            time (JA)</span>
<span class="linecomment">;; * 0.0.12 - Changed syncronous url call to an ascynronous one that</span>
<span class="linecomment">;;            doesn't suck, and polls properly.</span>
<span class="linecomment">;;            You can finally stop following recent tweets. (Rev 22) (JA)</span>
<span class="linecomment">;; * 0.0.13 - Fixed twit-debug to be a customizeable variable.  Duh.</span>
<span class="linecomment">;;            Image handling is on the way. (done, just buggy)</span>
<span class="linecomment">;;            Better face definitions, now customizeable.</span>
<span class="linecomment">;;            Zebra-tabling of the recent tweets is half there.</span>
<span class="linecomment">;;            Retrieval of the rate-limiting is working. (Rev 23) (JA)</span>
<span class="linecomment">;; * 0.0.14 - Finished zebra-table for recent tweets. (uses overlays)</span>
<span class="linecomment">;;            Fix for a really crazy bug in carbon emacs. (thanks gr3p3)</span>
<span class="linecomment">;;            Tweaked default fonts to not suck, added more faces.</span>
<span class="linecomment">;;            If showing recent tweets fails, the buffer is no longer</span>
<span class="linecomment">;;            set to blank. (JA)</span>
<span class="linecomment">;; * 0.0.15 - Fixed the automatic rate-limiting on 400 messages from</span>
<span class="linecomment">;;            twitter to work.</span>
<span class="linecomment">;;            Updated rate limiting to use the new format</span>
<span class="linecomment">;;            More messages are handed off to todochiku</span>
<span class="linecomment">;;            Most rate limiting (except the initial follow) is done</span>
<span class="linecomment">;;            Asyncronously.</span>
<span class="linecomment">;;            Verified that twit-list-followers works.</span>
<span class="linecomment">;;            URLs now are fontified and hot.</span>
<span class="linecomment">;;            Maybe (maybe?) fixed the bug where following tweets</span>
<span class="linecomment">;;            kills the mark, and dumps the point at the bottom. (JA)</span>
<span class="linecomment">;; * 0.0.16 - Fixed most compilation warnings. (PeterJones)</span>
<span class="linecomment">;; * 0.0.17 - Fixed a bug where a users username/password pair is</span>
<span class="linecomment">;;            not properly updated through customization.  It's not</span>
<span class="linecomment">;;            100%, but it should be much better now. (JA)</span>
<span class="linecomment">;;            twit-show-recent-tweets doesn't change focus. (thanks Ben Atkin)</span>
<span class="linecomment">;; * 0.0.18 - Fixed a bug where xml entities were not converted while</span>
<span class="linecomment">;;            tweet messages (JonathanCreekmore)</span>
<span class="linecomment">;; * 0.0.19 - Fixed a bug where the previous tweets in the *Twit-recent* buffer</span>
<span class="linecomment">;;            were saved on the undo list every time new tweets came in. (JonathanCreekmore)</span>
<span class="linecomment">;; * 0.0.20 - Added support for "Reply to" in the twit-post function. (JonathanCreekmore)</span>
<span class="linecomment">;; * 0.0.21 - The rate-limit timer is cancelled as well as the main</span>
<span class="linecomment">;;            timer.</span>
<span class="linecomment">;;            Regexp filtering of tweets.  (JonathanArkell)</span>
<span class="linecomment">;; * 0.0.22 - Fixed infinite loop problem if you cannot retrieve the rate-limit.</span>
<span class="linecomment">;;            Could be the cause of the memory leak.</span>
<span class="linecomment">;;          - Added elisp function to return following users as list.</span>
<span class="linecomment">;;          - fixed regex problem (JA)</span>
<span class="linecomment">;; * 0.0.23 - made sure that url-retrive is wrapped around a let to shadow</span>
<span class="linecomment">;;            url-request-method with GET.</span>
<span class="linecomment">;;          - Optional filtering of @ message to people you don't know.</span>
<span class="linecomment">;;          - Added Images!  Whute!  Make sure you check customization options. (JA)</span>
<span class="linecomment">;; * 0.0.24 - Updated image handling to only download and install when images are</span>
<span class="linecomment">;;            turned on.</span>
<span class="linecomment">;;          - Enabled confirmation of posting tweets</span>
<span class="linecomment">;;          - Enabled direct messages. (JA)</span>
<span class="linecomment">;; * 0.0.25 - Updated image handling again so that the local copy of image are used</span>
<span class="linecomment">;;            when available.</span>
<span class="linecomment">;;          - Now you can view direct tweets!  Whute! (JA)</span>
<span class="linecomment">;; * 0.0.26 - You can hit "d" in a list of tweets to direct-message that user.</span>
<span class="linecomment">;;          - Documentation improved, especially interactive and customs</span>
<span class="linecomment">;;          - Documentation merged.</span>
<span class="linecomment">;;          - source code is made more tagging friendly (for free-tagging.el)</span>
<span class="linecomment">;;          - zebra table face definition sucks less.  Hopefully this will</span>
<span class="linecomment">;;            look better for those of you on dark-background screens.</span>
<span class="linecomment">;;          - older tweets and direct messages are viewable with prefix</span>
<span class="linecomment">;;            arguments.  (JA)</span>
<span class="linecomment">;; * 0.1.0  - Finally considered ready for 0.1 primetime! ;)</span>
<span class="linecomment">;;          - Super improved error handling when you try to show recent</span>
<span class="linecomment">;;            tweets.  This should help with peoples install problems.</span>
<span class="linecomment">;;          - HTTPS instead of HTTP.   Let me know if there are any</span>
<span class="linecomment">;;            problems with this, and if I need to have the protocol a</span>
<span class="linecomment">;;            settable option.</span>
<span class="linecomment">;;          - Searches started.  Right now its just the bare minimum of</span>
<span class="linecomment">;;            features.  More and better searches to come.</span>
<span class="linecomment">;;          - Properly Makred my own, and Therons changes in the changelog.</span>
<span class="linecomment">;;          - Added macro for displaying twitter buffers</span>
<span class="linecomment">;;          - commentary, installing, and other documentation improved. (JA)</span>
<span class="linecomment">;; * 0.1.1  - Fixed image bug with filename collisions. (thanks @learnemacs)</span>
<span class="linecomment">;;          - Fixed bug with twit-follow-recent-tweets (thanks @busytoby) (JA)</span>
<span class="linecomment">;; * 0.2.0  - Added the ability to follow people.</span>
<span class="linecomment">;;          - changed underlying code.  twit-post-function is now a general</span>
<span class="linecomment">;;            function for POSTing api messages to twitter.  twit-post-status</span>
<span class="linecomment">;;            is the specific function to post a status message.</span>
<span class="linecomment">;;          - Display of favorite tweets</span>
<span class="linecomment">;;          - Raw posting of favorite tweets</span>
<span class="linecomment">;;          - Post favorite tweets with *, remove favorites with -</span>
<span class="linecomment">;;          - infrastructure to handle reply-to's a lot better (coming soon)</span>
<span class="linecomment">;;          - hitting 's' when the point is on a #tag or @name will search</span>
<span class="linecomment">;;            that entity.</span>
<span class="linecomment">;;          - @names have basic keymaps, like a)dd p)ost to and d)irect msg</span>
<span class="linecomment">;;          - Regex for determining what is and isn't a hashtag should be</span>
<span class="linecomment">;;            better.</span>
<span class="linecomment">;; - 0.2.1  - Fixed a bug that put the list of tweets on the kill ring.</span>
<span class="linecomment">;;          - removed twit-grab-author-of-tweet, (its superceeded by</span>
<span class="linecomment">;;            (twit-get-text-property 'twit-user)</span>
<span class="linecomment">;;          - added with-twit-auth macro, so that you can use more then</span>
<span class="linecomment">;;            one twitter account.  Better support forthcoming)</span>
<span class="linecomment">;;          - fixed potential auth bug with https</span>
<span class="linecomment">;;          - added function to visit url (current url, users twit url)</span>
<span class="linecomment">;;          - fixed regex for @tweets and #tags.</span>
<span class="linecomment">;;          - tweaked get-friends</span>
<span class="linecomment">;;          - made twit-filter-at-tweets use get-friends cache, so you</span>
<span class="linecomment">;;            don't need images on.</span>
<span class="linecomment">;;          - Added ascii logo to title bar</span>
<span class="linecomment">;;          - fixed a bug in image retrieval that would try to retrieve</span>
<span class="linecomment">;;            the image through a POST method instead of GET. (JA)</span>
<span class="linecomment">;; - 0.2.2  - fixed botched refactoring of twit-at-friends-cache  (JA)</span>
<span class="linecomment">;; - 0.2.3  - Multi-account handling improved, you can switch accounts</span>
<span class="linecomment">;;            with `twit-switch-account'</span>
<span class="linecomment">;;          - Added the page number you're on to the title bar</span>
<span class="linecomment">;;          - fixed paging of `twit-show-direct-tweets' (JA)</span>
<span class="linecomment">;; - 0.3.0  - Renamed with-twitter-/foo/ to with-twit-/foo/ for better</span>
<span class="linecomment">;;            consistancy, and less chances to collide with twitter.el.</span>
<span class="linecomment">;;          - fixed bug caused by refactoring with twit-direct</span>
<span class="linecomment">;;          - updated url regex.</span>
<span class="linecomment">;;          - Added timezone patch from remvee (this patch somehow</span>
<span class="linecomment">;;            got lost somewhere but is FINALLY applied)</span>
<span class="linecomment">;;          - added multi-account functions:</span>
<span class="linecomment">;;             - `twit-direct-with-account'</span>
<span class="linecomment">;;             - `twit-post-with-account'</span>
<span class="linecomment">;;             - `twit-show-direct-tweets-with-account'</span>
<span class="linecomment">;;             - `twit-show-at-tweets-with-account'</span>
<span class="linecomment">;;          - ran through checkdoc (JA)</span>
<span class="linecomment">;; - 0.3.1  - Added proper title bars and zebra tables to friends</span>
<span class="linecomment">;;            and followers listings. (JA)</span>
<span class="linecomment">;; - 0.3.2  - Applied patch to show you post length on minibuffer</span>
<span class="linecomment">;;            (Can't find email to properly credit this patch. :P</span>
<span class="linecomment">;;             credit coming soon)</span>
<span class="linecomment">;;          - Applied ieure's patches: </span>
<span class="linecomment">;;            - better (more emacs consistent) keymaps</span>
<span class="linecomment">;;            - reply-to handling, properly set reply Id.</span>
<span class="linecomment">;;            - quiet down url-retrieval.  (speeds things up)</span>
<span class="linecomment">;;            - friends list has twit-user set.</span>
<span class="linecomment">;;            - renamed twit-mode to twit-minor-mode</span>
<span class="linecomment">;;          - removed extraneous keymaps (JA)</span>
<span class="linecomment">;; - 0.3.3  - Auto-install function added.  When you are over text</span>
<span class="linecomment">;;            that matches the name of an elisp file, you can press</span>
<span class="linecomment">;;            "i" to install that file from emacs wiki, provided you</span>
<span class="linecomment">;;            have auto-install. (JA)</span>
<span class="linecomment">;; - 0.3.4  - Added retweet function, bound to "c" (think "copy"). Point</span>
<span class="linecomment">;;            must be over the text of the tweet being RT'd. As a side</span>
<span class="linecomment">;;            effect, the text of a tweet now carries the property</span>
<span class="linecomment">;;            'twit-message .</span>
<span class="linecomment">;;          - Added twit-post-loud-reply, which automatically uses ".@"</span>
<span class="linecomment">;;            instead of "@". Bound to "R".</span>
<span class="linecomment">;;          - small fixes to tweet navigation</span>
<span class="linecomment">;;          - Added URL compression function and twit-post-url, bound</span>
<span class="linecomment">;;            to "u". Prompts for URL first, then the rest of the text.</span>
<span class="linecomment">;;            Currently uses is.gd. (@laciermaths)</span>
<span class="linecomment">;; - 0.3.5  - Fix keymap.  Searches are now "S" (JA)</span>
<span class="linecomment">;;          - forward and back fixed (whym)</span>
<span class="linecomment">;;          - Tightened up search results a little, added author (JA)</span>
<span class="linecomment">;;          - Better error checking on twit-parse-xml. (JA)</span>
<span class="linecomment">;;          - Fixed twit-id to work with favoriting again. (JA)</span>
<span class="linecomment">;;          - added twanalist urls, and API (JA)</span>
<span class="linecomment">;;          - Added api for friendship graphing functions (JA)</span>
<span class="linecomment">;;          - twit-show-followers now accepts numeric prefix arg (JA)</span>
<span class="linecomment">;;          - Changed name of twit-list-followers to twit-show-followers </span>
<span class="linecomment">;;            twit-list-followers is an alias, but its use is deprecated.(JA)</span>
<span class="linecomment">;;          - made sure twit.el will survive the twitpocalypse. (JA)</span>
<span class="linecomment">;;          - Started work on buffer based posting. (unfinished) (JA)</span>
<span class="linecomment">;;          - direct messages now use character counting function. (JA)</span>
<span class="linecomment">;;          - twitter diarrhea filtering function. (JA)</span>
<span class="linecomment">;;          - started work on i18n support.  (unfinished) (JA)</span>
<span class="linecomment">;; - 0.3.6  - Added twit-open-link, and bound it to "o". (BC)</span>

<span class="linecomment">;;; TODO:</span>
<span class="linecomment">;; - remember style buffer posting.</span>

<span class="linecomment">;;; Bugs:</span>
<span class="linecomment">;; * too much Unilinguality.  Multi-lingual messages would be ideal.</span>
<span class="linecomment">;; * Arg.  the mark gets hosed by twit.el.  This needs to be fixed soon.</span>
<span class="linecomment">;;   (found by wilane)</span>
<span class="linecomment">;; * notifications are bunk and need to be re-jiggered, and fit in with</span>
<span class="linecomment">;;   at searches and direct messagse</span>
<span class="linecomment">;; * refresh is broken on some pages, and needs to be handled better.</span>
<span class="linecomment">;; * titlebar shows up at the bottom once in awhile.</span>

<span class="linecomment">;; Please report bugs to the twit emacs wiki page at:</span>
<span class="linecomment">;;   http://www.emacswiki.org/cgi-bin/wiki/TwIt</span>

<span class="linecomment">;;; Roadmap (todo):</span>
<span class="linecomment">;; v1.0 release</span>
<span class="linecomment">;; - optionally authenticate via open-auth instead of http auth.</span>
<span class="linecomment">;; - fix the mark getting hosed.</span>
<span class="linecomment">;; - make follow smarter, and give the latest tweet id as an arg</span>
<span class="linecomment">;; - make follow general, so direct messages and at messages are</span>
<span class="linecomment">;;   updated.</span>
<span class="linecomment">;; - finish exposing the rest of the twitter api (public timeline, etc.)</span>
<span class="linecomment">;; Post 1.0</span>
<span class="linecomment">;; - make the user images float right.  (thanks busytoby)</span>
<span class="linecomment">;; - Integrate the other twit.el that is out there.  Looks like it might</span>
<span class="linecomment">;;   have some serious sexxxy to it.</span>

<span class="linecomment">;;; Code:</span>

(require 'xml)
(require 'url)
(require 'url-http)

(eval-when-compile
  (require 'cl))

<span class="linecomment">;;* custom helper auth</span>
(defun twit-set-auth (user pass)
   "<span class="quote">Set the http url authentication string from USER and PASS.</span>"
   (let ((old-http-storage
          (assoc "<span class="quote">twitter.com:80</span>" (symbol-value url-basic-auth-storage)))
         (old-https-storage
          (assoc "<span class="quote">twitter.com:443</span>" (symbol-value url-basic-auth-storage)))
         (auth-pair
          (cons "<span class="quote">Twitter API</span>"
                (base64-encode-string (format "<span class="quote">%s:%s</span>" user pass)))))
     (when old-http-storage
       (set url-basic-auth-storage
            (delete old-http-storage (symbol-value url-basic-auth-storage))))
     (when old-https-storage
       (set url-basic-auth-storage
            (delete old-https-storage (symbol-value url-basic-auth-storage))))
     (set url-basic-auth-storage
          (cons (list "<span class="quote">twitter.com:443</span>" auth-pair)
                (cons (list "<span class="quote">twitter.com:80</span>" auth-pair)
                      (symbol-value url-basic-auth-storage))))))

<span class="linecomment">;;* custom helper auth</span>
(defun twit-set-user-pass (sym val)
  "<span class="quote">Set the username/password pair after a customization.

Called with SYM and VAL by customize.  SYM is generally not used.

Note that this function uses a really cheap hack.
Basically the problem is that we need to run this whenever the `twit-user'
and `twit-pass' variables are customized and loaded.  The problem is, this
funciton is executed by cutomzie on Emacs initialization, during the
setting of `twit-user', but before the binding to `twit-pass', throwing an
error.

We get around this by using `condition-case' and handling the void-varible
error.</span>"
  (set-default sym val)
  (condition-case nil
      (let ((twit-pass-var 'twit-pass))
        (when (and (not (string= (symbol-value twit-pass-var) "<span class="quote"></span>"))
                   (not (string= twit-user "<span class="quote"></span>")))
          (twit-set-auth twit-user (symbol-value twit-pass-var))))
    (void-variable nil)))

<span class="linecomment">;; Use this when testing the basic storage engine.</span>
<span class="linecomment">;; Set up for easy space for your C-x C-e execution pleasure.</span>
(when nil
	  (set url-basic-auth-storage nil)
	  )

<span class="linecomment">;;* custom</span>
(defgroup twit nil
  "<span class="quote">twit.el is an emacs package for interfacing with Twitter (http://www.twitter.com),
a microblogging service. The twit.el package provides you with the ability to post
status updates and driect messages, as well as recieve them.  Additionally you can
opt to \"follow\", and the timeline will be updated automagickally.

twit.el also makes use of the Todochiku package, which you can install from here:
http://www.emacswiki.org/emacs/todochiku.el</span>"
  :version "<span class="quote">0.1</span>"
  :group 'twit)

(defcustom twit-user
  "<span class="quote"></span>"
  "<span class="quote">Your twitter username.
If this is set, attempt to automagickally log into twitter.</span>"
  :group 'twit
  :type 'string
  :set 'twit-set-user-pass)

(defcustom twit-pass
  "<span class="quote"></span>"
  "<span class="quote">Your twitter password.
If this is set, attempt to automagickally log into twitter.</span>"
  :group 'twit
  :type 'string
  :set 'twit-set-user-pass)

(defcustom twit-new-tweet-hook
  '()
  "<span class="quote">Functions to execute when there is a new tweet.
If you have Todochiku, add \"twit-todochiku\" here, and you will be
notified when a new tweet appears.</span>"
  :type 'hook
  :group 'twit)

(defcustom twit-follow-idle-interval
  90
  "<span class="quote">How long in time to wait before checking for new tweets.
Right now it will check every 90 seconds, Which will generate a maximum
of 40 requests, leaving you another 30 per hour to play with.

The variable name is a bit of a misnomer, because it is not actually
based on idle time (anymore).</span>"
  :type 'integer
  :group 'twit)

(defvar twit-shadow-follow-idle-interval
  twit-follow-idle-interval
  "<span class="quote">Shadow definition of `twit-follow-idle-interval' that we can modify
on the fly.</span>")

(defcustom twit-protocol "<span class="quote">http</span>"
  "<span class="quote">Which protocol to use for twitter.

If you use http, the requests will be much faster, and there will be
a lot less messages at the bottom of the screen.   However, your
password will be sent plaintext.

If you use https, it is noisier, and slower, but (obviously) secure.

Note, if you change this, you will need to restart emacs for it to
take effect.</span>" 
  :type '(choice (const :tag "<span class="quote">http</span>" "<span class="quote">http</span>")
				 (const :tag "<span class="quote">https</span>" "<span class="quote">https</span>"))

  :group 'twit)

(defcustom twit-language 'en
  "<span class="quote">Language 語

Language that twit.el is in.  This is an experimental feature, that
I want to soon move into an international language pack feature for
all elisp packages.</span>" 
  :type '(choice (const :tag "<span class="quote">English</span>" 'en)
				 (const :tag "<span class="quote">日本語</span>" 'ja))
  :group 'twit)

(defcustom twit-show-user-images nil
   "<span class="quote">Show user images beside each users tweet.</span>"
   :type 'boolean
   :group 'twit)

(defcustom twit-user-image-dir
  (concat (car image-load-path) "<span class="quote">twitter</span>")
  "<span class="quote">Directory where twitter user images are to be stored.

This directory need not be created.</span>"
  :type 'string
  :group 'twit)

(defcustom twit-posting-function 'twit-query-for-post
  "<span class="quote">Function to get posting input from the user.

This applies to status posts, replies, and direct messages.

NOTE: this is not ready for primetime!  Please leave at `twit-query-for-post'
</span>" 
  :type 'function
  :group 'twit)

(defcustom twit-debug
  nil
  "<span class="quote">Whether or not to run twit.el in debug mode.</span>"
  :group 'twit
  :type 'boolean)

(defcustom twit-debug-mem
  nil
  "<span class="quote">Turn on memory debugging.</span>"
  :group 'twit
  :type 'boolean)

(defcustom twit-filter-tweets-regex "<span class="quote"></span>"
  "<span class="quote">Filter all tweets with this regex.

This is useful if you do not want to see a particular style of tweet.
For isntance, if hash-tagging pisses you off, you could set this to \"#\" and
no hash-tagging messages would get to you.</span>"
  :type 'regexp
  :group 'twit)

(defcustom twit-filter-at-tweets nil
   "<span class="quote">Filter any tweets that have @user of a user you don't know.

If enabled, every tweet will be scanned for any @msgs.  If they contain one,
and the username is not a user that you are following (or you) then it will be
ignored.</span>"
   :type 'boolean
   :group 'twit)

(defcustom twit-filter-diarrhea 0
  "<span class="quote">After x number of tweets from the same user, ignore tweets by them.

0 means let all tweets through.

Some twitter users have the annoying habit of going on twitter bombs,
where they output 3 or more tweets.  Generally, I find that these
diarrhea sessions are very content free, and worth ignoring.

A good number here is 3.</span>"
  :type 'integer
  :group 'twit)

(defcustom twit-completing-searches nil
  "<span class="quote">A list of searches you perform over and over again.

This is so that you can use the completion interface for when you want to run a
search.</span>"
  :type '(repeat string)
  :group 'twit)

<span class="linecomment">;;* custom multi-account auth</span>
(defcustom twit-multi-accounts 'nil
   "<span class="quote">A list of username/password pairs for multi-account usage.

Twit.el can also handle multi-accounts, which is particularly useful for people
 (like me) who have more then one twitter account.

Each item in the list is a pair, with the car being the account name,
and cdr the password.

IF YOU USE THIS FEATURE, BE SURE TO SET YOUR MAIN ACCOUNT IN HERE
AS WELL.  Otherwise your primary login credentials may get wacked.</span>"
   :type '(repeat (cons string string))
   :group 'twit)

<span class="linecomment">;;* face</span>
(defface twit-message-face
    '((default
       :family "<span class="quote">helv</span>"
       :height 1.1))
  "<span class="quote">The font face to use for a twitter message.</span>"
  :group 'twit)

(defface twit-author-face
    '((t
       (:height 0.8
        :weight bold
        :family "<span class="quote">mono</span>")))
  "<span class="quote">The font face to use for the authors name</span>"
  :group 'twit)

(defface twit-info-face
    '((t (:height 0.8 :slant italic)))
  "<span class="quote">Face for displaying where, how and when someone tweeted.</span>"
  :group 'twit)

(defface twit-title-face
    '((((background light))
       (:background "<span class="quote">PowderBlue</span>"
        :underline "<span class="quote">DeepSkyBlue</span>"
        :box (:line-width 2 :color "<span class="quote">PowderBlue</span>" :style 0)))
      (((background dark))
       (:background "<span class="quote">PowderBlue</span>"
        :underline "<span class="quote">DeepSkyBlue</span>"
        :box (:line-width 2 :color "<span class="quote">PowderBlue</span>" :style 0)))
      (t (:underline "<span class="quote">white</span>")))
  "<span class="quote">Title Area of the recent tweets buffer.</span>"
  :group 'twit)

(defface twit-logo-face
    '((((class color))
       (:family "<span class="quote">mono</span>"
        :weight bold
        :height 1.5
        :box (:line-width 2 :color "<span class="quote">PowderBlue</span>" :style 0)
        :background "<span class="quote">Yellow3</span>"
        :foreground "<span class="quote">Yellow1</span>"
        :underline "<span class="quote">DeepSkyBlue</span>"))
      (t (:inverse)))
  "<span class="quote">(^)o&lt;</span>"
  :group 'twit)

(defface twit-hash-at-face
    '((((class color) (background light))
       (:foreground "<span class="quote">GoldenRod3</span>"))
      (((class color) (background dark))
       (:foreground "<span class="quote">GoldenRod</span>"))
      (t (:underline "<span class="quote">white</span>")))
  "<span class="quote">Face to show @msgs in</span>"
  :group 'twit)

(defface twit-zebra-1-face
    '((((class color) (background light))
       (:foreground "<span class="quote">black</span>" :background "<span class="quote">gray89</span>"
        :box (:line-width 2 :color "<span class="quote">gray89</span>" :style 0)))
      (((class color) (background dark))
       (:foreground "<span class="quote">white</span>" :background "<span class="quote">black</span>"
        :box (:line-width 2 :color "<span class="quote">black</span>" :style 0)))
      (t (:inverse)))
  "<span class="quote">Color one of zebra-striping of recent tweets and followers list.</span>"
  :group 'twit)

(defface twit-zebra-2-face
    '((((class color) (background light))
       (:foreground "<span class="quote">black</span>" :background "<span class="quote">AliceBlue</span>"
        :box (:line-width 2 :color "<span class="quote">AliceBlue</span>" :style 0)))
      (((class color) (background dark))
       (:foreground "<span class="quote">white</span>" :background "<span class="quote">grey4</span>"
        :box (:line-width 2 :color "<span class="quote">grey4</span>" :style 0))))
  "<span class="quote">Color two of zebra-striping of recent tweets and followers list.</span>"
  :group 'twit)

(defface twit-error-face
    '((((class color))
       (:family "<span class="quote">mono</span>"
        :background "<span class="quote">FireBrick</span>" :foreground "<span class="quote">Black</span>"))
      (t (:inverse)))
  "<span class="quote">Color of twit.el errors.</span>"
  :group 'twit)

(defface twit-too-long-face
    '((((supports :strike-through t)) :strike-through t )
      (t :inherit 'font-lock-warning-face))
  
  "<span class="quote">Face for highlighting a twit that's too long to post</span>"
  :group 'twit)

(defface twit-url-face
    '((default
       :weight bold))
  "<span class="quote">Face for showing hyperlinks</span>"
  :group 'twit)

(defface twit-favorite-face
    '((((class color))
       (:family "<span class="quote">mono</span>"
        :weight bold
        :height 2.0
        :foreground "<span class="quote">gold1</span>"))
      (t (:underline white)))
  "<span class="quote">Face for displaying the favorite</span>"
  :group 'twit)

(defface twit-fail-whale-face
    '((((class color))
       (:family "<span class="quote">mono</span>"
        :weight bold
        :height 4.0
        :box (:line-width 10 :color "<span class="quote">SteelBlue3</span>" :style 0)
        :background "<span class="quote">SteelBlue3</span>" :foreground "<span class="quote">SteelBlue4</span>"))
      (t (:inverse)))
  "<span class="quote">(_x___}&lt;</span>"
  :group 'twit)

<span class="linecomment">;;* var keymap</span>
(defvar twit-status-mode-map (make-sparse-keymap)
  "<span class="quote">Keymap for status messages and direct messages.</span>")

(defvar twit-followers-mode-map (make-sparse-keymap)
  "<span class="quote">Keymap for showing followers and friends.</span>")

<span class="linecomment">;;* var keymap</span>
(defvar twit-key-list
  '(("<span class="quote">s</span>" . twit-show-recent-tweets)
	("<span class="quote">f</span>" . twit-show-followers)
	("<span class="quote">@</span>" . twit-show-at-tweets)

    ("<span class="quote">w</span>" . twit-post)
    ("<span class="quote">t</span>" . twit-post-to)
    ("<span class="quote">r</span>" . twit-post-reply)
    ("<span class="quote">u</span>" . twit-post-url)
    ("<span class="quote">R</span>" . twit-post-loud-reply)
    ("<span class="quote">c</span>" . twit-post-retweet)
    ("<span class="quote">d</span>" . twit-direct)

	("<span class="quote">n</span>" . twit-next-tweet)
	("<span class="quote">p</span>" . twit-previous-tweet)

	("<span class="quote">*</span>" . twit-add-favorite)
	("<span class="quote">-</span>" . twit-remove-favorite)

	("<span class="quote">a</span>" . twit-add-friend)
	("<span class="quote">k</span>" . twit-remove-friend)

	("<span class="quote">S</span>" . twit-search)

	("<span class="quote">v</span>" . twit-visit-link)
	("<span class="quote">o</span>" . twit-open-link)
	("<span class="quote">A</span>" . twit-analyse-user)
	("<span class="quote">G</span>" . twit-analyse-graph-user)
    ("<span class="quote">i</span>" . twit-install-elisp)
    
    ("<span class="quote">q</span>" . bury-buffer)
    
    ("<span class="quote">h</span>" . twit-mode-help)
    ("<span class="quote">?</span>" . twit-mode-help)))

(define-key twit-status-mode-map "<span class="quote">g</span>" 'twit-show-recent-tweets)
(define-key twit-followers-mode-map "<span class="quote">g</span>" 'twit-show-followers)

<span class="linecomment">;;* var keymap</span>
(dolist (info twit-key-list)
  (define-key twit-status-mode-map (car info) (cdr info))
  (define-key twit-followers-mode-map (car info) (cdr info)))

<span class="linecomment">;;* interactive keymap</span>
(defun twit-mode-help ()
  "<span class="quote">Show help messages during command `twit-mode'.</span>"
  (interactive)
  (message "<span class="quote">Help: %s</span>" (append twit-key-list '(("<span class="quote">r</span>" . "<span class="quote">Reload Current Page</span>")))))

<span class="linecomment">;; *var</span>
(defvar twit-timer
  nil
  "<span class="quote">Timer object that handles polling the followers.</span>")

(defvar twit-rate-limit-timer
  nil
  "<span class="quote">Timer object to poll the rate-limiting.</span>")

(defvar twit-first-time-through nil)


<span class="linecomment">;;* const url</span>
(defconst twit-base-search-url "<span class="quote">http://search.twitter.com</span>")
(defconst twit-base-url (concat twit-protocol "<span class="quote">://twitter.com</span>"))
(defconst twit-secure-base-url (concat twit-protocol "<span class="quote">://twitter.com</span>"))

(defconst twit-update-url
  (concat twit-base-url "<span class="quote">/statuses/update.xml</span>"))
(defconst twit-puplic-timeline-file
  (concat twit-base-url "<span class="quote">/statuses/public_timeline.xml?page=%s</span>"))
(defconst twit-friend-timeline-file
  (concat twit-base-url "<span class="quote">/statuses/friends_timeline.xml?page=%s</span>"))
(defconst twit-followers-list-url
  (concat twit-base-url "<span class="quote">/statuses/followers.xml?page=%s</span>"))
(defconst twit-friend-list-url
  (concat twit-base-url "<span class="quote">/statuses/friends.xml</span>"))
(defconst twit-mentions-url
  (concat twit-base-url "<span class="quote">/statuses/mentions.xml?page=%s</span>"))

(defconst twit-rate-limit-file
  (concat twit-base-url "<span class="quote">/account/rate_limit_status.xml</span>"))

(defconst twit-direct-msg-send-url
  (concat twit-base-url "<span class="quote">/direct_messages/new.xml</span>"))
(defconst twit-direct-msg-get-url
  (concat twit-base-url "<span class="quote">/direct_messages.xml?page=%s</span>"))

(defconst twit-add-friend-url
  (concat twit-base-url "<span class="quote">/friendships/create/%s.xml</span>"))
(defconst twit-remove-friend-url
  (concat twit-base-url "<span class="quote">/friendships/destroy/%s.xml</span>"))

(defconst twit-add-favorite-url
  (concat twit-base-url "<span class="quote">/favorites/create/%s.xml</span>"))
(defconst twit-remove-favorite-url
  (concat twit-base-url "<span class="quote">/favorites/destroy/%s.xml</span>"))

(defconst twit-search-url
  (concat twit-base-search-url "<span class="quote">/search.atom?q=%s</span>"))

<span class="linecomment">;;* graph const url</span>
(defconst twit-graph-friends-url
  (concat twit-base-url "<span class="quote">/friends/ids.xml?user_id=%s</span>"))

(defconst twit-graph-followers-url
  (concat twit-base-url "<span class="quote">/followers/ids.xml?user_id=%s</span>"))

<span class="linecomment">;;*const url analyse</span>
(defconst twit-analyse-user-url "<span class="quote">http://twanalyst.com/%s</span>"
  "<span class="quote">Url for twanalyst.</span>")

(defconst twit-analyse-graph-user-url "<span class="quote">http://twanalyst.com/%s/track</span>"
  "<span class="quote">Url for twanlyst graph.</span>")

(defconst twit-analyse-suggest-user-url "<span class="quote">http://twanalyst.com/%s/suggest</span>"
  "<span class="quote">Url for twanlyst suggest</span>")

<span class="linecomment">;;* const</span>
(defconst twit-max-tweet 140 "<span class="quote">Maximum length of a tweet.</span>")

<span class="linecomment">;;* const msg language</span>
(defconst twit-post-success-msg
  "<span class="quote">Post sent!</span>")
(defconst twit-direct-success-msg
  "<span class="quote">Direct Message sent!</span>")

(defconst twit-post-failed-msg "<span class="quote">Your posting has failed.</span>")

(defconst twit-too-long-msg
  (format "<span class="quote">Post not sent because length exceeds %d characters</span>"
          twit-max-tweet))

(defconst twit-add-friend-success-msg
  "<span class="quote">Friend successfully added!</span>")
(defconst twit-add-friend-fail-msg
  "<span class="quote">Friend addition failed.</span>")

(defconst twit-remove-friend-success-msg
  "<span class="quote">Friend successfully removed!</span>")
(defconst twit-remove-friend-fail-msg
  "<span class="quote">Friend removal failed.</span>")

(defconst twit-add-favorite-success-msg
  "<span class="quote">Tweet set to favorite</span>")
(defconst twit-add-favorite-fail-msg
  "<span class="quote">Setting tweet to favorite failed.</span>")

(defconst twit-remove-favorite-success-msg
  "<span class="quote">Tweet removed as favorite,</span>")
(defconst twit-remove-favorite-fail-msg
  "<span class="quote">Tweet favorite removal failed.</span>")


<span class="linecomment">;;* const</span>
(defconst twit-standard-rate-limit 100
  "<span class="quote">The standard twitter rate limit.</span>")

(defconst twit-rate-limit-offset 5
  "<span class="quote">Number of seconds to add to a throttled rate limit for insurance.</span>")

(defconst twit-rate-limit-interval (* 2 60 60)
  "<span class="quote">Every 2 Hours check for rate limiting.</span>")

<span class="linecomment">;;* const regex</span>
(defconst twit-filter-at-tweets-retweet-regex "<span class="quote">\\bRT[ :]*@</span>"
  "<span class="quote">Retweets are tweets that do contain at messages that might be actually interesting.</span>")

(defconst twit-at-regex "<span class="quote">@\\([a-zA-Z0-9_]+\\)</span>"
  "<span class="quote">Regular expression to parse @messages.</span>")

(defconst twit-hash-at-regex "<span class="quote">\\([#@][a-zA-Z0-9_.]+\\)</span>"
  "<span class="quote">Regular expression form for matching hashtags (#) and directions (@).</span>")

(defconst twit-url-regex "<span class="quote">\\(http://[a-zA-Z0-9.]+\.[a-zA-Z0-9%#;~/.=+&$,?@-]+\\)</span>"
   "<span class="quote">Regular expression for urls.</span>")

(defconst twit-emacs-lisp-regex "<span class="quote">\\([a-zA-Z0-9-.]+\\)\\.el</span>"
  "<span class="quote">Regex for Emacs Lisp files.</span>")

<span class="linecomment">;; regex testing:</span>
<span class="linecomment">;; @_miaux #twit.el #foo @foo @foo-bar</span>


<span class="linecomment">;;* const</span>
(defconst twit-request-headers
  `(("<span class="quote">X-Twitter-Client</span>" . "<span class="quote">twit.el</span>")
    ("<span class="quote">X-Twitter-Client-Version</span>" . ,twit-version-number)
    ("<span class="quote">X-Twitter-Client-URL</span>" . "<span class="quote">http://www.emacswiki.org/cgi-bin/emacs/twit.el</span>"))
  "<span class="quote">Headers sent by every twit.el request.</span>")

<span class="linecomment">;;* const</span>
(defconst twit-time-string "<span class="quote">%a %b %e %T %Y</span>"
  "<span class="quote">The format of twitter time.</span>")

<span class="linecomment">;;* macro</span>
(defmacro with-twit-buffer (buffer-name &rest forms)
  "<span class="quote">Create a twitter buffer with name BUFFER-NAME, and execute FORMS.

The value returned is the current buffer.</span>"
  `(with-current-buffer (get-buffer-create ,buffer-name)
     (buffer-disable-undo)
     (toggle-read-only 0)
     (delete-region (point-min) (point-max))
     ,@forms
     (set-buffer-modified-p nil)
     (toggle-read-only 1)
     (use-local-map twit-status-mode-map)
     (goto-char (point-min))
     (current-buffer)))

<span class="linecomment">;;* macro auth</span>
(defmacro with-twit-auth (user pass &rest forms)
  "<span class="quote">Set twiter authorization of USER and PASS, and execute FORMS.

This forms the very basic support for multi-user twittering.
See the very end of this file for an example.</span>"
  `(let ((,url-basic-auth-storage
          (list (list "<span class="quote">twitter.com:80</span>"
                      (cons "<span class="quote">Twitter API</span>"
                            (base64-encode-string
                             (format "<span class="quote">%s:%s</span>" ,user ,pass))))
                (list "<span class="quote">twitter.com:443</span>"
                      (cons "<span class="quote">Twitter API</span>"
                            (base64-encode-string
                             (format "<span class="quote">%s:%s</span>" ,user ,pass))))))
         (twit-user ,user)
         (twit-pass ,pass)
         (twit-get-friends-cache nil))
     ,@forms))

<span class="linecomment">;;* macro auth multi-account</span>
(defmacro with-twit-account (account &rest forms)
  "<span class="quote">Set twitter account to ACCOUNT Execute FORMS.

The account is identified by ACCOUNT in the variable
`twit-multi-accounts'.</span>"
  `(let ((multi-account (assoc-string account twit-multi-accounts)))
     (with-twit-auth (car multi-account) (cdr multi-account) ,@forms)))

<span class="linecomment">;;* helper todochiku</span>
(defun twit-alert (msg &optional title)
  "<span class="quote">Send some kind of alert MSG to the user, with the title TITLE.

If todochiku is available, use that.  Instead, just message the user.</span>"
  (when (null title) (setq title "<span class="quote">twit.el</span>"))
  (when (featurep 'todochiku)
    (todochiku-message title msg (todochiku-icon 'social)))
  (message "<span class="quote">%s: %s</span>" title msg))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; General purpose library to wrap twitter.com's api</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;;* xmlparse</span>
(defun twit-parse-xml (url method)
  "<span class="quote">Retrieve file at URL with METHOD and parse with `xml-parse-fragment'.
Emacs' url package will prompt for authentication info if required.

Note that this parses the entire HTTP request as an xml fragment
and not the response.</span>"
  (let ((result nil)
        (url-request-method method)
        (url-show-status nil))
    (save-window-excursion
      (set-buffer (url-retrieve-synchronously url))
	  (let ((first-header-line (buffer-substring (goto-char (point-min))
												 (search-forward "<span class="quote">\n</span>"))))	
		(when (twit-header-error-p (twit-parse-header first-header-line))
			  (twit-display-error (list first-header-line))
			  (error "<span class="quote">HTTP error on twit-parse-xml: %s</span>" (twit-get-header-error (twit-parse-header first-header-line)))))
	  (goto-char (point-min))
      (setq result (xml-parse-fragment))
      (kill-buffer (current-buffer)))
    result))


<span class="linecomment">;;* xmlparse header</span>
(defun twit-parse-header (header-frag)
  "<span class="quote">Parse the HEADER-FRAG, and come back with some status codes.

This returns the HTTP status (for now) as a list of three elements.
 (HTTP/Version code Description)

The header fragment should be the first text node from the parsed
xml.

The header fragment is actually quite important, it will tell us
if we have run into some kind of condition where we cannot
display tweets or other information.  This will ease the fresh-install
pain where uesrs can't see why they have blank timelines.</span>"
  "<span class="quote">Header format:  (or part we care about)</span>" "<span class="quote">HTTP/1.0 &lt;status&gt; &lt;status text&gt;\n</span>"

  
  (string-match "<span class="quote">HTTP/\\([0-9]+\\.[0-9]+\\) \\([1-5][0-9][0-9]\\) \\(.*\\)$</span>"
                header-frag)
  (if (match-string 3 header-frag)
      (list (match-string 1 header-frag)
            (match-string 2 header-frag)
            (match-string 3 header-frag))
      (error "<span class="quote">Malformed Header sent to twit-parse-header.   Header: %s</span>"
             header-frag)))

<span class="linecomment">;;* header helper</span>
(defun twit-header-error-p (header)
   "<span class="quote">Let us know if the HEADER is an error or not.  Null headers are errors.</span>"
   (and (not (null header))
		(&lt;= 400 (string-to-number (cadr header)))))

<span class="linecomment">;;* header display</span>
(defun twit-get-header-error (header)
   "<span class="quote">Given a parsed HEADER from `twit-parse-header', return human readable error.</span>"
   (if (null header)
       "<span class="quote">Null header, probably an error with twit.el.</span>"
       (case (string-to-number (cadr header))
         ((200) "<span class="quote">Everything is A OK!</span>")
         ((304) "<span class="quote">Nothing Changed.</span>")
         ((400) "<span class="quote">Bad Request. (probably rate limited)</span>")
         ((401) "<span class="quote">Not Authorized.  You need to log in, or your login/password is incorrect.\nIf this is the first time you have tried to use a twitter command\nenter your password and try again.</span>")
         ((403) "<span class="quote">You are FORBIDDEN</span>")
         ((404) "<span class="quote">Not Found.  404'ed!</span>")
         ((406) "<span class="quote">Something is bropken with twit.el's search!</span>")
         ((500) "<span class="quote">Something is horribly broken with twit.el, or even Twitter!</span>")
         ((502) "<span class="quote">Twitter is down. FAIL WHALE!</span>")
         ((503) "<span class="quote">Rate limited on search.</span>"))))

<span class="linecomment">;;* header test</span>
(when nil
  (twit-parse-header "<span class="quote">HTTP/1.1 401 Unauthorized\nThis is a header\n</span>")
  (twit-header-error-p (twit-parse-header "<span class="quote">HTTP/1.1 401 Unauthorized\nThis is a header\n</span>"))
  (twit-get-header-error (twit-parse-header "<span class="quote">HTTP/1.1 401 Unauthorized\nThis is a header\n</span>"))
  )

<span class="linecomment">;;* header display</span>
(defun twit-display-error (xml)
  "<span class="quote">Given an XML fragment that contain an error, display it to the user.</span>"
  (let ((header (twit-parse-header (car xml))))
	(when (twit-header-error-p header)
	   (twit-insert-with-overlay-attributes
		 "<span class="quote">(_x___}&lt;</span>"
		 '((face "<span class="quote">twit-fail-whale-face</span>")))
	   (twit-insert-with-overlay-attributes
		  (concat "<span class="quote">         HTTP ERROR!  </span>"
				  "<span class="quote">(</span>" (cadr header) "<span class="quote">) </span>"
				  (caddr header) "<span class="quote">\n\n</span>"
				  "<span class="quote">  </span>"(twit-get-header-error header) "<span class="quote">\n\n</span>"
				  "<span class="quote">  The response from twitter was: </span>"
				  (format "<span class="quote">%s</span>" (xml-first-childs-value (cadr xml) 'error))
				  "<span class="quote">\n\n</span>")
		  '((face "<span class="quote">twit-error-face</span>"))))))

<span class="linecomment">;;* xmlparse var</span>
(defvar twit-async-buffer 'nil
  "<span class="quote">Buffer that stores the temporary XML result for twit.el.</span>")

<span class="linecomment">;;* xmlparse async</span>
(defun twit-parse-xml-async (url callback)
  "<span class="quote">Retrieve the resource at URL, and when retrieved call CALLBACK.

This is the asyncronous version of `twit-parse-xml'.  Once that function is
refactored, and its named changed, so should this one.</span>"
  (let ((url-request-method "<span class="quote">GET</span>")
        (url-show-status nil))
    (setq twit-async-buffer
          (url-retrieve url 'twit-parse-xml-async-retrieve
                        (list url callback)))))

<span class="linecomment">;;* rate-limit var</span>
(defvar twit-rate-limit-halt-flag 'nil
  "<span class="quote">Non-nil means we're in the middle of a rate limit op.

This is a flag to  make sure we don't try and get the rate limit, if
there is an error with retrieving the rate limiter.  it is meant to
be used dynamically (i.e. inside of a (let (())) statement.  )</span>")

<span class="linecomment">;;* xmlparse async</span>
(defun twit-parse-xml-async-retrieve (status url callback)
  "<span class="quote">Called by `twit-parse-xml-async'.

STATUS is the status from HTTP, URL and CALLBACK were the args from `twit-parse-xml-async'.</span>"
  (if (null status)   <span class="linecomment">; no news is good news.</span>
      (let ((result nil))
        (if (bufferp twit-async-buffer)
            (save-excursion
              (set-buffer twit-async-buffer)
              (goto-char (point-min))
              (setq result (xml-parse-fragment))
              (kill-buffer (current-buffer))))
        (funcall callback status url result))
      (progn
        (twit-alert (format "<span class="quote">Cannot retrieve twit URL.  Status is: %S</span>" status))
        (when (equal status '(:error (error http 400)))
          (if (null twit-rate-limit-halt-flag)
              (twit-get-and-set-async-rate-limit)
              (error "<span class="quote">URL retrieval error when trying to get rate limiter.  twit-rate-limit-halt-flag is true!</span>"))))))

<span class="linecomment">;;* post handler</span>
(defun twit-handle-post (err success-msg error-msg)
  "<span class="quote">General method to hande a twit posting.
This will give us a Guarantee that our posting atually did work.
Argument ERR Whether or not there was an error.  Set by `url-retrieve'.
Argument SUCCESS-MSG Message when action was successful.
Argument ERROR-MSG Message when action failed.</span>"
  (cond
    ((null err) (twit-alert success-msg))
    (t (twit-alert error-msg)
       (message "<span class="quote">Post HTTP error was: %s\n(_x____}&lt;\n</span>" err)
       (if twit-debug (message "<span class="quote">%s</span>" (buffer-string)))))
  (kill-buffer (current-buffer)))

<span class="linecomment">;;* post status</span>
(defun twit-post-status (url post &optional reply-id)
  "<span class="quote">Post some kind of tweet status message at URL with the content POST.

REPLY-ID, if set, sets the in_reply_to_status_id parameter.</span>"
  (let* ((url-request-method "<span class="quote">POST</span>")
	     (url-request-data (concat "<span class="quote">source=twit.el&status=</span>" (url-hexify-string post)))
		 (url-request-data (concat url-request-data
								   (if reply-id
									   (format "<span class="quote">&in_reply_to_status_id=%s</span>" reply-id)
									   "<span class="quote"></span>")))
         (url-request-extra-headers twit-request-headers)
         (url-show-status nil))
    (if twit-debug (twit-alert url-request-data))
    (url-retrieve url 'twit-handle-post
                  (list twit-post-success-msg twit-post-failed-msg))))

<span class="linecomment">;;* post direct</span>
(defun twit-direct-message (user msg)
  "<span class="quote">Post a direct message to USER with MSG.</span>"
  (let ((url-request-method "<span class="quote">POST</span>")
        (url-request-data (concat "<span class="quote">source=twit.el</span>"
                                  "<span class="quote">&user=</span>" (url-hexify-string user)
                                  "<span class="quote">&text=</span>" (url-hexify-string msg)))
        (url-request-headers twit-request-headers)
        (url-show-status nil))
    (if twit-debug (twit-alert url-request-data))
    (url-retrieve twit-direct-msg-send-url 'twit-handle-post
                  (list twit-direct-success-msg twit-post-failed-msg))))

<span class="linecomment">;; post helper</span>
(defun twit-post-function (url data success-msg fail-msg)
  "<span class="quote">Send a generalized post request to URL with DATA, and give user feedback.

User feedback is achieved with SUCCESS-MSG and FAIL-MSG.  usually these are
constants.</span>"
  (let ((url-request-method "<span class="quote">POST</span>")
        (url-request-data
         (concat data (if (string-equal "<span class="quote"></span>" data)
                          "<span class="quote">?</span>" "<span class="quote">&</span>")
                 "<span class="quote">source=twit.el</span>"))
        (url-request-headers twit-request-headers)
        (url-show-status nil))
    (if twit-debug (twit-alert (format "<span class="quote">Posting to %s with %s</span>" url data)))
    (url-retrieve url 'twit-handle-post (list success-msg fail-msg))))

<span class="linecomment">;;* rate</span>
(defun twit-parse-rate-limit (xml)
  "<span class="quote">Parse the rate limit, and return the hourly limit.
XML should be the twitter ratelimit sxml and should not have any HTTP header
information in its car.</span>"
  (let ((limit (assoc 'hourly-limit xml)))
    (if twit-debug (message "<span class="quote">Parsed limit %s from xml %s</span>" limit xml))
    (if limit
        (string-to-number (caddr limit)))))

<span class="linecomment">;;* rate interactive</span>
(defun twit-get-rate-limit ()
  "<span class="quote">Return the rate limit as a number from the xml.</span>"
  (interactive)
  (let ((limit-xml (twit-parse-xml twit-rate-limit-file "<span class="quote">GET</span>")))
    (twit-parse-rate-limit (cadr limit-xml))))

<span class="linecomment">;; rate async</span>
(defun twit-get-and-set-async-rate-limit ()
  "<span class="quote">Check rate limiting asyncronously, and automagickally set it.</span>"
  (interactive)
  (twit-parse-xml-async twit-rate-limit-file 'twit-get-and-set-async-rate-limit-callback))

<span class="linecomment">;; rate async</span>
(defun twit-get-and-set-async-rate-limit-callback (status url result)
  "<span class="quote">Callback for `twit-get-and-set-async-rate-limit'.

STATUS, URL and RESULT are all set by `twit-get-and-set-async-rate-limit'.</span>"
  (if (null status)
      (if twit-debug (message "<span class="quote">Rate Limit XML is %S</span>" result))
      (twit-verify-and-set-rate-limit (twit-parse-rate-limit (cadr result)))
      (twit-alert (format "<span class="quote">Cannot retrieve rate limit URL %S! Status: %S</span>"
                          url status))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; Helpers for the interactive functions</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;* read post helper</span>
(defun twit--query-for-post-update (&optional beg end length invert)
  (let* ((field-begin (field-beginning (point-max)))
         (field-end (field-end (point-max)))
         (field-length (- field-end field-begin))
         overlay)
    
    <span class="linecomment">;; remove old overlays</span>
    (mapcar #'(lambda (overlay)
                (when (overlay-get overlay 'twit--query-for-post)
                  (delete-overlay overlay)))
            (overlays-in (point-min) (point-max)))
    
    <span class="linecomment">;; if necessary, add a new one</span>
    (when (&gt; field-length twit-max-tweet)
      (setq overlay (make-overlay (+ field-begin twit-max-tweet) field-end))
      (overlay-put overlay 'face 'twit-too-long-face)
      (overlay-put overlay 'twit--query-for-post t))
    
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "<span class="quote">(\\(  0\\)/[0-9]+ characters)</span>" nil t)
        (setq overlay (make-overlay (match-beginning 1)
                                    (match-end 1)))
        
        (overlay-put overlay 'twit--query-for-post t)
        (overlay-put overlay 'display (format "<span class="quote">%3d</span>" field-length))
        
        (let ((face
               `(:foreground
                 ,(if (&lt;= field-length twit-max-tweet) "<span class="quote">green</span>" "<span class="quote">red</span>"))))
          
          (when invert
            (setq face (append '(:inverse-video t) face)))
          
          (overlay-put overlay 'face face))))))

<span class="linecomment">;;* read post helper</span>
(defun twit--query-for-post-exit-minibuffer ()
  (interactive)
  (let* ((field-begin (field-beginning (point-max)))
         (field-end (field-end (point-max)))
         (field-length (- field-end field-begin)))
    
    (if (&lt;= field-length twit-max-tweet)
        (exit-minibuffer)
        (beep)
        (twit--query-for-post-update nil nil nil t)
        (sit-for 1)
        (twit--query-for-post-update nil nil nil))))

<span class="linecomment">;;* read post helper</span>
(defun twit--query-for-post-minibuffer-setup ()
  "<span class="quote">Prepare the minibuffer for a twit entry.
Limit main field length to `twit-max-tweet' characters</span>"
   
  (twit--query-for-post-update)
  (local-set-key [remap exit-minibuffer]
  #'twit--query-for-post-exit-minibuffer)
  (add-hook 'after-change-functions
  #'twit--query-for-post-update t t))

<span class="linecomment">;;* read post</span>
(defun twit-query-for-post (prompt-heading initial-input)
  "<span class="quote">Query for a Twitter.com post text in the minibuffer.

PROMPT-HEADING is the prompt, and has \" (140 char max): \" appended to it.
INITIAL-INPUT is what it is.</span>"
  (let ((minibuffer-setup-hook
         (cons #'twit--query-for-post-minibuffer-setup minibuffer-setup-hook)))
    (read-string (concat prompt-heading
                         (format "<span class="quote"> (  0/%3d characters): </span>"
                                 twit-max-tweet))
                 initial-input)))

<span class="linecomment">;;* post query-buffer mode</span>
(define-derived-mode twit-post-mode text-mode
  "<span class="quote">Major mode for posting tweets.</span>"
  (define-key 'twit-post-mode-map [(Control c) (Control c)] 'twit-post-))

<span class="linecomment">;;* post query-buffer</span>
(defun twit-buffer-up-for-post (prompt-heading initial-input)
  "<span class="quote">Query for a post inside of a regular buffer instead of the minibuffer.</span>"
  (pop-to-buffer (get-buffer-create "<span class="quote">*twit-post*</span>"))
  (twit-post-mode)
  (insert twit-popup-buffer-message))

<span class="linecomment">;;* post query-buffer </span>
(defun twit-interactive-post ()
  "<span class="quote">The second half of posting, Performs a message length check, and posts.

This is the second half of the function `twit-buffer-up-for-post'

Any of the argument we need (url, post, parent-id) are handled via
text properties in the current buffer.</span>"
  (interactive)
  (let ((post (buffer-string))
		(url (twit-get-text-property 'twt-url-destination))
		(parent-id (twit-get-text-property 'twit-id))))
  (if (&gt; (length post) twit-max-tweet)
	  (error twit-too-long-msg)
	  (twit-post-status twit-update-url post)))

<span class="linecomment">;;* last-tweet</span>
(defvar twit-last-tweet '()
  "<span class="quote">The last tweet that was posted.
This is a bit of an ugly hack to store the last tweet that was shown through
`twit-write-recent-tweets'.

It is in the format of (timestamp user-id message)</span>")

(setq twit-last-tweet '())

<span class="linecomment">;;* xmlparse</span>
(when (not (functionp 'xml-first-child))
  (defun xml-first-child (node attr)
    "<span class="quote">Return the first child of some sxml</span>"
    (car (xml-get-children node attr))))

<span class="linecomment">;;* xmlparse</span>
(when (not (functionp 'xml-first-childs-value))
  (defun xml-first-childs-value (node addr)
    "<span class="quote">Return the value of the first child of some sxml. </span>"
    (car (xml-node-children (xml-first-child node addr)))))

<span class="linecomment">;;; xml parsing is a little hacky and needs work.</span>
<span class="linecomment">;;* tweets write last-tweet</span>
(defun twit-write-recent-tweets (xml-data)
  "<span class="quote">Function that writes the recent tweets to the buffer.

XML-DATA is the sxml (with http header).</span>"
  (if (twit-header-error-p (twit-parse-header (car xml-data)))
	  (twit-display-error xml-data)
	  (let* ((first-tweet (xml-first-child (cadr xml-data) 'status))
			 (most-recent-tweet (list (xml-first-childs-value first-tweet 'created_at)
									  (or (xml-first-childs-value (xml-first-child first-tweet 'user) 'screen_name) "<span class="quote">??</span>")
									  (xml-substitute-special (xml-first-childs-value first-tweet 'text))))
			 (times-through 1))
		(dolist (status-node (xml-get-children (cadr xml-data) 'status))
				(let ((message (xml-substitute-special (xml-first-childs-value status-node 'text)))
					  (author (xml-first-childs-value (or (xml-first-child status-node 'user)
														  (xml-first-child status-node 'sender))
													  'name)))
				  (when (not (twit--filter-tweet message author))
						(twit-write-tweet status-node nil times-through)
						(setq times-through (+ 1 times-through)))))
	
        (when (not (equal most-recent-tweet twit-last-tweet))
          (setq twit-last-tweet most-recent-tweet)
          (run-hooks 'twit-new-tweet-hook))))
  
  <span class="linecomment">;; go back to top so we see the latest messages</span>
  (goto-address)
  (goto-char (point-min))
  
  <span class="linecomment">;; this needs more TLC</span>
  (if twit-debug-mem (message (garbage-collect))))

<span class="linecomment">;;*var filter </span>
(defvar twit-last-author '(nil .0)
  "<span class="quote">Author information about the last tweet.

This is a cons, in the format of (author-name . times-tweeted).
This is used by `twit-filter-diarrhea'.</span>")

<span class="linecomment">;;* tweet write helper filter</span>
<span class="linecomment">;; This is a prime refactoring candidate.  It's logic is abysmally complex.</span>
<span class="linecomment">;; Sorry. (JA)</span>
(defun twit--filter-tweet (message author)
  "<span class="quote">Return t if the user wants MESSAGE filtered, nil if not.</span>"
  (when (&gt; twit-filter-diarrhea 0)
		(if (string-equal author (car twit-last-author))
			(setcdr twit-last-author (+ 1 (cdr twit-last-author)))
			(setq twit-last-author (cons author 1))))
  (not (and  (or (string-equal "<span class="quote"></span>" twit-filter-tweets-regex)
				 (null twit-filter-tweets-regex)
				 (not (string-match twit-filter-tweets-regex message)))
			 (or (not twit-filter-at-tweets)
				 (not (string-match "<span class="quote">@</span>" message))
				 (string-match twit-filter-at-tweets-retweet-regex message)
				 (and twit-filter-at-tweets
					  (twit-at-message-was-from-friend message)))
			 (or (= 0 twit-filter-diarrhea)
				 (&gt;= twit-filter-diarrhea
					 (cdr twit-last-author))))))

<span class="linecomment">;;* tweet direct write image</span>
(defun twit-write-tweet (tweet &optional filter-tweets times-through)
  "<span class="quote">Insert a tweet into the current buffer.
TWEET should be an xml parsed node, which could be a message or a status node.
FILTER-TWEETS is an optional boolean to disregard filtering.
TIMES-THROUGH is an integer representing the number of times a tweet has been
  displayed, for zebra-tabling.</span>"
  (let* ((tweet-id (xml-first-childs-value tweet 'id))
		 (user-info (or (xml-first-child tweet 'user) (xml-first-child tweet 'sender)))
		 (user-id (or (xml-first-childs-value user-info 'screen_name) "<span class="quote">??</span>"))
		 (user-name (xml-first-childs-value user-info 'name))
		 (location (xml-first-childs-value user-info 'location))
		 (user-img (if twit-show-user-images
					   (twit-get-user-image (xml-first-childs-value user-info 'profile_image_url) user-id)
					   nil))
		 
		 (timestamp (format-time-string twit-time-string (date-to-time (xml-first-childs-value tweet 'created_at))))
		 (message (xml-substitute-special (xml-first-childs-value tweet 'text)))
		 (src-info (xml-first-childs-value tweet 'source))
         (favorite (xml-first-childs-value tweet 'favorited))

		 (overlay-start 0)
		 (overlay-end 0))
	
	(when (and src-info (string-match (concat "<span class="quote">&lt;a h</span>" "<span class="quote">ref=\"\\(.*\\)\"&gt;\\(.*\\)&lt;</span>" "<span class="quote">/a&gt;</span>") <span class="linecomment">; the string-match is a bit weird, as emacswiki.org won't accept pages with the href in it per se</span>
									  src-info))
		  <span class="linecomment">;; remove the HTML link info; leave just the name (for now)</span>
		  (setq src-info (match-string 2 src-info)))

	(setq overlay-start (point))

	(when (and twit-show-user-images user-img)
		  (insert "<span class="quote"> </span>")
		  (insert-image user-img)
		  (insert "<span class="quote"> </span>"))

	(insert "<span class="quote"> </span>")
	(if (string-equal "<span class="quote">true</span>" favorite)
		(twit-insert-with-overlay-attributes "<span class="quote">*</span>" '((face . "<span class="quote">twit-favorite-face</span>")))
		(insert "<span class="quote">  </span>"))
	(insert "<span class="quote"> </span>")
		  
	(twit-insert-with-overlay-attributes (concat user-id
												 (if user-name
													 (concat "<span class="quote"> (</span>" user-name "<span class="quote">)</span>")
													 "<span class="quote"></span>")
												 "<span class="quote"> </span>")
										 `((face . "<span class="quote">twit-author-face</span>")))
	(insert "<span class="quote">: </span>")
	(twit-insert-with-overlay-attributes (twit-keymap-and-fontify-message message)
										 '((face . "<span class="quote">twit-message-face</span>"))
										 "<span class="quote"> </span>")

	(insert "<span class="quote">\n</span>")
	(when (or timestamp location src-info)
		  (twit-insert-with-overlay-attributes
		   (concat "<span class="quote">                          </span>"
				   (when timestamp timestamp)
				   (when location (concat "<span class="quote"> @ </span>" location))
				   (when src-info (concat "<span class="quote"> (</span>" src-info "<span class="quote">)</span>"))
				   "<span class="quote">\n</span>")
		   '((face . "<span class="quote">twit-info-face</span>")) "<span class="quote"></span>" 'right))
	(setq overlay-end (point))
	(let ((o (make-overlay overlay-start overlay-end)))
	  (overlay-put o
				   'face (if (= 0 (% times-through 2))
							 "<span class="quote">twit-zebra-1-face</span>"
							 "<span class="quote">twit-zebra-2-face</span>"))
	  (overlay-put o 'twit-id tweet-id)
	  (overlay-put o 'twit-user user-id))))

<span class="linecomment">;;* write helper</span>
(defun twit-write-title (title &rest args)
  "<span class="quote">Helper function to write out a title bar for a twit buffer.

TITLE is the title to display, and it is formatted with ARGS.</span>"
  (twit-insert-with-overlay-attributes
   (concat (propertize "<span class="quote">(^)o&lt;</span>" 'face 'twit-logo-face)
           "<span class="quote"> </span>"
           (apply 'format title args))
   '((face . "<span class="quote">twit-title-face</span>"))))

<span class="linecomment">;;* write helper</span>
(defun twit-keymap-and-fontify-message (message)
  "<span class="quote">Scan through MESSAGE, and fontify and keymap all #foo and @foo.</span>"
  (let ((original-txt (substring message 0))) <span class="linecomment">;; Just to be sure we're using a copy</span>
    (when (string-match twit-hash-at-regex message) <span class="linecomment">;; usernames</span>
      (setq message (replace-regexp-in-string
                     twit-hash-at-regex
                     (lambda (str)
                       (let ((type (substring str 0 1))
                             (thing (substring str 1)))
                         (setq str (propertize str
                                               'face 'twit-hash-at-face
                                               'pointer 'hand))
                         (when (string-equal "<span class="quote">@</span>" type)
                           (setq str (propertize str 'twit-user thing)))
                         (propertize str 'twit-search (concat type thing))))
                     message)))
    
    (when (string-match twit-url-regex message) <span class="linecomment">;; URLs</span>
      (setq message (replace-regexp-in-string
                     twit-url-regex
                     (lambda (str)
                       (let ((map (make-sparse-keymap)))
                         (define-key map [enter] 'twit-visit-link)
                         (define-key map [(control) (enter)] 'twit-visit-link)
                         (define-key map [mouse-1] 'twit-visit-link)
                         (define-key map [mouse 2] 'twit-visit-link)
                         (define-key map [mouse-3] 'twit-visit-link)
                         (propertize str
                                     'face 'twit-url-face
                                     'pointer 'hand
                                     'twit-url str
                                     'keymap map)))
                     message)))
    (when (string-match twit-emacs-lisp-regex message) <span class="linecomment">;; .el's</span>
      (setq message (replace-regexp-in-string
                     twit-emacs-lisp-regex
                     (lambda (str)
                       (propertize str
                                   'face 'twit-url-face
                                   'elisp str))
                     message)))

    <span class="linecomment">;; message content (plaintext)</span>
    (propertize message 'twit-message original-txt)))


<span class="linecomment">;;* search write</span>
(defun twit-write-search (atom-data)
  "<span class="quote">This function writes atom-based search data ATOM-DATA.</span>"
  (buffer-disable-undo)
  (erase-buffer)
  (twit-display-error atom-data)
  (twit-write-title "<span class="quote">Search (%s): %s \n</span>"
                    (xml-first-childs-value (cadr atom-data) 'title)
                    (format-time-string "<span class="quote">%c</span>"))
  (dolist (entry-node (xml-get-children (cadr atom-data) 'entry))
		  (let* ((message (twit-keymap-and-fontify-message (xml-first-childs-value entry-node 'title)))
				 (user (xml-first-childs-value (xml-first-child entry-node 'author) 'name))
				 (user-img (xml-get-attribute (xml-first-child entry-node 'link) 'href)))
			(insert (format "<span class="quote">%30s: %s\n</span>" (propertize user 'twit-user user) message)))))


<span class="linecomment">;;* helper write</span>
(defun twit-insert-with-overlay-attributes (text attributes &optional prefix justify)
"<span class="quote">Helper function to insert text into a buffer with an overlay.

Inserts TEXT into buffer, add an overlay and apply ATTRIBUTES to the overlay.</span>"
  (let ((start (point))
        <span class="linecomment">;(fill-column (window-width))     ; Having a hard time making ieure's patch look nice</span>
        <span class="linecomment">;(fill-prefix (or prefix fill-prefix))           ; ditto ieure</span>
        )
    (insert text)
    <span class="linecomment">;(insert (concat fill-prefix  text))                 ; ditto ieure</span>
    (let ((overlay (make-overlay start (point))))
      (dolist (spec attributes)
        (overlay-put overlay (car spec) (cdr spec))))
    <span class="linecomment">;(fill-region start (point) justify)                 ; ditto ieure</span>
    ))

<span class="linecomment">;;* image var</span>
(defvar twit-user-image-list 'nil
  "<span class="quote">List containing all user images.</span>")
(setq twit-user-image-list 'nil)

<span class="linecomment">;;* image</span>
(defun twit-get-user-image (url user-id)
  "<span class="quote">Retrieve the user image from the list, or from the URL.
USER-ID must be provided.</span>"
  (let ((img (assoc url twit-user-image-list)))
    (if (and img (not (bufferp (cdr img))))
        (cdr (assoc url twit-user-image-list))
        (if (file-exists-p (concat twit-user-image-dir
                                   "<span class="quote">/</span>" user-id "<span class="quote">-</span>"
                                   (file-name-nondirectory url)))
            (let ((img (create-image
                        (concat twit-user-image-dir <span class="linecomment">;; What's an ana for? lol</span>
                                "<span class="quote">/</span>" user-id "<span class="quote">-</span>"
                                (file-name-nondirectory url)))))
              (add-to-list 'twit-user-image-list (cons url img))
              img)
            (let* ((url-request-method "<span class="quote">GET</span>")
                   (url-show-status nil)
                   (url-buffer (url-retrieve url 'twit-write-user-image
                                             (list url user-id))))
              (if url-buffer
                  (progn
                    (add-to-list 'twit-user-image-list (cons url url-buffer))
                    (if twit-debug (message "<span class="quote">Added image. List is %s</span>" twit-user-image-list)))
                  (twit-alert (format "<span class="quote">Warning, couldn't load %s </span>" url)))
              nil)))))

<span class="linecomment">;;* image</span>
(defun twit-write-user-image (status url user-id)
  "<span class="quote">Called by `twit-get-user-image', to write the image to disk.

STATUS, URL and USER-ID are all set by `url-retrieve'.</span>"
  (let ((image-file-name
         (concat twit-user-image-dir
                 "<span class="quote">/</span>" user-id "<span class="quote">-</span>"
                 (file-name-nondirectory url))))
    (when (not (file-directory-p twit-user-image-dir))
      (make-directory twit-user-image-dir))
    (setq buffer-file-coding-system 'no-conversion)
    (setq buffer-file-name image-file-name)
    (goto-char (point-min))
    (delete-region (point-min) (search-forward "<span class="quote">\C-j\C-j</span>"))
    (save-buffer)
    (delete (cons url (current-buffer)) twit-user-image-list)
    (kill-buffer (current-buffer))
    (add-to-list 'twit-user-image-list (cons url (create-image image-file-name)))))

<span class="linecomment">;;;</span>
<span class="linecomment">;; Recent tweets timer funciton and callback</span>
<span class="linecomment">;;* recent timer</span>
(defun twit-follow-recent-tweets-timer-function ()
  "<span class="quote">Timer function for recent tweets, called via a timer.</span>"
  (twit-parse-xml-async (format twit-friend-timeline-file 1)
                        'twit-follow-recent-tweets-async-callback))

<span class="linecomment">;;* recent async timer</span>
(defun twit-follow-recent-tweets-async-callback (status url xml)
  "<span class="quote">Callback function, called by `twit-follow-recent-tweets-timer-function'.

STATUS, URL and XML are all set by `twit-follow-recent-tweets-timer-function'.</span>"
  (when (not status)
    (save-window-excursion
      (save-excursion
        (with-twit-buffer "<span class="quote">*Twit-recent*</span>"
          (twit-write-title "<span class="quote">Following Recent tweets: %s\n</span>"
                            (format-time-string "<span class="quote">%c</span>"))
          (twit-write-recent-tweets xml))))))

<span class="linecomment">;;* rate var</span>
(defvar twit-last-rate-limit
  twit-standard-rate-limit
  "<span class="quote">What is the previous rate limit?</span>")

<span class="linecomment">;;* rate</span>
(defun twit-verify-and-set-rate-limit (limit)
  "<span class="quote">Check if limiting is in effect, and if so, set the timer.

LIMIT should be an integer.</span>"
  (let ((limit-reset nil)
        (twit-rate-limit-halt-flag 't))
    (if twit-debug (message  "<span class="quote">Rate limit is %s, doing ratelimit magic.</span>" limit))
    (when (and limit
               (not (= limit 0))
               (not (= twit-last-rate-limit limit)))
      (cond ((&lt; limit twit-standard-rate-limit)
             (progn
               (setq twit-shadow-follow-idle-interval
                     (+ (/ (* 60 60) limit)
                        twit-rate-limit-offset))
               (setq limit-reset 't)
               (twit-alert
                (format "<span class="quote">Twitter is under a rate limit.  Timer set to %s seconds.</span>"
                        twit-shadow-follow-idle-interval))))
            ((= limit twit-standard-rate-limit)
             (progn
               (setq twit-shadow-follow-idle-interval twit-follow-idle-interval)
               (setq limit-reset 't)
               (twit-alert
                (format "<span class="quote">Rate limiting relaxed.  Timer set to normal timeout (%s seconds)</span>"
                        twit-shadow-follow-idle-interval))))
            (t <span class="linecomment">; exceptional case...</span>
             (progn
               (setq twit-shadow-follow-idle-interval twit-follow-idle-interval)
               (setq limit-reset 't)
               (twit-alert
                (format "<span class="quote">The twitter rate has exceeded its expected maximum.  This is weird.</span>"))))))
    (when (and limit-reset (timerp twit-timer))
      (progn
        (if twit-debug (message "<span class="quote">Cancelling and restarting timer.</span>"))
        (cancel-timer 'twit-timer)
        (twit-follow-recent-tweets)))
    (setq twit-last-rate-limit limit)))

<span class="linecomment">;;*friends var</span>
(defvar twit-get-friends-cache nil
  "<span class="quote">A cache of the friends from `twit-get-friends'.  For completing reads.</span>")

<span class="linecomment">;;* friends</span>
(defun twit-get-friends (&optional cached)
  "<span class="quote">Get a list of friends.  If CACHED is non-nil, use the cached version.

This also sets the variable get-friends-cache.</span>"
  (when (or (null twit-get-friends-cache)
            (null cached))
    (setq twit-get-friends-cache
          (save-window-excursion
            (save-excursion
              (loop for screen_name in
                   (loop for user in
                        (xml-get-children
                         (cadr (twit-parse-xml twit-friend-list-url "<span class="quote">GET</span>"))
                         'user)
                      collect (eighth user))
                 collect (third screen_name))))))
  twit-get-friends-cache)

<span class="linecomment">;;* friends at-filter</span>
(defun twit-at-message-was-from-friend (tweet)
  "<span class="quote">Tell us if the text in the TWEET contains an @ that we care about.</span>"
  (let ((found-match nil)
        (twit-at-friends
         (mapcar (lambda (s) (concat "<span class="quote">@</span>" s))
                 (cons twit-user (twit-get-friends t)))))
    (while  (and (not found-match)
                 (string-match twit-at-regex tweet))
      (setq found-match (member (match-string 0 tweet) twit-at-friends))
      (setq tweet (substring tweet (+ 1 (string-match twit-at-regex tweet)))))
    found-match))

(when nil
  (twit-at-message-was-from-friend "<span class="quote">@jonnay is the bomb</span>")
  (twit-at-message-was-from-friend "<span class="quote">@sunnay is the bomb</span>"))


<span class="linecomment">;;* todochiku</span>
<span class="linecomment">;;; funciton to integrade with growl.el or todochiku.el</span>
(defun twit-todochiku ()
  "<span class="quote">Helper function for use by the todochiku package.</span>"
  (todochiku-message "<span class="quote">twit.el</span>"
                     (format "<span class="quote">From %s:\n%s</span>"
                             (cadr twit-last-tweet)
                             (caddr twit-last-tweet))
                     (todochiku-icon 'social)))

<span class="linecomment">;;* property helper</span>
(defun twit-get-text-property (propname)
  "<span class="quote">Return a property named PROPNAME or nil if not available.

This is the reverse of `get-char-property', it checks text properties first.</span>"
  (or (get-text-property (point) propname)
      (get-char-property (point) propname)))


<span class="linecomment">;;* read show</span>
(defun twit-check-page-prefix (page)
   "<span class="quote">For use with an interactive function.  Turn a PAGE prefix arg into an integer.</span>"
   (if (or (null page) (&lt;= page 1)) 1 page))


<span class="linecomment">;;* read account</span>
(defun twit-read-account ()
  "<span class="quote">Does a completing read, and return an account.</span>"
   (completing-read "<span class="quote">Account: </span>"
                    (mapcar 'car twit-multi-accounts)
                    nil
                    t))

<span class="linecomment">;;* read friends</span>
(defun twit-read-friend (prompt &optional req)
  "<span class="quote">Does a completing read to find a friend.

PROMPT is the prompt to the user, and should not contain a \": \" at the end.
If there us a twit-user property under the point, that will be added
at the end in parens.

REQ is an optional requirement.  If its true, then the friend must exist in
the friends cache.</span>"
  (let* ((cur-author (twit-get-text-property 'twit-user)))
    (completing-read prompt (twit-get-friends t) nil req nil nil cur-author)))


<span class="linecomment">;;* interactive direct</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-direct (user msg)
  "<span class="quote">Send USER a direct message MSG.

If you are currently positioned over a tweet, then it will fill in the author
of that tweet as the default recipient.

This will attempt to do a completing read based on the people you
are following, if you have images turned on.</span>"
  (interactive
   (list (twit-read-friend "<span class="quote">Direct Message To: </span>" t)
         (twit-query-for-post "<span class="quote">Message: </span>" "<span class="quote"></span>")))
  (if (&gt; (length msg) twit-max-tweet)
      (error twit-too-long-msg)
      (twit-direct-message user msg)))

<span class="linecomment">;;* interactive direct multi-account</span>
(defun twit-direct-with-account (account)
  "<span class="quote">Send a user a direct tweet with `twit-direct' under a different ACCOUNT.</span>"
  (interactive (list (twit-read-account)))
  (with-twit-account account
    (twit-direct (twit-read-friend "<span class="quote">Direct Message To: </span>" t)
                 (read-string "<span class="quote">Message: </span>"))))

<span class="linecomment">;;* post interactive tweet</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-post (prefix)
  "<span class="quote">Send a post to twitter.com.
Prompt the first time for password and username \(unless
`twit-user' and/or `twit-pass' is set\) and for the text of the
post; thereafter just for post text.  Posts must be &lt;= `twit-max-tweet' chars
long.

A PREFIX argument will prompt you for your post in reply to a
specific author that the cursor is nearest to.  This behavior may
become deprecated.</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((reply-to (when prefix
                     (twit-get-text-property 'twit-user)))
         (post (twit-query-for-post
                (if reply-to
                    (concat "<span class="quote">Reply to </span>" reply-to)
                    "<span class="quote">Post</span>")
                (when reply-to
                  (concat "<span class="quote">@</span>" reply-to "<span class="quote"> </span>")))))
    (if (&gt; (length post) twit-max-tweet)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post))))

<span class="linecomment">;;* post interactive tweet multi-account</span>
(defun twit-post-with-account (account post)
  "<span class="quote">Like `twit-post' but under a different ACCOUNT POST a tweet.</span>"
  (interactive (list (twit-read-account)
                     (twit-query-for-post "<span class="quote">Post: </span>" "<span class="quote"></span>")))
  (with-twit-account account
    (if (&gt; (length post) twit-max-tweet)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post))))

<span class="linecomment">;;* post interactive keymap</span>
(defun twit-post-to ()
  "<span class="quote">Posts to a particular user.  Mostly used by keymaps.</span>"
  (interactive)
  (let ((post (twit-query-for-post "<span class="quote">Reply To: </span>" (concat "<span class="quote">@</span>" (twit-get-text-property 'twit-user) "<span class="quote"> </span>"))))
    (if (&gt; (length post) twit-max-tweet)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post))))

<span class="linecomment">;;* post reply interactive</span>
(defun twit-post-reply ()
  "<span class="quote">Reply to a status on twitter.com.</span>"
  (interactive)
  (let* ((reply-to (twit-get-text-property 'twit-user))
         (parent-id (twit-get-text-property 'twit-id))
         (post (twit-query-for-post (concat "<span class="quote">Reply to </span>" reply-to)
                                    (concat "<span class="quote">@</span>" reply-to "<span class="quote"> </span>"))))
    (if (&gt; (length post) 140)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post parent-id))))

<span class="linecomment">;;* post "loud" reply interactive</span>
(defun twit-post-loud-reply ()
  "<span class="quote">Reply to a status on twitter.com.

When you write @foo, only those followers of yours who are also
following @foo will see the reply. To get around this, if you
want all of your followers to see the reply anyways begin the
tweet with \".@\" or some other filler character.</span>"
  (interactive)
  (let* ((reply-to (twit-get-text-property 'twit-user))
         (parent-id (twit-get-text-property 'twit-id))
         (post (twit-query-for-post (concat "<span class="quote">Loud reply to </span>" reply-to)
                                    (concat "<span class="quote">.@</span>" reply-to "<span class="quote"> </span>"))))
    (if (&gt; (length post) 140)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post parent-id))))

<span class="linecomment">;;* post retweet</span>
<span class="linecomment">;;  Begins a post with "RT @foo: waka waka waka || "</span>
(defun twit-post-retweet ()
  "<span class="quote">Retweet someone else's post.</span>"
  (interactive)
  (let* ((reply-to (twit-get-text-property 'twit-user))
         (parent-id (twit-get-text-property 'twit-id))
         (retweet-text (twit-get-text-property 'twit-message))
         (post (twit-query-for-post
                (concat "<span class="quote">Retweeting </span>" reply-to)
                (concat "<span class="quote">RT @</span>" reply-to "<span class="quote">: </span>" retweet-text "<span class="quote"> || </span>"))))
    (if (&gt; (length post) 140)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post parent-id))))

<span class="linecomment">;;* post url</span>
<span class="linecomment">;;  Prompts for a URL, then compresses it and starts a tweet with the shortened URL in the body</span>
(defun twit-post-url ()
  "<span class="quote">Compress a URL, then start posting a tweet with the result.</span>"
  (interactive)
  (let* ((url (compress-url (read-string "<span class="quote">URL: </span>")))
         (post (twit-query-for-post "<span class="quote">Post</span>" url)))
    (if (&gt; (length post) twit-max-tweet)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post))))

<span class="linecomment">;; Compresses given URL</span>
<span class="linecomment">;; Examples from other services:</span>
<span class="linecomment">;; TinyURL: http://tinyurl.com/api-create.php?url=</span>
<span class="linecomment">;; Tr.im (requires some kind of account or something?): http://api.tr.im/api/trim_simple?url=</span>
(defun compress-url (url)
  "<span class="quote">Compress a URL using is.gd.</span>"
  (let* ((returned-request
           (car (twit-parse-xml
                 (concat "<span class="quote">http://is.gd/api.php?longurl=</span>" url) "<span class="quote">GET</span>")))
          (url-idx (string-match "<span class="quote">http://</span>" returned-request 160))
          (compressed-url
           (if url-idx
               (substring returned-request url-idx -1)
               "<span class="quote">is.gd is down :(</span>")))
       compressed-url))


<span class="linecomment">;;* post interactive tweet</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-post-region (start end)
  "<span class="quote">Send text in the region as a post to twitter.com.

START and END should be the region you want to post.

Uses `twit-post-status' to do the dirty work and to obtain
needed user and password information.  Posts must be &lt;= `twit-max-tweet' chars
long.</span>"
  (interactive "<span class="quote">r</span>")
  (let ((post (buffer-substring start end)))
    (if (&gt; (length post) twit-max-tweet)
	(error twit-too-long-msg)
    (twit-post-status twit-update-url post))))

<span class="linecomment">;;* post interactive</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-post-buffer ()
  "<span class="quote">Post the entire contents of the current buffer to twitter.com.
Uses `twit-post-status' to do the dirty work and to obtain
needed user and password information.  Posts must be &lt;= `twit-max-tweet' chars
long.</span>"
  (interactive)
  (let ((post (buffer-substring (point-min) (point-max))))
    (if (&gt; (length post) twit-max-tweet)
        (error twit-too-long-msg)
        (twit-post-status twit-update-url post))))

<span class="linecomment">;;* friend post add</span>
(defun twit-add-friend (user)
  "<span class="quote">USER name of person you want to follow.</span>"
  (interactive (list (twit-read-friend "<span class="quote">Add Friend: </span>")))
  (twit-post-function (format twit-add-friend-url user)
                      (concat "<span class="quote">follow=true&screen_name=</span>"
                              (url-hexify-string user))
                      twit-add-friend-success-msg
                      twit-add-friend-fail-msg))

<span class="linecomment">;;* friend post remove</span>
(defun twit-remove-friend (user)
  "<span class="quote">USER name of person you want to follow.</span>"
  (interactive (list (twit-read-friend "<span class="quote">Remove Friend: </span>" t)))
  (twit-post-function (format twit-remove-friend-url user)
                      (concat "<span class="quote">screen_name=</span>" (url-hexify-string user))
                      twit-remove-friend-success-msg
                      twit-remove-friend-fail-msg))

<span class="linecomment">;;* favorite add post</span>
(defun twit-add-favorite (post)
  "<span class="quote">Add a POST as a favorite.</span>"
  (interactive (list (read-from-minibuffer
                      (format "<span class="quote">Tweet to Favorite (%s): </span>"
                              (twit-get-text-property 'twit-id))
                      nil
                      nil
                      nil
                      nil
                      (twit-get-text-property 'twit-id))))
  (twit-post-function
   (format twit-add-favorite-url
           (if (not (string-equal "<span class="quote"></span>" post))
               post (twit-get-text-property 'twit-id)))
   "<span class="quote"></span>"
   twit-add-favorite-success-msg
   twit-add-favorite-fail-msg))

<span class="linecomment">;;* favorite remove post</span>
(defun twit-remove-favorite (post)
  "<span class="quote">Add a POST as a favorite.</span>"
  (interactive (list (read-from-minibuffer
                      (format "<span class="quote">Remove Tweet From Favorites (%s): </span>"
                              (twit-get-text-property 'twit-id))
                      nil
                      nil
                      nil
                      nil
                      (twit-get-text-property 'twit-id))))
  (twit-post-function
   (format twit-remove-favorite-url
           (if (not (string-equal "<span class="quote"></span>" post))
               post (twit-get-text-property 'twit-id)))
   "<span class="quote"></span>"
   twit-remove-favorite-success-msg
   twit-remove-favorite-fail-msg))

<span class="linecomment">;;* show followers interactive</span>
<span class="linecomment">;; minor modes might be a cause of the memoryleak, see about removing them</span>
<span class="linecomment">;; this is too delicate, depending on the order of the xml elements, and not</span>
<span class="linecomment">;; the actual xml elements.</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-show-followers (&optional page)
  "<span class="quote">Display a list of all your twitter.com followers' names.</span>"
  (interactive "<span class="quote">P</span>")
  (setq page (twit-check-page-prefix page))
  (pop-to-buffer
   (with-twit-buffer "<span class="quote">*Twit-followers*</span>"
     (twit-write-title "<span class="quote">Followers\n</span>")
	 (loop for name in
		   (loop for name in
				 (loop for user in
					   (xml-get-children
						(cadr (twit-parse-xml (format twit-followers-list-url page) "<span class="quote">GET</span>")) 'user)
					   collect (eighth user))
				 collect (third name))
		   for i upfrom 1
		   do (insert (propertize (format "<span class="quote">%s\n</span>" name)
								  'face
								  (if (= 0 (% i 2))
									  "<span class="quote">twit-zebra-1-face</span>"
									  "<span class="quote">twit-zebra-2-face</span>")
								  'twit-user name))))))

(defalias 'twit-list-followers 'twit-show-followers
  "<span class="quote">The name twit-list-followers is deprecated.  Use `twit-show-followers' instead.</span>")

<span class="linecomment">;;* show friends interactive</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-show-friends ()
   "<span class="quote">Display a list of all your friends.</span>"
   (interactive)
   (pop-to-buffer
    (with-twit-buffer "<span class="quote">*Twit-friends*</span>"
      (let ((friends (twit-get-friends)))
        (twit-write-title (format "<span class="quote">Friends (%s):\n</span>" (length friends)))
        (loop for i upfrom 1
           for f in friends do
             (insert (propertize (concat f "<span class="quote">\n</span>")
                                 'twit-user f
                                 'face (if (= 0 (% i 2))
                                           "<span class="quote">twit-zebra-1-face</span>"
                                           "<span class="quote">twit-zebra-2-face</span>"))))))))

<span class="linecomment">;;* twit follow timer interactive</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-follow-recent-tweets ()
  "<span class="quote">Set up a timer, and show you the most recent tweets approx every 90 seconds.

You can change the time between each check by customizing
`twit-follow-idle-interval'.</span>"
  (interactive)
  (twit-show-recent-tweets nil)
  (twit-verify-and-set-rate-limit (twit-get-rate-limit))
  (setq twit-rate-limit-timer
        (run-with-timer twit-rate-limit-interval
                        twit-rate-limit-interval
                        'twit-get-and-set-async-rate-limit))
  (setq twit-timer
        (run-with-timer twit-shadow-follow-idle-interval
                        twit-shadow-follow-idle-interval
                        'twit-follow-recent-tweets-timer-function)))

<span class="linecomment">;;* twit follow timer interactive</span>
(defun twit-stop-following-tweets ()
  "<span class="quote">When you want to stop following tweets, you can use this function to turn off the timer.</span>"
  (interactive)
  (if (featurep 'todochiku)
      (todochiku-message "<span class="quote">Twit.el</span>" "<span class="quote">Twit.el Stopped Following Tweets</span>"
                         (todochiku-icon 'social)))
  (cancel-timer twit-timer)
  (cancel-timer twit-rate-limit-timer))

<span class="linecomment">;;* tweet show  interactive</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-show-recent-tweets (&optional page)
  "<span class="quote">Display a list of the most recent tweets from people you're following.

You can use a prefix argument (C-u &lt;number&gt;) to skip between pages.  If you are
following tweets by using `twit-follow-recent-tweets', these might get
overwritten. (let me know if that behavior bugs you, and I will make
follow-tweets write into a different buffer.)

Currently there is a bug where the first time you show tweets, it might come up
empty.  This is being worked on.

With a numeric prefix arg PAGE, it will skip to that page of tweets.

Patch version from Ben Atkin.</span>"
  (interactive "<span class="quote">P</span>")
  (setq page (twit-check-page-prefix page))
  (pop-to-buffer
   (with-twit-buffer "<span class="quote">*Twit-recent*</span>"
     (twit-write-title "<span class="quote">Recent Tweets (Page %s) [%s]\n</span>"
                       page (format-time-string "<span class="quote">%c</span>"))
     (twit-write-recent-tweets
      (twit-parse-xml (format twit-friend-timeline-file page) "<span class="quote">GET</span>")))))


<span class="linecomment">;;* interactive nav</span>
(defun twit-next-tweet (&optional arg)
  "<span class="quote">Move forward to the next tweet.
 
With argument ARG, move to the ARGth next tweet.</span>"
  (interactive "<span class="quote">p</span>")
  (mapc (lambda (n)
          (goto-char (next-single-char-property-change (point) 'twit-id nil
                                                       (point-max))))
        (number-sequence 1 (or arg 1))))

<span class="linecomment">;;* interactive nav</span>
(defun twit-previous-tweet (&optional arg)
  "<span class="quote">Move backward to the previous tweet.
 
With argument ARG, move to the ARGth previous tweet.</span>"
  (interactive "<span class="quote">p</span>")
  (mapc (lambda (n)
          (goto-char (previous-single-char-property-change (point) 'twit-id nil
                                                           (point-min))))
        (number-sequence 1 (or arg 1))))

<span class="linecomment">;;* search helper var</span>
(defvar twit-this-sessions-searches 'nil
  "<span class="quote">A variable to store any searches that the user has already searched for this session.</span>")

<span class="linecomment">;;* interactive search</span>
(defun twit-search (term)
  "<span class="quote">Run a twitter search for TERM.
Note that this is currently \"in beta\". It will get better.</span>"
  (interactive
   (list (completing-read "<span class="quote">Search Term: </span>"
                          (append twit-completing-searches twit-this-sessions-searches)
                          nil
                          nil
                          (twit-get-text-property 'twit-search))))
  (when (not (or (member term twit-completing-searches)
                 (member term twit-this-sessions-searches)))
    (setq twit-this-sessions-searches (cons term twit-this-sessions-searches)))
  (pop-to-buffer
   (with-twit-buffer (concat "<span class="quote">*Twit-Search-</span>" (url-hexify-string term) "<span class="quote">*</span>")
     (twit-write-search (twit-parse-xml (format twit-search-url
                                                (url-hexify-string term))
                                        "<span class="quote">GET</span>")))))

<span class="linecomment">;;* direct show interactive</span>
<span class="linecomment">;; minor modes might be a cause of the memoryleak, see about removing them</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-show-direct-tweets (page)
  "<span class="quote">Display a list of the most recent direct tweets.

With a numeric prefix argument, it will skip to that PAGE like `twit-show-recent-tweets'.</span>"
  (interactive "<span class="quote">P</span>")
  (setq page (twit-check-page-prefix page))
  (pop-to-buffer
   (with-twit-buffer "<span class="quote">*Twit-direct*</span>"
     (twit-write-title "<span class="quote">Direct Messages (page %s) [%s]\n</span>"
                       page (format-time-string "<span class="quote">%c</span>"))
     (let ((times-through 0))
       (dolist
           (msg-node (xml-get-children
                      (cadr (twit-parse-xml
                             (format twit-direct-msg-get-url page) "<span class="quote">GET</span>"))
                      'direct_message))
         (twit-write-tweet msg-node nil times-through)
         (setq times-through (+ 1 times-through)))))))

<span class="linecomment">;;* direct show interactive multi-account</span>
(defun twit-show-direct-tweets-with-account (account page)
  "<span class="quote">`twit-show-direct-tweets' with a different account.</span>"
  (interactive (list (twit-read-account)
                     current-prefix-arg))
  (with-twit-account account (twit-show-direct-tweets page)))

<span class="linecomment">;;* at-you show interactive</span>
<span class="linecomment">;;;###autoload</span>
(defun twit-show-at-tweets (page)
  "<span class="quote">Display a list of tweets that were @ you.

With a numeric prefix argument, it will skip to that PAGE like `twit-show-recent-tweets'.</span>"
  (interactive "<span class="quote">P</span>")
  (setq page (twit-check-page-prefix page))
  (pop-to-buffer
   (with-twit-buffer (concat "<span class="quote">*Twit-at-</span>" twit-user "<span class="quote">*</span>")
     (twit-write-title "<span class="quote">Twit @%s (Page %s) %s\n</span>"
                       twit-user page (format-time-string "<span class="quote">%c</span>"))
     (let ((times-through 0))
       (dolist
           (status-node (xml-get-children
                         (cadr (twit-parse-xml
                                (format twit-mentions-url page) "<span class="quote">GET</span>"))
                         'status))
         (twit-write-tweet status-node t times-through)
         (setq times-through (+ 1 times-through)))))))

<span class="linecomment">;;* at-you show interactive multi-account</span>
(defun twit-show-at-tweets-with-account (account page)
  "<span class="quote">`twit-show-at-tweets-with-account' with a different account.</span>"
  (interactive (list (twit-read-account)
                     current-prefix-arg))
  (with-twit-account account (twit-show-at-tweets page)))

(defalias 'twit-search-at-to-me 'twit-show-at-tweets
  "<span class="quote">Aliased to `twit-show-at-tweets', does the same thing with a better interface.</span>")

(defun twit-visit-link ()
  "<span class="quote">Vist a link under the point.

If the point is under a hyperlink, goto that link.
If the point is under an @user, go to that users page.
Otherwise goto the authors page.</span>"
  (interactive)
  (browse-url (or (twit-get-text-property 'twit-url)
	   		      (when (twit-get-text-property 'twit-user)
						(concat "<span class="quote">http://twitter.com/</span>"
								(twit-get-text-property 'twit-user))))))

(defun twit-open-link ()
  "<span class="quote">Visit (open) the first URL in current tweet.

Check if the tweet under the point contains a URL, and visit the
URL if there is one.  The point does not have to be pointing to
the URL itself.</span>"
  (interactive)
  (let* ((end (next-single-char-property-change (point) 'twit-id))
		 (start (save-excursion
				  (goto-char end)
				  (previous-single-char-property-change (point) 'twit-id))))
	(save-excursion
	  (goto-char start)
	  (if (search-forward-regexp twit-url-regex end t)
		  (progn
			(forward-char -1)
			(twit-visit-link))
		(message "<span class="quote">No URL found in this tweet!</span>")))))

<span class="linecomment">;;* analyse interactive</span>
(defun twit-analyse-user ()
  "<span class="quote">Analyse the user under the point with Twanalyst.</span>"
  (interactive)
  (browse-url (format twit-analyse-user-url (if (twit-get-text-property 'twit-user)
												(twit-get-text-property 'twit-user)
												twit-user))))

<span class="linecomment">;;* analyse interactive</span>
(defun twit-analyse-graph-user ()
  "<span class="quote">Graph tweets and followers over time with Twanalyst.</span>"
  (interactive)
  (browse-url (format twit-analyse-graph-user-url (if (twit-get-text-property 'twit-user)
													  (twit-get-text-property 'twit-user)
													  twit-user))))

<span class="linecomment">;;* analyse interactive</span>
(defun twit-analyse-suggest-user ()
  "<span class="quote">Show other users that you should follow with Twanalyst.</span>"
  (interactive)
  (browse-url (format twit-analyse-suggest-user-url (if (twit-get-text-property 'twit-user)
														(twit-get-text-property 'twit-user)
														twit-user))))

<span class="linecomment">;;* install interactive</span>
(defun twit-install-elisp ()
  "<span class="quote">Install the elisp library at point.

This function assumes that the elisp library is at Emacs Wiki, and that you
have auto-install installed.</span>"
  (interactive)
  (if (featurep 'auto-install)
      (let ((file  (twit-get-text-property 'elisp)))
        (if file
            (auto-install-from-emacswiki file)
            (error "<span class="quote">Not on an elisp library, cannot auto-install.</span>")))
      (error "<span class="quote">Cannot auto-install elisp library, because auto-install is not installed.</span>")))

<span class="linecomment">;;* multi-account interactive</span>
(defun twit-switch-account (account)
  "<span class="quote">Switch twitter account to ACCOUNT.

ACCOUNT should be the account name that was set up in `twit-multi-accounts'.</span>"
  (interactive (list (twit-read-account)))
  (let ((acc (assoc-string account twit-multi-accounts)))
    (twit-set-auth (car acc) (cdr acc))))

<span class="linecomment">;;* mode</span>
<span class="linecomment">;;;###autoload</span>
(define-minor-mode twit-minor-mode
    "<span class="quote">Toggle twit-minor-mode, a minor mode that binds some keys for posting.
Globally binds some keys to Twit's interactive functions.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

\\{twit-minor-mode-map}</span>" nil
"<span class="quote"> Twit</span>"
'(("<span class="quote">\C-c\C-tp</span>" . twit-post)
  ("<span class="quote">\C-c\C-tr</span>" . twit-post-region)
  ("<span class="quote">\C-c\C-tb</span>" . twit-post-buffer)
  ("<span class="quote">\C-c\C-tf</span>" . twit-show-followers)
  ("<span class="quote">\C-c\C-ts</span>" . twit-show-recent-tweets))
  :global t
  :group 'twit
  :version twit-version-number)
(provide 'twit)


<span class="linecomment">;;* testing auth</span>
(when nil

	  (with-twit-auth "<span class="quote">twit_el</span>" twit-pass
		(message "<span class="quote">auth: %s</span>" (symbol-value url-basic-auth-storage))
		(twit-post-status twit-update-url "<span class="quote">Testing again.  Hopefully authentication works this time.</span>"))

	  (with-twit-auth "<span class="quote">jonnay</span>" twit-pass
		(message "<span class="quote">auth: %s</span>" (symbol-value url-basic-auth-storage))
		(twit-show-recent-tweets))
	  
	  )

<span class="linecomment">;;* testing</span>
(when nil
  
  (shell-command "<span class="quote">emacs --no-site-file --no-init-file &</span>" nil nil)
  <span class="linecomment">;; copy/paste to new emacs instance.</span>
  (load "<span class="quote">~/my-elisp/twit.el</span>")
  (twit-show-recent-tweets)
  (twit-follow-recent-tweets)
  )

<span class="linecomment">;;* posting</span>
(when nil
	  (let* ((summary "<span class="quote"> - 0.3.3  - Auto-install function added.  When you are over text 
            that matches the name of an elisp file, you can press 
            \"i\" to install that file from emacs wiki, provided you 
            have auto-install.		</span>")
         (short-summary "<span class="quote">Auto-install magick. Press i on an emacs library in a tweet to install it.</span>")
         (twit-post (format "<span class="quote">New #twit.el: http://www.emacswiki.org/emacs-en/twit.el . V %s %s</span>" twit-version-number short-summary)))
    (yaoddmuse-post-library "<span class="quote">twit.el</span>" "<span class="quote">EmacsWiki</span>" "<span class="quote">twit.el</span>" summary t)
    (twit-post-status twit-update-url twit-post)
    (with-twit-auth "<span class="quote">twit_el</span>" twit-pass (twit-post-status twit-update-url twit-post))
    (twit-show-recent-tweets))
  )

<span class="linecomment">;; Local Variables:</span>
<span class="linecomment">;; tab-width: 4</span>
<span class="linecomment">;; end:</span>

<span class="linecomment">;;; twit.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=twit.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=twit.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=twit.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=twit.el">Administration</a></span><span class="time"><br /> Last edited 2009-10-24 04:04 UTC by <a class="author" title="from 209.219.141.174" href="http://www.emacswiki.org/emacs/BaoqiuCui">BaoqiuCui</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=twit.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
