
SUMMARY
-------

RubyLakeCMS is Content Management System, developed by Scrum2B team.
We build RubyLakeCMS as a lightweght application to make it more simple to create a website (like News webpage, Blog webpage and Company webpage...)
It is planed to includes some advance features like: SNS integration, Theme support, Plugin support as well as SEO support. 


LICENSE
------------

RubyLakeCMS is open source and released under the terms of the GNU General Public License v2 (GPL)  (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)


INSTALLATION
------------

Clone the app from GitHub: 
    
    $ git clone git@github.com:haibt/rubylake-cms.git
    $ cd rubylake-cms

Update your bundle

    $ bundle install
    
Update database information:

    $ cp config/database.yml.development config/database.yml
    $ vi config/database.yml

Create SQLite databases if you set configuration to use SQLite3

    $ bundle exec rake db:create
    
Use the install generator to copy migrations, initializers and generate
sample data.

You can always perform the steps later.

    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed

Update Facebook information:

    $ cp config/facebook.yml.development config/facebook.yml
    $ vi config/facebook.yml

Create admin account:

    $ rails c
    > User.create(:email => "admin@admin.com", :password => "123456", :password_confirmation => "123456", :is_admin => true)
    > exit
    

(to be continue...)


Running App
-------------

Start the server:
    
    $ rails s

Open a browser (like Chrome) to access the URL: 
    S
    http://localhost:3000/


For developers
-------------

Change to use "develop" branch for developers:

    $ git checkout -b develop origin/develop

Commit codes
	
	$ git fetch --all
	$ git merge origin/develop
	$ git commit -m "Message Content in here"
	$ git push -u origin develop


Running Tests
-------------

(to be continue...)

