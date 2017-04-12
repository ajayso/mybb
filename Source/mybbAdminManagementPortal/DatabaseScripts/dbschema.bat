$STORAGE_SETTINGS_TABLE="StorageSettings"
echo "Creating DynamoDB Table $STORAGE_SETTINGS_TABLE begin..."
aws dynamodb create-table --table-name $STORAGE_SETTINGS_TABLE \
		AttributeName=DeploymentName,AttributeType=S \
		AttributeName=OperationalEMail,AttributeType=S \
		AttributeName=WWWInstanceType,AttributeType=S \
		AttributeName=WWWTargetCount,AttributeType=S \
		AttributeName=DBInstanceClass,AttributeType=S \
		AttributeName=DBName,AttributeType=S \
		AttributeName=DBUsername,AttributeType=S \
		AttributeName=DBPassword,AttributeType=S \
		AttributeName=DBPort,AttributeType=S \
		AttributeName=SSHKeyName,AttributeType=S \
		AttributeName=SSHAccess,AttributeType=S \
		AttributeName=BillingThreshold,AttributeType=S \
    --key-schema AttributeName=DeploymentName,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
		--region $REGION
echo "Creating DynamoDB Table $STORAGE_SETTINGS_TABLE end (creation still in progress)"