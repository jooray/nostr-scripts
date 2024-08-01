import subprocess
import sys
import time
import json

if len(sys.argv) < 2:
  print("Error: Not enough arguments provided, I need a relay.")
  sys.exit(1)

relay = sys.argv[1]

data = []
for line in sys.stdin:
  try:
    item = json.loads(line)
    data.append(item)
  except json.JSONDecodeError as e:
    print(f"Error decoding JSON: {e}", file=sys.stderr)
    continue

# Execute the binary for each element in the JSON array
for item in data:
    # Replace 'binary_path' with the actual path to your binary executable
    process = subprocess.Popen(['nak','event', relay], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    process.stdin.write(json.dumps(item).encode('utf-8'))  # Send the item as a JSON string to the process's stdin
    process.stdin.flush()
    output, error = process.communicate()

    # Print the output and error (if any) for debugging purposes
    print('Output:', output.decode('utf-8'))
    print('Error:', error.decode('utf-8'))

    time.sleep(1)
