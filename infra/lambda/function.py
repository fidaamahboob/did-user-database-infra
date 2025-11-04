import json

def lambda_handler(event, context):
    try:
        # Parse the input event
        print("Received event:", json.dumps(event))
        
        # Add your business logic here
        
        # Prepare the response
        response = {
            'statusCode': 200,
            'body': json.dumps({
                'message': 'Successfully executed'
            })
        }
        
        return response
        
    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({
                'error': str(e)
            })
        }