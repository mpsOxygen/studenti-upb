from datetime import datetime

def application(environ, start_response):
    status = '200 OK'
    headers = [('Content-type', 'text/plain; charset=utf-8')]
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    response_body = f'{current_time} Hello, studenti UPB!\n'.encode('utf-8')
    start_response(status, headers)
    return [response_body]


