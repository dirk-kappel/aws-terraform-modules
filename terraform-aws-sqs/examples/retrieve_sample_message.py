import boto3
import json
import time

class SQSConsumer:
    def __init__(self, queue_url, region='us-east-1', wait_time=20, max_messages=10):
        """
        Initialize the SQS consumer with the queue URL and configuration.
        
        Args:
            queue_url (str): The URL of the SQS queue
            region (str): AWS region name
            wait_time (int): Long polling wait time in seconds (0-20)
            max_messages (int): Maximum number of messages to retrieve per request (1-10)
        """
        self.queue_url = queue_url
        self.sqs = boto3.client('sqs', region_name=region)
        self.wait_time = wait_time
        self.max_messages = max_messages
    
    def receive_messages(self):
        """
        Receive messages from the SQS queue using long polling.
        
        Returns:
            list: List of received message objects
        """
        response = self.sqs.receive_message(
            QueueUrl=self.queue_url,
            AttributeNames=['All'],
            MessageAttributeNames=['All'],
            MaxNumberOfMessages=self.max_messages,
            WaitTimeSeconds=self.wait_time
        )
        
        return response.get('Messages', [])
    
    def delete_message(self, receipt_handle):
        """
        Delete a message from the queue using its receipt handle.
        
        Args:
            receipt_handle (str): The receipt handle of the message to delete
        """
        self.sqs.delete_message(
            QueueUrl=self.queue_url,
            ReceiptHandle=receipt_handle
        )
    
    def process_messages(self, callback=None):
        """
        Process messages from the queue. If a callback is provided, it will be
        called with each message. If not, messages will be printed to console.
        
        Args:
            callback (callable): Optional function to process each message
        """
        messages = self.receive_messages()
        
        if not messages:
            print("No messages received")
            return []
        
        processed_messages = []
        
        for message in messages:
            message_body = message['Body']
            receipt_handle = message['ReceiptHandle']
            
            try:
                # Try to parse as JSON
                message_data = json.loads(message_body)
            except json.JSONDecodeError:
                # Not JSON, use raw string
                message_data = message_body
            
            if callback:
                callback(message_data, message)
            else:
                print(f"Received message: {message_data}")
                
            # Automatically delete the message after processing
            self.delete_message(receipt_handle)
            processed_messages.append(message_data)
        
        return processed_messages
    
    def poll_queue(self, callback=None, polling_interval=0, max_polls=None):
        """
        Continuously poll the queue for messages.
        
        Args:
            callback (callable): Optional function to process each message
            polling_interval (int): Time to wait between polling attempts in seconds
            max_polls (int): Maximum number of polling attempts (None for infinite)
        """
        polls = 0
        
        while max_polls is None or polls < max_polls:
            self.process_messages(callback)
            
            if polling_interval > 0:
                time.sleep(polling_interval)
                
            polls += 1


# Example usage
if __name__ == "__main__":
    # Replace with your SQS queue URL
    QUEUE_URL = "https://sqs.us-east-1.amazonaws.com/725857994970/example-sqs"
    
    # Create consumer instance
    consumer = SQSConsumer(
        queue_url=QUEUE_URL,
        region="us-east-1",  # Change to your region
        wait_time=20,  # Long polling wait time in seconds
        max_messages=10  # Max messages per request
    )
    
    # Example 1: Simple polling
    print("Polling for messages...")
    consumer.process_messages()
    
    # Example 2: Custom message handler
    def handle_message(message_data, raw_message):
        print(f"Processing message: {message_data}")
        # Your custom processing logic here
    
    # Example 3: Continuous polling with custom handler
    # consumer.poll_queue(
    #     callback=handle_message,
    #     polling_interval=5,  # Wait 5 seconds between polls
    #     max_polls=3  # Poll 3 times and then stop
    # )