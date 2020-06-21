### Install postgres and other needed apps on local system
    sudo apt install -y postgresql postgresql-contrib pgadmin3 libdbi-perl libpq-dev \
        imagemagick libdbd-pg-perl libjson-pp-perl libjson-perl libfile-slurp-perl aha
Note: aha can be used for conversion bash ascii-colored output to html file.

### Change postgres user password
    sudo -u postgres psql
and then, in psql, type:
    \password
and change current empty default password for postgres user to "postgres".
To quit from psql:
    \q
or press Ctrl+Z.
Or
    sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

### Create sal DB and add sal role (password: sal)
    sudo -u postgres createuser --interactive    # and add sal user as superuser
    sudo -u postgres psql -c "create database sal;"     # or in bash: createdb sal
    #sudo -u postgres psql -c "create user sal with encrypted password 'sal';" # probably not needed
    sudo -u postgres psql -c "grant all privileges on database sal to sal;"
    sudo systemctl restart postgresql

### Remember passwords in .pgpass (to not bother typing them for each psql command)
    echo "127.0.0.1:5432:*:postgres:postgres" >> ~/.pgpass
    echo "127.0.0.1:5432:*:sal:sal" >> ~/.pgpass
    chmod u-x,go-rwx ~/.pgpass

### Allow passwordless psql run (disable interactive asking for passwords)
    sudo systemctl stop postgresql
    pgver=9.5 # in case of ubuntu 16 with postgres 9.5
    pgver=10   #in case of ubuntu 18 with postgres 10
    pgver=$(ls /etc/postgresql) # automatically detect which version installed
    sudo chmod 777 /etc/postgresql/$pgver/main/*
    echo "local   all   all                  trust" >>/etc/postgresql/$pgver/main/pg_hba.conf ## better add this to start of the file
    echo "host    all   all   127.0.0.1/32   trust" >>/etc/postgresql/$pgver/main/pg_hba.conf
    sudo systemctl start postgresql






# Other
Probably needed in ~/.bashrc file:
    export Language=C
    export LC_MESSAGES=C
