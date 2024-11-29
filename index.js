const { SQSClient, SendMessageCommand } = require('@aws-sdk/client-sqs');
const express = require('express');
const app = express();
const awsConfig = {
  region: 'us-east-1',
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,  // Use environment variable
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,  // Use environment variable
  },
};

app.use(express.json());
const sqsClient = new SQSClient(awsConfig);
const queueUrl = process.env.QUEUE_URL;  // Use environment variable for the queue URL

app.post('/send_message', async (req, res) => {
  console.log('req.body:', req.body);
  try {
    const command = new SendMessageCommand({
      MessageBody: req.body.message,
      QueueUrl: queueUrl,
      MessageAttributes: {
        OrderId: { DataType: 'String', StringValue: '4421x' },
      },
      MessageGroupId: 'your-message-group-id',
    });

    const result = await sqsClient.send(command);
    console.log(`Message sent successfully. Message ID: ${result.MessageId}`);
    res.json(result.MessageId);
  } catch (error) {
    console.error(error);
    res.status(500).send('Error sending message');
  }
});

app.listen(8000, () => {
  console.log('Server loading...');
});
