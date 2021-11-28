# -*- coding: utf-8 -*-
import os
from flask import Flask, jsonify, render_template, request
from flask_mysqldb import MySQL
from flask_redis import FlaskRedis

app = Flask(__name__)
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '718399'
app.config['MYSQL_DB'] = 'test'
app.config['MYSQL_CUESORCLASS'] = 'DictCursor'

mysql = MySQL(app)
redis_store = FlaskRedis(app)

CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"


def encode(num):
    if num == 0:
        return CHARS[0]
    res = []
    while num:
        num, rem = divmod(num, len(CHARS))
        res.append(CHARS[rem])
    return ''.join(reversed(res))

@app.route('/generator',methods=['GET'])
def index():
    return '<h1>Hello,UniqueStudio</h1>'

@app.route('/generator',methods=['POST'])
def run():
    long_url = request.json['url']
    index = int(redis_store.incr('SHORT_CNT'))
    token = encode(index)
    sql = "INSERT INTO short_url(token, url) VALUES(%s, %s)"
    cur = mysql.connection.cursor()
    cur.execute(sql, (token, long_url))
    mysql.connection.commit()
    short_url = 'https://127.0.0.1:5000/' + token
    return jsonify(url=short_url)