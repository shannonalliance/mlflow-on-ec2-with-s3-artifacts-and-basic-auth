from mlflow.server.auth.client import AuthServiceClient
client = AuthServiceClient("https://your.domain.name")
client.delete_user("usertodelete")
