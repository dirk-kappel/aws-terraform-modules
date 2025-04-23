import boto3
import json
import uuid
from datetime import datetime

# Variables
AWS_REGION='us-east-1'
QUEUE_URL='https://sqs.us-east-1.amazonaws.com/725857994970/example-sqs'

# Create SQS client
sqs = boto3.client('sqs', region_name=AWS_REGION)

# Message data with attributes that could be used for DynamoDB
message_data = {
    "name": "John Doe",
    "address": {
        "street": "123 Main St",
        "city": "Anytown",
        "state": "CA",
        "zip": "12345"
    },
    "response_text": "This is my detailed answer to the questionnaire...",
    "questions_answered": ["q1", "q2", "q3"],
    "submission_date": "2025-04-23T14:30:00Z"
}

# Send message to SQS queue with attributes
response = sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody=json.dumps(message_data),
    MessageAttributes={
        "ResponseType": {
            "StringValue": "Questionnaire",
            "DataType": "String"
        },
        "Priority": {
            "StringValue": "Normal",
            "DataType": "String"
        },
        "QuestionnaireId": {
            "StringValue": "survey-2025-04",
            "DataType": "String"
        },
        "ResponseComplete": {
            "StringValue": "true",
            "DataType": "String"
        }
    }
)

print(f"Message sent! MessageId: {response['MessageId']}")