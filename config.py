USERNAME = "myuser"   # your username
PASSWORD = "dAP4s50rD!"   # your password (cleartexted... I plan to hash this, though, because it's ugly)
SECRET_KEY = "shwerthungheafDoWrefKighEsckititowkEybRaicduwur" # add a secret key (smashing your keyboard furiously can do)
ROOT = "/srv/Gullom/"       # The absolute path of your app. (Used because saving image with relative
                # path was a bit of a pain).
DATABASE = ROOT + "giffy.db"   # Absolute path to the DB. So if it's a "giffy.db" file in your app folder,
                # you can do a ROOT + "giffy.db".
