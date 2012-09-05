
SUMMARY
-------

(to be continue...)


Installation the app
------------

Clone the app from GitHub: 
    
    $ git clone git@github.com:haibt/rubylake-cms.git
    $ cd rubylake-cms

Change to use "develop" branch for developers:

    $ git checkout -b develop origin/develop

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
    
    http://localhost:3000/


Running Tests
-------------

(to be continue...)


LICENSE
------------

Copyright (c) 2012 Scrum2B Team,

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
