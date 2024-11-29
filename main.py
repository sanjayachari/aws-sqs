from fastapi import FastAPI, HTTPException
import logging
import boto3
from botocore.exceptions import ClientError
import traceback
import os

app = FastAPI()

# Initialize the SQS client
access_key = os.getenv('AWS_ACCESS_KEY_ID')  # Use environment variable
secret_key = os.getenv('AWS_SECRET_ACCESS_KEY')  # Use environment variable
region_name = os.getenv('AWS_REGION', 'us-east-1')  # Use environment variable for region

try:
    sqs_client = boto3.client(
        service_name='sqs',
        aws_access_key_id=access_key,
        aws_secret_access_key=secret_key,
        region_name=region_name
    )
except ClientError as e:
    logging.error(f"AWS credentials error: {e}")
    raise HTTPException(status_code=500, detail="Failed to initialize AWS SQS client")

QUEUE_URL = os.getenv('QUEUE_URL')  # Use environment variable for queue URL

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.get("/test")
async def root():
    return {"message": "Hello World!"}

MAX_ATTEMPTS = 100
WAIT_TIME_SECONDS = 20

def get_all_messages_and_delete(queue_url):
    messages = []
    attempt = 0
    while True:
        try:
            response = sqs_client.receive_message(
                QueueUrl=queue_url,
                MaxNumberOfMessages=10,
                WaitTimeSeconds=WAIT_TIME_SECONDS
            )
            messages.extend(response.get('Messages', []))
            
            if not response.get('Messages'):
                break
            
            attempt += 1
            if attempt >= MAX_ATTEMPTS:
                logger.warning(f"Reached maximum attempts ({MAX_ATTEMPTS}) to receive messages.")
                break
        
        except Exception as e:
            logger.error(f"Error receiving messages: {str(e)}", exc_info=True)
            raise HTTPException(status_code=500, detail=f"{str(e)}\n{traceback.format_exc()}")
    
    delete_messages(queue_url, messages)
    
    return messages

def delete_messages(queue_url, messages):
    try:
        delete_message_batch = sqs_client.delete_message_batch(
            QueueUrl=queue_url,
            Entries=[{'Id': msg['MessageId'], 'ReceiptHandle': msg['ReceiptHandle']} for msg in messages]
        )
        logger.info(f"Successfully deleted {len(messages)} messages.")
    except Exception as e:
        logger.error(f"Error deleting messages: {str(e)}
