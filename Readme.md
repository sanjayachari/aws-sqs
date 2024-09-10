1st terminal :

npm i 

npm start

2nd terminal:

uvicorn main:app


TESTING :

POST : http://localhost:8000/send_message

BODY : {
    "message":"This is test 2"
}


GET ALL MESSAGE:

http://127.0.0.1:8000/