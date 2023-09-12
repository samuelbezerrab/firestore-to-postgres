## Install dependencies

On root directory run:
```npm install -g json2csv && yarn install && brew install postgresql@14```

## Generate a Firebase private key

1. Log in to your Firebase Console and open your project.
2. Click the gear icon next to Project Overview in the sidebar and select Project Settings.
3. Click Service Accounts and select Firebase Admin SDK.
4. Click Generate new private key.
5. Place the file at ./firestore2json/firebase-service.json.

# Config variables
Go to migrate_table.sh and replace the variables with your desired variables.

# Run the script
Now you can run the script `sh migrate_table.sh`.
