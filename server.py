import os
import requests
from bottle import response, route, static_file, template, run

STATIC_PATH='/static'
SAMPLE_DATA_FN='data/winequality-red.csv'

@route('/')
def index():
    return template('index.tpl', static_path=STATIC_PATH)

@route('%s/<filename:path>' % STATIC_PATH)
def send_static(filename):
    return static_file(filename, root='public')

@route('/gist/<username>/<gid>')
def raw_gist(username, gid):
    r = requests.get('https://gist.github.com/%s/%s/raw' % (username, gid))
    response.status = r.status_code
    response.set_header('content-type', r.headers.get('content-type'))
    return r.text
    
if __name__ == '__main__':
    if os.environ.get('BOTTLE_DEV'):
        run(host='0.0.0.0', port=8080, reloader=True, debug=True) 
    else:
        run(host='0.0.0.0', port=8080) 