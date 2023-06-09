#!/bin/bash

# Update the Amazon Linux instance
sudo yum update -y

# Install Python and pip
sudo yum install -y python3 python3-pip

# Install required Python packages
pip3 install boto3 openai

# Create a chatbot Python script (mychatbot.py)
echo '
import boto3
import openai

# Configure OpenAI API credentials
openai.api_key = "YOUR_OPENAI_API_KEY"

# Define a function for text-to-speech conversion
def text_to_speech(text):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=text,
        max_tokens=200,
        temperature=0.8,
        n=1,
        stop=None
    )
    return response.choices[0].text.strip()

# Define a simple chatbot
def chatbot():
    while True:
        user_input = input("User: ")
        response = text_to_speech(user_input)
        print("Chatbot: " + response)

# Start the chatbot
chatbot()
' > mychatbot.py

# Provide execute permissions to the script
chmod +x mychatbot.py
