# Todo App
Simple "Todo app" using "Django", "Django Rest Framework", "MySQL", "React JS" + "Next JS" & "Flutter".

## Configure MySQL
First install "mysqlclient".
> pip install mysqlclient

Second, configure "mysql" into "system.py".
```python
DATABASES = {
    # 'default': {
    #     'ENGINE': 'django.db.backends.sqlite3',
    #     'NAME': BASE_DIR / 'db.sqlite3',
    # }

    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'todo', # database name
        'USER': 'root', 
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

